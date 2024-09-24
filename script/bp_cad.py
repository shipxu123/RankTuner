import sys
import glob

from utils import *

if __name__ == "__main__": 
    # HDL and SDC
    hdl = glob.glob("./bp_multi_top/*.v")
    sdc = "./bp_multi_top/constraint.sdc"
    # Mode
    mode = "cadence"
    configfile = "script/params.txt"
    # mode = "genus"
    # configfile = "script/genus.txt"
    names, types, ranges = readConfig(configfile)
    # Reference clock period
    clkref = 5.6
    # Baseline
    script = None
    precfg = None
    baseline = None
    if mode == "genus": 
        script = "script/genus_sv.py"
        precfg = {"top": "bp_multi_top", "hdl": hdl, "sdc": sdc, }
        baseline = [5.6, 56.842089095, 197845.56]
    elif mode == "innovus": 
        script = "script/innovus.py"
        precfg = {"synthed_hdl": hdl, "synthed_sdc": sdc, }
        baseline = [5.58, 45.5181707, 166777.2]
    else: 
        script = "script/cadence_sv.py"
        precfg = {"top": "bp_multi_top", "hdl": hdl, "sdc": sdc, }
        baseline = [5.58, 45.5181707, 166777.2]
    
    if len(sys.argv) == 1: 
        basecfg = precfg.copy()
        basecfg["output"] = "baseline"
        runPythonCommand(script, basecfg, timeout=None, outfile="baseline.txt")
        baseline = parseResult("baseline.txt", clkref)
        print("[BASELINE]:", baseline)
    else: 
        nameVars = []
        variables = []
        for idx in range(1, len(sys.argv), 2): 
            assert sys.argv[idx][0:2] == "--"
            name = sys.argv[idx][2:]
            if not name in names: 
                continue
            nameVars.append(name)
            variables.append(sys.argv[idx+1])
        results = getQoR(nameVars, variables, precfg, script, baseline, clkref, basedir="run")
        print(results[0], results[1], results[2])




