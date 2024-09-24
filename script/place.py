import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__place.tcl")
                        
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
    
                        
    return parser.parse_args()

def main(args): 
    
    setPlaceMode = "setPlaceMode"
    # setPlaceMode += " -place_detail_irdrop_aware_effort " + args.detail_irdrop_aware
    # setPlaceMode += " -place_detail_irdrop_aware_timing_effort " + args.detail_irdrop_aware_timing
    setPlaceMode += " -place_detail_wire_length_opt_effort " + args.detail_wire_length_opt
    # setPlaceMode += " -place_global_activity_power_driven " + ("false" if args.global_activity_power_driven == "none" else "true")
    # setPlaceMode += " -place_global_activity_power_driven_effort " + args.global_activity_power_driven
    # setPlaceMode += " -place_global_align_macro " + args.global_align_macro
    setPlaceMode += " -place_global_clock_gate_aware " + args.global_clock_gate_aware
    setPlaceMode += " -place_global_clock_power_driven " + ("false" if args.global_clock_power_driven_effort == "none" else "true")
    setPlaceMode += " -place_global_clock_power_driven_effort " + ("standard" if args.global_clock_power_driven_effort == "none" else args.global_clock_power_driven_effort)
    setPlaceMode += " -place_global_cong_effort " + args.global_cong_effort
    setPlaceMode += " -place_global_place_io_pins " + args.global_place_io_pins
    setPlaceMode += " -place_global_soft_guide_strength " + args.global_soft_guide_strength
    setPlaceMode += " -place_global_timing_effort " + args.global_timing_effort
    setPlaceMode += " -place_global_uniform_density " + args.global_uniform_density
    
    placeDesign = "placeDesign " + ("" if args.pre_place_opt == "true" else "-noPrePlaceOpt")
    
    with open(args.output, "w") as fout: 
        fout.write(setPlaceMode + "\n")
        fout.write(placeDesign + "\n")
        fout.write("optDesign -preCTS\n")
        fout.write("place_opt_design\n")
        fout.write("create_ccopt_clock_tree_spec\n")
        fout.write("ccopt_design\n")
        fout.write("optDesign -postCTS\n")
        
        

if __name__ == "__main__": 
    main(parseArgs())
    
    
        
        
        
        