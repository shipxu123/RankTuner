import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__mmmc.tcl")
    parser.add_argument("-t", "--typical", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-b", "--best", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-w", "--worst", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-c", "--captable", required=False, 
                        action="append", \
                        default=[])
    parser.add_argument("-s", "--sdc", required=False, 
                        action="append", \
                        default=[])
    return parser.parse_args()


def main(args): 
    if len(args.typical) == 0: 
        args.typical = ["lib/tcbn65lptc.lib"]
    if len(args.best) == 0: 
        args.best = ["lib/tcbn65lpbc.lib"]
    if len(args.worst) == 0: 
        args.worst = ["lib/tcbn65lpwc.lib"]
    if len(args.captable) == 0: 
        args.captable = ["lib/cln65lp_1p06m+alrdl_top1_typical.captable"]
    if len(args.sdc) == 0: 
        args.sdc = ["src/cnn_cmac_m.sdc"]
    
    typical = ""
    for name in args.typical: 
        typical += name + " "
    best = ""
    for name in args.best: 
        best += name + " "
    worst = ""
    for name in args.worst: 
        worst += name + " "
    captable = ""
    for name in args.captable: 
        captable += name + " "
    sdc = ""
    for name in args.sdc: 
        sdc += name + " "
    
    info = '''
if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]

create_library_set -name libs_typical\\
   -timing\\
    [list %s]
create_library_set -name libs_bc\\
   -timing\\
    [list %s]
create_library_set -name libs_wc\\
   -timing\\
    [list %s]
create_rc_corner -name typical\\
   -cap_table %s\\
   -preRoute_res 1\\
   -postRoute_res 1\\
   -preRoute_cap 1\\
   -postRoute_cap 1\\
   -postRoute_xcap 1\\
   -preRoute_clkres 0\\
   -preRoute_clkcap 0\\
   -T 25
create_delay_corner -name delay_default\\
   -rc_corner typical\\
   -early_library_set libs_bc\\
   -late_library_set libs_typical
create_constraint_mode -name constraints_default\\
   -sdc_files\\
    [list %s]
create_analysis_view -name analysis_default -constraint_mode constraints_default -delay_corner delay_default
set_analysis_view -setup [list analysis_default] -hold [list analysis_default]
    ''' % (typical, best, worst, captable, sdc)
    with open(args.output, "w") as fout: 
        fout.write(info)
        
        

if __name__ == "__main__": 
    main(parseArgs())
    
    
    