import os
import sys 
sys.path.append(".")
import math
import time
import random
from itertools import combinations

import multiprocessing as mp
from dataclasses import dataclass

from sklearn.cluster import KMeans

import torch

from botorch.models.pairwise_gp import PairwiseGP, PairwiseLaplaceMarginalLogLikelihood

from botorch.acquisition import qExpectedImprovement
from botorch.fit import fit_gpytorch_model
from botorch.generation import MaxPosteriorSampling
from botorch.models import SingleTaskGP, ModelList
from botorch.optim import optimize_acqf
from botorch.test_functions import Ackley
from botorch.utils.transforms import unnormalize
from torch.quasirandom import SobolEngine

import gpytorch
import gpytorch.settings as gpts
from gpytorch.constraints import Interval
from gpytorch.kernels import MaternKernel, ScaleKernel, RFFKernel
from gpytorch.likelihoods import GaussianLikelihood
from gpytorch.mlls import ExactMarginalLogLikelihood
from gpytorch.priors import HorseshoePrior
from botorch.models.model_list_gp_regression import ModelListGP
from gpytorch.mlls.sum_marginal_log_likelihood import SumMarginalLogLikelihood

from botorch.models.transforms.input import Normalize
from botorch.acquisition.preference import AnalyticExpectedUtilityOfBestOption

from utils.utils import *

# DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
# DTYPE = torch.float if torch.cuda.is_available() else torch.double
DEVICE = torch.device("cpu")
DTYPE = torch.double

def samplesSobol(ndims, samples, seed=None):
    sobol = SobolEngine(dimension=ndims, scramble=True, seed=seed)
    return sobol.draw(n=samples).to(dtype=DTYPE, device=DEVICE)

@dataclass
class MorboState:
    dim: int
    batch_size: int
    length: float = 0.8
    length_min: float = 0.01
    length_max: float = 1.6
    failure_counter: int = 0
    failure_tolerance: int = 2
    success_counter: int = 0
    success_tolerance: int = 5
    restart_triggered: bool = False

    def update(self, success):
        if success:
            self.success_counter += 1
            self.failure_counter = 0
        else:
            self.success_counter = 0
            self.failure_counter += 1

        if self.success_counter == self.success_tolerance:  # Expand trust region
            self.length = min(2.0 * self.length, self.length_max)
            self.success_counter = 0
        elif self.failure_counter == self.failure_tolerance:  # Shrink trust region
            self.length /= 2.0
            self.failure_counter = 0

        if self.length < self.length_min:
            self.restart_triggered = True


class Morbo: 

    def __init__(self, nDims, nObjs, nameVars, typeVars, rangeVars, funcEval, refpoint, weights, nInit=2**4, batchSize=2, numRestarts=10, rawSamples=512, mcSamples=1024, nJobs=4): 
        self._nDims      = nDims
        self._nObjs      = nObjs
        self._nameVars   = nameVars
        self._typeVars   = typeVars
        self._rangeVars  = rangeVars
        self._funcEval   = funcEval
        self._name2index = {}
        for idx, name in enumerate(self._nameVars): 
            self._name2index[name] = idx
        self._refpoint = [refpoint] * self._nObjs
        self._weights = weights
        self._nInit = nInit
        self._numRestarts = numRestarts
        self._rawSamples = rawSamples
        self._batchSize = batchSize
        self._mcSamples = mcSamples
        self._nJobs = nJobs
        self._bounds = torch.tensor([[0.0] * self._nDims, [1.0] * self._nDims], \
                                    device=DEVICE, dtype=DTYPE)
        self._visited = {}
        self.p_comp = 0.25

    def _evalPoint(self, point): 
        values = []
        for idx, name in enumerate(self._nameVars): 
            typename = self._typeVars[idx]
            value = None
            if typename == "int": 
                value = int(round(point[idx] * (self._rangeVars[idx][1] - self._rangeVars[idx][0])) + self._rangeVars[idx][0])
            elif typename == "float": 
                value = point[idx] * (self._rangeVars[idx][1] - self._rangeVars[idx][0]) + self._rangeVars[idx][0]
            elif typename == "enum": 
                value = self._rangeVars[idx][int(round(point[idx] * (len(self._rangeVars[idx]) - 1)))] if len(self._rangeVars[idx]) > 1 else self._rangeVars[idx][0]
            else: 
                assert typename in ["int", "float", "enum"]
            assert not value is None
            values.append(value)
        name = str(list(point))
        if name in self._visited: 
            return self._visited[name]
        config = dict(zip(self._nameVars, values))
        score = self._funcEval(config)
        print("[Eval] Point:", config)
        print(" -> Result:", score)
        with open("historyMORBO.txt", "a+") as fout: 
            fout.write(str(config) + "\n")
            fout.write(str(score) + "\n")

        return score

    def evalPoint(self, point): 
        score = self._evalPoint(point).copy()
        for idx in range(len(score)):
            # here, will -score has some issues?: No. Cycle.
            score[idx] = -score[idx]

        return score

    def evalBatch(self, batch):
        if not isinstance(batch, torch.Tensor): 
            batch = torch.tensor(batch, dtype=DTYPE, device=DEVICE)
        results = []
        batch = batch.cpu().numpy()

        processes = []
        pool = mp.Pool(processes=self._nJobs)
        for jdx in range(batch.shape[0]):
            param = batch[jdx]
            process = pool.apply_async(self.evalPoint, (param, ))
            processes.append(process)
            time.sleep(0.01)
        pool.close()
        pool.join()

        for idx in range(batch.shape[0]):
            cost = processes[idx].get()
            results.append(cost)
        results = np.array(results)

        for idx in range(batch.shape[0]):
            name = str(list(batch[idx]))
            if not name in self._visited:
                self._visited[name] = list(-results[idx])

        return torch.tensor(results, device=DEVICE, dtype=DTYPE)

    def initSamples(self, ninit=None): 
        if ninit is None: 
            ninit = self._nInit
        initX = samplesSobol(self._nDims, ninit)
        initY = self.evalBatch(initX)
        return initX, initY

    def _generate_comparisons(self, y, p_comp=0.5, noise=0.25, replace=False):
        """Create pairwise comparisons with noise(delta-dominate)"""
        # generate all possible pairs of elements in y
        all_pairs = np.array(list(combinations(range(y.shape[0]), 2)))
        # randomly select n_comp pairs from all_pairs
        comp_pairs = all_pairs[
            np.random.choice(range(len(all_pairs)), int(len(all_pairs) * p_comp) + 1, replace=replace)
        ]

        # add gaussian noise to the latent y values
        c0 = y[comp_pairs[:, 0]] + (np.random.standard_normal(len(comp_pairs)) * noise)[:, None]
        c1 = y[comp_pairs[:, 1]] + (np.random.standard_normal(len(comp_pairs)) * noise)[:, None]

        # reverse_comp = (c0 < c1).numpy()
        reverse_comp = (c0 < c1).numpy().all(axis=-1)
        comp_pairs[reverse_comp, :] = np.flip(comp_pairs[reverse_comp, :], 1)
        comp_pairs = torch.tensor(comp_pairs).long()

        return comp_pairs

    def initModel(self, trainX, trainY): 
        models = []
        comparisons = self._generate_comparisons(trainY, p_comp=self.p_comp, noise=0.0)
        model = PairwiseGP(
            trainX,
            comparisons,
            input_transform=Normalize(d=trainX.shape[-1]),
        )
        mll = PairwiseLaplaceMarginalLogLikelihood(model.likelihood, model)
        return mll, model


    def getRegionHV(self, index):
        print("[getRegionPareto]", index)
        state = self._states[index]
        trainX = self._dataXY[index][0]
        trainY = self._dataXY[index][1]

        initX = trainX.cpu().numpy()
        initY = trainY.cpu().numpy()
        initParams = []
        initValues = []
        for idx, param in enumerate(list(initX)): 
            initParams.append(list(param))
            initValues.append(list(-initY[idx]))
        initParetoParams, initParetoValues = pareto(initParams, initValues)
        initHV = calcHypervolume(self._refpoint, initParetoValues)

        return initHV


    def getObservations(self, index, verbose=True):
        print("[GetObservations]", index)
        state = self._states[index]
        trainX = self._dataXY[index][0]
        trainY = self._dataXY[index][1]

        # Select the center
        hvc = []

        initX = trainX.cpu().numpy()
        initY = trainY.cpu().numpy()
        initParams = []
        initValues = []
        for idx, param in enumerate(list(initX)): 
            initParams.append(list(param))
            initValues.append(list(-initY[idx]))

        initParetoParams, initParetoValues = pareto(initParams, initValues)
        print(initParetoValues)
        initHV = calcHypervolume(self._refpoint, initParetoValues)

        for idx in range(initX.shape[0]): 
            newParams = []
            newValues = []
            for jdx, param in enumerate(list(initX)): 
                if idx == jdx: 
                    continue
                newParams.append(list(param))
                newValues.append(list(-initY[jdx]))
            newParetoParams, newParetoValues = pareto(newParams, newValues)
            newHV = calcHypervolume(self._refpoint, newParetoValues)
            newHVC = initHV - newHV
            hvc.append(newHVC)
        hvc = np.array(hvc)

        center = trainX[hvc.argmax(), :].clone()
        tr_lb = torch.clamp(center - state.length / 2.0, 0.0, 1.0)
        tr_ub = torch.clamp(center + state.length / 2.0, 0.0, 1.0)
        x_lb = torch.clamp(center - state.length, 0.0, 1.0)
        x_ub = torch.clamp(center + state.length, 0.0, 1.0)

        # Fit the model
        print("[Center]:", center)
        dataX = trainX
        dataY = trainY
        used = set()
        for idx in range(dataX.shape[0]): 
            used.add(str(dataX[idx]))
        indices = []
        for idx in range(self._dataAllX.shape[0]): 
            if torch.all(self._dataAllX[idx] <= x_ub) and torch.all(self._dataAllX[idx] >= x_lb) and not str(self._dataAllX[idx]) in used: 
                indices.append(idx)
                used.add(str(self._dataAllX[idx]))
        dataX = torch.cat([dataX, self._dataAllX[indices]])
        dataY = torch.cat([dataY, self._dataAllY[indices]])

        mll, model = self.initModel(dataX, dataY)
        fit_gpytorch_model(mll)

        # Pairwise Rank BO
        tr_lb = tr_lb.unsqueeze(0)
        tr_ub = tr_ub.unsqueeze(0)
        tr_bounds = torch.concat([tr_lb, tr_ub], axis=0)

        acq_func = AnalyticExpectedUtilityOfBestOption(pref_model=model)
        candidates, _ = optimize_acqf(
            acq_function=acq_func,
            bounds=tr_bounds,
            q=2,
            num_restarts=self._numRestarts,
            raw_samples=self._rawSamples,  # used for intialization heuristic
        )

        # observe new values
        newX = candidates.detach()
        newY = self.evalBatch(newX)

        return newX, newY

    def optimize(self, steps=2**4, regions=4, verbose=True): 
        self._states = []
        self._mlls   = []
        self._models = []
        self._dataXY = []
        self._dataAllX = None
        self._dataAllY = None

        # Initialize all regions
        trainAllX, trainAllY = self.initSamples(regions * self._nInit)
        trainAllX = trainAllX.cpu().numpy()
        trainAllY = trainAllY.cpu().numpy()
        kmeans = KMeans(n_clusters=regions)
        indices = kmeans.fit_predict(trainAllX)
        trainXs = [[] for _ in range(regions)]
        trainYs = [[] for _ in range(regions)]
        for idx in range(regions): 
            for jdx, region in enumerate(indices): 
                if idx == region: 
                    trainXs[idx].append(trainAllX[jdx])
                    trainYs[idx].append(trainAllY[jdx])
            assert len(trainXs[idx]) > 0
            assert len(trainYs[idx]) > 0
            trainXs[idx] = np.array(trainXs[idx])
            trainYs[idx] = np.array(trainYs[idx])
            trainXs[idx] = torch.tensor(trainXs[idx], dtype=DTYPE, device=DEVICE)
            trainYs[idx] = torch.tensor(trainYs[idx], dtype=DTYPE, device=DEVICE)

        initParams = []
        initValues = []

        for region in range(regions): 
            trainX, trainY = trainXs[region], trainYs[region]
            state = MorboState(dim=self._nDims, batch_size=self._batchSize)
            initX = trainX.cpu().numpy()
            initY = trainY.cpu().numpy()
            for idx in range(initX.shape[0]): 
                initParams.append(list(initX[idx]))
                initValues.append(list(-initY[idx]))
            self._states.append(state)
            self._dataXY.append([trainX, trainY])
            if self._dataAllX is None: 
                self._dataAllX = trainX
            else: 
                self._dataAllX = torch.cat([self._dataAllX, trainX])
            if self._dataAllY is None: 
                self._dataAllY = trainY
            else: 
                self._dataAllY = torch.cat([self._dataAllY, trainY])

        paretoParams, paretoValues = pareto(initParams, initValues)
        print(f'[Initial PARETO]: {paretoParams}, {paretoValues}')
        print(f'[Hypervolume]:', calcHypervolume(self._refpoint, paretoValues))

        for iter in range(steps): 
            for region in range(regions): 
                with gpytorch.settings.max_cholesky_size(float("inf")):
                    newX, newY = self.getObservations(region)

                self._dataXY[region][0] = torch.cat([self._dataXY[region][0], newX])
                self._dataXY[region][1] = torch.cat([self._dataXY[region][1], newY])
                self._dataAllX = torch.cat([self._dataAllX, newX])
                self._dataAllY = torch.cat([self._dataAllY, newY])

                paretoPrev = str(paretoValues)
                tmpX = newX.cpu().numpy()
                tmpY = newY.cpu().numpy()
                for idx in range(tmpX.shape[0]): 
                    paretoParams, paretoValues = newParetoSet(paretoParams, paretoValues, list(tmpX[idx]), list(-tmpY[idx]))
                paretoPost = str(paretoValues)

                self._states[region].update(paretoPrev != paretoPost)
                regionHV = self.getRegionHV(region)
                print("[RegionHV]", regionHV)
                if self._states[region].restart_triggered or regionHV == 0.0: 
                    print(f"[Restart] region {region} restart")
                    trainX, trainY = self.initSamples()
                    self._states[region] = MorboState(dim=self._nDims, batch_size=self._batchSize)
                    self._dataXY[region][0] = trainX
                    self._dataXY[region][1] = trainY
                    self._dataAllX = torch.cat([self._dataAllX, trainX])
                    self._dataAllY = torch.cat([self._dataAllY, trainY])
                    initX = trainX.cpu().numpy()
                    initY = trainY.cpu().numpy()
                    for idx in range(initX.shape[0]): 
                        paretoParams, paretoValues = newParetoSet(paretoParams, paretoValues, list(initX[idx]), list(-initY[idx]))
                    
            t1 = time.time()
            if verbose:
                print(f"Batch {iter}: Pareto-front ->", paretoValues)
                print(f"[Hypervolume]:", f"(Batch {iter})", calcHypervolume(self._refpoint, paretoValues)) 
            else:
                print(".", end="")

        return list(zip(paretoParams, paretoValues))

    def optimizeLegacy(self, steps=2**4, regions=4, verbose=True): 
        self._states = []
        self._mlls   = []
        self._models = []
        self._dataXY = []
        self._dataAllX = None
        self._dataAllY = None
        # Initialize all regions
        initParams = []
        initValues = []
        for region in range(regions): 
            trainX, trainY = self.initSamples()
            state = MorboState(dim=self._nDims, batch_size=self._batchSize)
            initX = trainX.cpu().numpy()
            initY = trainY.cpu().numpy()
            for idx in range(initX.shape[0]): 
                initParams.append(list(initX[idx]))
                initValues.append(list(-initY[idx]))
            self._states.append(state)
            self._dataXY.append([trainX, trainY])
            if self._dataAllX is None: 
                self._dataAllX = trainX
            else: 
                self._dataAllX = torch.cat([self._dataAllX, trainX])
            if self._dataAllY is None: 
                self._dataAllY = trainY
            else: 
                self._dataAllY = torch.cat([self._dataAllY, trainY])
        paretoParams, paretoValues = pareto(initParams, initValues)
        print(f'[Initial PARETO]: {paretoParams}, {paretoValues}')
        print(f'[Hypervolume]:', calcHypervolume(self._refpoint, paretoValues))
        
        for iter in range(steps): 
            for region in range(regions): 
                with gpytorch.settings.max_cholesky_size(float("inf")):
                    newX, newY = self.getObservations(region)
                self._dataXY[region][0] = torch.cat([self._dataXY[region][0], newX])
                self._dataXY[region][1] = torch.cat([self._dataXY[region][1], newY])
                self._dataAllX = torch.cat([self._dataAllX, newX])
                self._dataAllY = torch.cat([self._dataAllY, newY])

                paretoPrev = str(paretoValues)
                tmpX = newX.cpu().numpy()
                tmpY = newY.cpu().numpy()
                for idx in range(tmpX.shape[0]): 
                    paretoParams, paretoValues = newParetoSet(paretoParams, paretoValues, list(tmpX[idx]), list(-tmpY[idx]))
                paretoPost = str(paretoValues)

                self._states[region].update(paretoPrev != paretoPost)
                regionHV = self.getRegionHV(region)
                print("[RegionHV]", regionHV)
                if self._states[region].restart_triggered or regionHV == 0.0: 
                    print(f"[Restart] region {region} restart")
                    trainX, trainY = self.initSamples()
                    self._states[region] = MorboState(dim=self._nDims, batch_size=self._batchSize)
                    self._dataXY[region][0] = trainX
                    self._dataXY[region][1] = trainY
                    self._dataAllX = torch.cat([self._dataAllX, trainX])
                    self._dataAllY = torch.cat([self._dataAllY, trainY])
                    initX = trainX.cpu().numpy()
                    initY = trainY.cpu().numpy()
                    for idx in range(initX.shape[0]): 
                        paretoParams, paretoValues = newParetoSet(paretoParams, paretoValues, list(initX[idx]), list(-initY[idx]))
                    
            t1 = time.time()
            if verbose:
                print(f"[Hypervolume]:", f"(Batch {iter})", calcHypervolume(self._refpoint, paretoValues)) 
            else:
                print(".", end="")

        return list(zip(paretoParams, paretoValues))

    def optSingle(self, steps=2**4, regions=4, verbose=True): 
        trainX, trainY = self.initSamples()
        state = MorboState(dim=self._nDims, batch_size=self._batchSize)

        initX = trainX.cpu().numpy()
        params = []
        values = []
        for param in list(initX): 
            params.append(list(param))
            values.append(self._evalPoint(param))
        paretoParams, paretoValues = pareto(params, values)
        print(f'[Initial PARETO]: {paretoParams}, {paretoValues}')
        
        for iter in range(steps):  
            mll, model = self.initModel(trainX, trainY)
            with gpytorch.settings.max_cholesky_size(float("inf")):
                fit_gpytorch_model(mll)
                newX, newY = self.getObservations(state, mll, model, trainX, trainY)
            trainX = torch.cat([trainX, newX])
            trainY = torch.cat([trainY, newY])

            paretoPrev = str(paretoValues)
            tmpBatchX = newX.cpu().numpy()
            for param in list(tmpBatchX): 
                paretoParams, paretoValues = newParetoSet(paretoParams, paretoValues, list(param), self._evalPoint(param))
            paretoPost = str(paretoValues)

            state.update(paretoPrev != paretoPost)
                
            t1 = time.time()
            if verbose:
                print(self._refpoint, paretoValues)
                print(f"Batch {iter:>2}: hypervolume:", calcHypervolume(self._refpoint, paretoValues)) 
            else:
                print(".", end="")

        return list(zip(paretoParams, paretoValues))


import argparse
def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--paramfile", required=True, action="store")
    parser.add_argument("-c", "--command", required=True, action="store")
    parser.add_argument("-r", "--refpoint", required=True, action="store")
    parser.add_argument("-n", "--nobjs", required=True, action="store")
    parser.add_argument("-b", "--batchsize", required=False, action="store", default=4)
    parser.add_argument("-i", "--ninit", required=False, action="store", default=16)
    parser.add_argument("-s", "--steps", required=False, action="store", default=64)
    parser.add_argument("-t", "--timeout", required=False, action="store", default=None)
    parser.add_argument("-o", "--output", required=False, action="store", default="tmp")
    parser.add_argument("-j", "--njobs", required=False, action="store", default=4)
    parser.add_argument("-m", "--morbos", required=False, action="store", default=4)
    return parser.parse_args()


if __name__ == "__main__": 


    # values = np.array(values)
    # print(100.0 - np.min(values, axis=0))

    # exit(1)
    args = parseArgs()
    configfile = args.paramfile
    command = args.command
    refpoint = float(args.refpoint)
    nobjs = int(args.nobjs)
    ninit = int(args.ninit)
    steps = int(args.steps)
    timeout = None if args.timeout is None else float(args.timeout)
    folder = args.output
    if not os.path.exists(folder): 
        os.mkdir(folder)
    run = runCommand
    if command[-3:] == ".py": 
        run = runPythonCommand
    
    def funcEval(config): 
        iter = str(time.time()).replace(".", "")
        filename = folder + f"/run{iter}.log"
        ret = run(command, config, timeout, filename)
        results = [refpoint, ] * nobjs
        try: 
            with open(filename, "r") as fin: 
                lines = fin.readlines()
                splited = lines[0].split()
                for idx, elem in enumerate(splited): 
                    if len(elem) > 0 and idx < len(results): 
                        results[idx] = float(elem)  
        except Exception: 
            pass
        
        return results
    
    names, types, ranges = readConfig(configfile)
    ndims = len(names)
    model = Morbo(ndims, nobjs, names, types, ranges, funcEval, refpoint=refpoint, weights=[1.0/nobjs] * nobjs, nInit=ninit, batchSize=int(args.batchsize), nJobs=int(args.njobs))
    results = model.optimize(steps=steps, regions=int(args.morbos), verbose=True)
    print(results)
    list(map(lambda x: print("Parameter:", x[0], "\n -> Value:", x[1]), results))
    print("[Hypervolume]:", calcHypervolume([refpoint] * nobjs, list(map(lambda x: x[1], results))))
