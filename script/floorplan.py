import os
import sys
import argparse

def parseArgs(): 
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", required=False, 
                        action="store", \
                        default="cmd/__floorplan.tcl")
    parser.add_argument("--margin_by", required=False, 
                        action="store", default="io") # {io, die}
    parser.add_argument("--origin", required=False, 
                        action="store", default="llcorner") # {llcorner, center}
    parser.add_argument("--mode", required=False, 
                        action="store", default="r") # {r, su}
    parser.add_argument("-a", "--aspect", required=False, 
                        action="store", default=1.0)
    parser.add_argument("-d", "--density", required=False, 
                        action="store", default=0.7)
    parser.add_argument("-m", "--margin", required=False, 
                        action="store", default=2.6)
    parser.add_argument("--make_path_groups", required=False, 
                        action="store", default="true") # {false, true}
    return parser.parse_args()

def main(args): 
    option = "-coreMarginsBy %s -fplanOrigin %s -%s" % \
             (args.margin_by, args.origin, args.mode)
             
    pinAssign = '''
# Take all ports and split into halves

set all_ports       [dbGet top.terms.name -v *clk*]

set num_ports       [llength $all_ports]
set half_ports_idx  [expr $num_ports / 2]

set pins_left_half  [lrange $all_ports 0               [expr $half_ports_idx - 1]]
set pins_right_half [lrange $all_ports $half_ports_idx [expr $num_ports - 1]     ]

# Take all clock ports and place them center-left

set clock_ports     [dbGet top.terms.name *clk*]
set half_left_idx   [expr [llength $pins_left_half] / 2]

if { $clock_ports != 0 } {
  for {set i 0} {$i < [llength $clock_ports]} {incr i} {
    set pins_left_half \
      [linsert $pins_left_half $half_left_idx [lindex $clock_ports $i]]
  }
}

# Spread the pins evenly across the left and right sides of the block

set ports_layer M4

editPin -layer $ports_layer -pin $pins_left_half  -side LEFT  -spreadType SIDE
editPin -layer $ports_layer -pin $pins_right_half -side RIGHT -spreadType SIDE
    '''
    
    makePathGroups = '''
# Reset all existing path groups, including basic path groups

reset_path_group -all

# Reset all options set on all path groups

resetPathGroupOptions

# Create collection for each category

set inputs   [all_inputs -no_clocks]
set outputs  [all_outputs]
set icgs     [filter_collection [all_registers] "is_integrated_clock_gating_cell == true"]
set regs     [remove_from_collection [all_registers -edge_triggered] $icgs]
set allregs  [all_registers]

# Create collection for all macros

set blocks      [ dbGet top.insts.cell.baseClass block -p2 ]
set macro_refs  [ list ]
set macros      [ list ]

# If the list of blocks is non-empty, filter out non-physical blocks

set blocks_exist  [ expr [ lindex $blocks 0 ] != 0 ]

if { $blocks_exist } {
  foreach b $blocks {
    set cell    [ dbGet $b.cell ]
    set isBlock [ dbIsCellBlock $cell ]
    set isPhys  [ dbGet $b.isPhysOnly ]
    # Return all blocks that are _not_ physical-only (e.g., filter out IO bondpads)
    if { [ expr $isBlock && ! $isPhys ] } {
      puts [ dbGet $b.name ]
      lappend macro_refs $b
      lappend macros     [ dbGet $b.name ]
    }
  }
}

# Group paths (for any groups that exist)

group_path -name In2Out -from $inputs -to $outputs

if { $allregs != "" } {
  group_path -name In2Reg  -from $inputs  -to $allregs
  group_path -name Reg2Out -from $allregs -to $outputs
}

if { $regs != "" } {
  group_path -name Reg2Reg -from $regs -to $regs
}

if { $allregs != "" && $icgs != "" } {
  group_path -name Reg2ClkGate -from $allregs -to $icgs
}

if { $macros != "" } {
  group_path -name All2Macro -to   $macros
  group_path -name Macro2All -from $macros
}

# High-effort path groups

if { $macros != "" } {
  setPathGroupOptions All2Macro -effortLevel high
  setPathGroupOptions Macro2All -effortLevel high
}

if { $regs != "" } {
  setPathGroupOptions Reg2Reg -effortLevel high
}
'''
    
    with open(args.output, "w") as fout: 
        fout.write("# Floorplaning \n\n")
        fout.write("floorPlan %s %f %f %f %f %f %f" % \
                   (option, \
                    float(args.aspect), float(args.density), float(args.margin), \
                    float(args.margin), float(args.margin), float(args.margin)))
                    
        fout.write("\n\n# Pin assignment \n\n")
        fout.write(pinAssign)
        
        if args.make_path_groups: 
            fout.write("\n\n# Make path groups \n\n")
            fout.write(makePathGroups)
        
        

if __name__ == "__main__": 
    main(parseArgs())
    
    