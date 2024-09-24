import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__report.tcl")
    parser.add_argument("-t", "--timing", required=False, 
                        action="store", \
                        default="log/timing.log")
    parser.add_argument("-a", "--area", required=False, 
                        action="store", \
                        default="log/area.log")
    parser.add_argument("-p", "--power", required=False, 
                        action="store", \
                        default="log/power.log")
    parser.add_argument("-d", "--drc", required=False, 
                        action="store", \
                        default="log/drc.log")
    return parser.parse_args()

def main(args): 
    with open(args.output, "w") as fout: 
        fout.write("report_timing > %s\n" % args.timing)
        fout.write("report_area > %s\n" % args.area)
        fout.write("report_power > %s\n" % args.power)
        fout.write("verify_drc -report %s\n" % args.drc)
        
        

if __name__ == "__main__": 
    main(parseArgs())
    
    