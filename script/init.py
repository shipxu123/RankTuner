import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__init.tcl")
    parser.add_argument("-l", "--lef", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-v", "--verilog", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-m", "--mmmc", required=False, 
                        action="append", \
                        default=[])
    return parser.parse_args()

def main(args): 
    if len(args.lef) == 0: 
        args.lef = ["lib/tcbn65lp_6lmT1.lef"]
    if len(args.verilog) == 0: 
        args.verilog = ["src/cnn_cmac_m.v"]
    if len(args.mmmc) == 0: 
        args.mmmc = ["cmd/mmmc.tcl"]
    with open(args.output, "w") as fout: 
        info = "{ "
        for name in args.lef: 
            info += name + " "
        info += "}"
        fout.write("set init_lef_file " + info + "\n")
        
        fout.write("set init_design_settop 0\n")
        
        info = "{ "
        for name in args.verilog: 
            info += name + " "
        info += "}"
        fout.write("set init_verilog " + info + "\n")
        
        info = "{ "
        for name in args.mmmc: 
            info += name + " "
        info += "}"
        fout.write("set init_mmmc_file " + info + "\n")
        
        fout.write("init_design\n")
        
        

if __name__ == "__main__": 
    main(parseArgs())

