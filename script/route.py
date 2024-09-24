import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__route.tcl")
                        
    # setNanoRouteMode
    # -droutePostRouteViaPillarEffort
    parser.add_argument("--post_via_pillar_effort", required=False, 
                        action="store", default="low") # {none, low, medium, high}
    # -drouteUseMultiCutViaEffort
    parser.add_argument("--post_multicut_via_effort", required=False, 
                        action="store", default="low") # {low, medium, high}
    # -routeWithLithoDriven
    parser.add_argument("--litho_driven", required=False, 
                        action="store", default="false") # {false, true}
    # -routeWithSiDriven
    parser.add_argument("--si_driven", required=False, 
                        action="store", default="true") # {false, true}
    # -routeWithTimingDriven
    parser.add_argument("--timing_driven", required=False, 
                        action="store", default="true") # {false, true}
    # routeDesign
    # viaOpt
    parser.add_argument("--via_opt", required=False, 
                        action="store", default="false") # {false, true}
    # viaPillarOpt
    parser.add_argument("--via_pillar_opt", required=False, 
                        action="store", default="false") # {false, true}
    # wireOpt
    parser.add_argument("--wire_opt", required=False, 
                        action="store", default="false") # {false, true}
    # optDesign
    # -hold
    parser.add_argument("--hold", required=False, 
                        action="store", default="false") # {false, true}
    return parser.parse_args()

def main(args): 
    
    setNanoRouteMode = "setNanoRouteMode"
    setNanoRouteMode += " -droutePostRouteViaPillarEffort " + args.post_via_pillar_effort
    setNanoRouteMode += " -drouteUseMultiCutViaEffort " + args.post_multicut_via_effort
    setNanoRouteMode += " -routeWithLithoDriven " + args.litho_driven
    setNanoRouteMode += " -routeWithSiDriven " + args.si_driven
    setNanoRouteMode += " -routeWithTimingDriven " + args.timing_driven
    
    routeDesign = "routeDesign -globalDetail"
    routeDesign += "\nrouteDesign -viaOpt" if args.via_opt else ""
    routeDesign += "\nrouteDesign -viaPillarOpt" if args.via_pillar_opt else ""
    routeDesign += "\nrouteDesign -wireOpt" if args.wire_opt else ""
    
    optDesign = "optDesign -postRoute"
    optDesign += " -hold" if args.hold == "true" else ""
    
    with open(args.output, "w") as fout: 
        fout.write(setNanoRouteMode + "\n")
        fout.write(routeDesign + "\n")
        fout.write("setAnalysisMode -analysisType onChipVariation\n")
        fout.write(optDesign + "\n")
        fout.write("timeDesign -postRoute\n")
        
        

if __name__ == "__main__": 
    main(parseArgs())
    
    