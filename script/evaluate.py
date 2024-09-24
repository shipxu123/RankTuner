#/user/students/.local/bin/python3

import os
import sys
import argparse

import mmmc
import init
import floorplan
import place
import route
import report

def parseArgs(): 
    parser = argparse.ArgumentParser()
                        
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="result")
    parser.add_argument("--timeout", required=False, 
                        action="store", \
                        default=7200)
    
    #=======================================
    # MMMC
    #=======================================
    parser.add_argument("--typical", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--best", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--worst", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--captable", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--sdc", required=False, 
                        action="append", \
                        default=[])
    
    #=======================================
    # Init
    #=======================================
    parser.add_argument("--lef", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--verilog", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("--mmmc", required=False, 
                        action="append", \
                        default=[])
    
    #=======================================
    # Floorplan
    #=======================================
    parser.add_argument("--margin_by", required=False, 
                        action="store", default="io") # {io, die}
    parser.add_argument("--origin", required=False, 
                        action="store", default="llcorner") # {llcorner, center}
    parser.add_argument("--mode", required=False, 
                        action="store", default="r") # {r, su}
    parser.add_argument("--aspect", required=False, 
                        action="store", default=1.0)
    parser.add_argument("--density", required=False, 
                        action="store", default=0.7)
    parser.add_argument("--margin", required=False, 
                        action="store", default=2.6)
    parser.add_argument("--make_path_groups", required=False, 
                        action="store", default="true") # {false, true}
    
    
    #=======================================
    # Place
    #=======================================
    # setPlaceMode
    # -place_detail_irdrop_aware_effort
    parser.add_argument("--detail_irdrop_aware", required=False, 
                        action="store", default="none") # {none, low, medium, high}
    # -place_detail_irdrop_aware_timing_effort
    parser.add_argument("--detail_irdrop_aware_timing", required=False, 
                        action="store", default="none") # {none, standard, high}
    # -place_detail_wire_length_opt_effort
    parser.add_argument("--detail_wire_length_opt", required=False, 
                        action="store", default="medium") # {none, medium, high}
    # -place_global_activity_power_driven, {false, true}, default: false
    # -place_global_activity_power_driven_effort, {none, standard, high}, default: standard
    parser.add_argument("--global_activity_power_driven", required=False, 
                        action="store", default="none") # {none, standard, high}
    # -place_global_align_macro
    parser.add_argument("--global_align_macro", required=False, 
                        action="store", default="false") # {false, true}
    # -place_global_clock_gate_aware
    parser.add_argument("--global_clock_gate_aware", required=False, 
                        action="store", default="true") # {false, true}
    # -place_global_clock_power_driven, {false, true}, default: true
    # -place_global_clock_power_driven_effort, {low, standard, high}, default: low
    parser.add_argument("--global_clock_power_driven_effort", required=False, 
                        action="store", default="standard") # {none, low, standard, high} 
                        # NOTE: in Innovus 17, there are only {none, standard, high}
    # -place_global_cong_effort
    parser.add_argument("--global_cong_effort", required=False, 
                        action="store", default="auto") # {low, medium, high, auto}
    # -place_global_place_io_pins
    parser.add_argument("--global_place_io_pins", required=False, 
                        action="store", default="false") # {false, true}
    # -place_global_soft_guide_strength
    parser.add_argument("--global_soft_guide_strength", required=False, 
                        action="store", default="low") # {low, medium, high}
    # -place_global_timing_effort
    parser.add_argument("--global_timing_effort", required=False, 
                        action="store", default="medium") # {medium, high}
    # -place_global_uniform_density
    parser.add_argument("--global_uniform_density", required=False, 
                        action="store", default="false") # {false, true}
    # placeDesign
    # -noPrePlaceOpt
    parser.add_argument("--pre_place_opt", required=False, 
                        action="store", default="false") # {false, true}
    
    #=======================================
    # Route
    #=======================================
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
    
    #=======================================
    # Report
    #=======================================
    parser.add_argument("--timing", required=False, 
                        action="store", \
                        default="log/timing.log")
    parser.add_argument("--area", required=False, 
                        action="store", \
                        default="log/area.log")
    parser.add_argument("--power", required=False, 
                        action="store", \
                        default="log/power.log")
    parser.add_argument("-d", "--drc", required=False, 
                        action="store", \
                        default="log/drc.log")
    
    return parser.parse_args()

def createScripts(args): 
    basedir = args.output
    args.output = basedir + "/script/mmmc.tcl"
    mmmc.main(args)
    args.output = basedir + "/script/init.tcl"
    init.main(args)
    args.output = basedir + "/script/floorplan.tcl"
    floorplan.main(args)
    args.output = basedir + "/script/place.tcl"
    place.main(args)
    args.output = basedir + "/script/route.tcl"
    route.main(args)
    args.output = basedir + "/script/report.tcl"
    report.main(args)
    
    with open(basedir + "/script/run.tcl", "w") as fout: 
        fout.write("source " + basedir + "/script/init.tcl\n")
        fout.write("source " + basedir + "/script/floorplan.tcl\n")
        fout.write("source " + basedir + "/script/place.tcl\n")
        fout.write("source " + basedir + "/script/route.tcl\n")
        fout.write("source " + basedir + "/script/report.tcl\n")

def innovus(basedir, timeout): 
    os.system("timeout %d innovus -no_gui -no_logv -log %s -batch -execute 'source %s' > %s 2>&1" % \
              (timeout, basedir + "/log/innovus", basedir + "/script/run.tcl", "/dev/null"))

def result(timingfile, powerfile, areafile): 
    slack = None
    with open(timingfile, "r") as fin: 
        for line in fin.readlines(): 
            splited = line.split()
            if len(splited) > 3 and splited[0] == "=" and splited[1] == "Slack" and splited[2] == "Time": 
                slack = float(splited[3])
        
    power = None # NOTE: get the total power
    with open(powerfile, "r") as fin: 
        for line in fin.readlines(): 
            splited = line.split()
            if len(splited) > 2 and splited[0] == "Total" and splited[1] == "Power:": 
                power = float(splited[2])
        
    area = None
    with open(areafile, "r") as fin: 
        for line in fin.readlines(): 
            splited = line.split()
            if len(splited) > 3 and splited[0] == "0": 
                area = float(splited[3])
        
    return slack, power, area
    

def verify(drcfile): 
    result = False
    with open(drcfile, "r") as fin: 
        for line in fin.readlines(): 
            if line.strip() == "No DRC violations were found": 
                result = True
    return result

if __name__ == "__main__": 
    args = parseArgs()
    
    basedir = args.output
    args.timing = basedir + "/log/timing.log"
    args.area = basedir + "/log/area.log"
    args.power = basedir + "/log/power.log"
    args.drc = basedir + "/log/drc.log"
    
    if not os.path.exists(basedir): 
        os.mkdir(basedir)
    if not os.path.exists(basedir + "/script"): 
        os.mkdir(basedir + "/script")
    if not os.path.exists(basedir + "/log"): 
        os.mkdir(basedir + "/log")
        
    createScripts(args)
    innovus(basedir, int(args.timeout))
    valid = verify(args.drc)
    res = ["ERR", "ERR", "ERR", ]
    if valid: 
        res = result(args.timing, args.power, args.area)
    output = str(res[0]) + " " + str(res[1]) + " " + str(res[2])
    with open(basedir + "/log/result.log", "w") as fout: 
        fout.write(output)
    print(output)






















