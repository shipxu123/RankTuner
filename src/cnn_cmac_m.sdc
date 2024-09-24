# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.10-p002_1 on Fri Mar 18 14:50:49 HKT 2022

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design cnn_cmac

create_clock -name "core_clk" -period 2.5 -waveform {0.0 1.25} [get_ports core_clk]
set_clock_transition 0.1 [get_clocks core_clk]
set_load -pin_load 0.5 [get_ports {out[31]}]
set_fanout_load 0.100 [get_ports {out[31]}]
set_load -pin_load 0.5 [get_ports {out[30]}]
set_fanout_load 0.100 [get_ports {out[30]}]
set_load -pin_load 0.5 [get_ports {out[29]}]
set_fanout_load 0.100 [get_ports {out[29]}]
set_load -pin_load 0.5 [get_ports {out[28]}]
set_fanout_load 0.100 [get_ports {out[28]}]
set_load -pin_load 0.5 [get_ports {out[27]}]
set_fanout_load 0.100 [get_ports {out[27]}]
set_load -pin_load 0.5 [get_ports {out[26]}]
set_fanout_load 0.100 [get_ports {out[26]}]
set_load -pin_load 0.5 [get_ports {out[25]}]
set_fanout_load 0.100 [get_ports {out[25]}]
set_load -pin_load 0.5 [get_ports {out[24]}]
set_fanout_load 0.100 [get_ports {out[24]}]
set_load -pin_load 0.5 [get_ports {out[23]}]
set_fanout_load 0.100 [get_ports {out[23]}]
set_load -pin_load 0.5 [get_ports {out[22]}]
set_fanout_load 0.100 [get_ports {out[22]}]
set_load -pin_load 0.5 [get_ports {out[21]}]
set_fanout_load 0.100 [get_ports {out[21]}]
set_load -pin_load 0.5 [get_ports {out[20]}]
set_fanout_load 0.100 [get_ports {out[20]}]
set_load -pin_load 0.5 [get_ports {out[19]}]
set_fanout_load 0.100 [get_ports {out[19]}]
set_load -pin_load 0.5 [get_ports {out[18]}]
set_fanout_load 0.100 [get_ports {out[18]}]
set_load -pin_load 0.5 [get_ports {out[17]}]
set_fanout_load 0.100 [get_ports {out[17]}]
set_load -pin_load 0.5 [get_ports {out[16]}]
set_fanout_load 0.100 [get_ports {out[16]}]
set_load -pin_load 0.5 [get_ports {out[15]}]
set_fanout_load 0.100 [get_ports {out[15]}]
set_load -pin_load 0.5 [get_ports {out[14]}]
set_fanout_load 0.100 [get_ports {out[14]}]
set_load -pin_load 0.5 [get_ports {out[13]}]
set_fanout_load 0.100 [get_ports {out[13]}]
set_load -pin_load 0.5 [get_ports {out[12]}]
set_fanout_load 0.100 [get_ports {out[12]}]
set_load -pin_load 0.5 [get_ports {out[11]}]
set_fanout_load 0.100 [get_ports {out[11]}]
set_load -pin_load 0.5 [get_ports {out[10]}]
set_fanout_load 0.100 [get_ports {out[10]}]
set_load -pin_load 0.5 [get_ports {out[9]}]
set_fanout_load 0.100 [get_ports {out[9]}]
set_load -pin_load 0.5 [get_ports {out[8]}]
set_fanout_load 0.100 [get_ports {out[8]}]
set_load -pin_load 0.5 [get_ports {out[7]}]
set_fanout_load 0.100 [get_ports {out[7]}]
set_load -pin_load 0.5 [get_ports {out[6]}]
set_fanout_load 0.100 [get_ports {out[6]}]
set_load -pin_load 0.5 [get_ports {out[5]}]
set_fanout_load 0.100 [get_ports {out[5]}]
set_load -pin_load 0.5 [get_ports {out[4]}]
set_fanout_load 0.100 [get_ports {out[4]}]
set_load -pin_load 0.5 [get_ports {out[3]}]
set_fanout_load 0.100 [get_ports {out[3]}]
set_load -pin_load 0.5 [get_ports {out[2]}]
set_fanout_load 0.100 [get_ports {out[2]}]
set_load -pin_load 0.5 [get_ports {out[1]}]
set_fanout_load 0.100 [get_ports {out[1]}]
set_load -pin_load 0.5 [get_ports {out[0]}]
set_fanout_load 0.100 [get_ports {out[0]}]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells {Psum_reg[0]}]  \
  [get_cells {Psum_reg[1]}]  \
  [get_cells {Psum_reg[2]}]  \
  [get_cells {Psum_reg[3]}]  \
  [get_cells {Psum_reg[4]}]  \
  [get_cells {Psum_reg[5]}]  \
  [get_cells {Psum_reg[6]}]  \
  [get_cells {Psum_reg[7]}]  \
  [get_cells {Psum_reg[8]}]  \
  [get_cells {Psum_reg[9]}]  \
  [get_cells {Psum_reg[10]}]  \
  [get_cells {Psum_reg[11]}]  \
  [get_cells {Psum_reg[12]}]  \
  [get_cells {Psum_reg[13]}]  \
  [get_cells {Psum_reg[14]}]  \
  [get_cells {Psum_reg[15]}]  \
  [get_cells {Psum_reg[16]}]  \
  [get_cells {Psum_reg[17]}]  \
  [get_cells {Psum_reg[19]}]  \
  [get_cells {Psum_reg[21]}]  \
  [get_cells {Psum_reg[22]}]  \
  [get_cells {Psum_reg[23]}]  \
  [get_cells {Psum_reg[24]}]  \
  [get_cells {Psum_reg[25]}]  \
  [get_cells {Psum_reg[26]}]  \
  [get_cells {Psum_reg[28]}]  \
  [get_cells {Psum_reg[29]}]  \
  [get_cells {Psum_reg[30]}]  \
  [get_cells {Psum_reg[31]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[14]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[12]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[15]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[11]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[13]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[6]}]  \
  [get_cells {out_reg[0]}]  \
  [get_cells {out_reg[1]}]  \
  [get_cells {out_reg[2]}]  \
  [get_cells {out_reg[3]}]  \
  [get_cells {out_reg[4]}]  \
  [get_cells {out_reg[5]}]  \
  [get_cells {out_reg[6]}]  \
  [get_cells {out_reg[7]}]  \
  [get_cells {out_reg[8]}]  \
  [get_cells {out_reg[9]}]  \
  [get_cells {out_reg[10]}]  \
  [get_cells {out_reg[11]}]  \
  [get_cells {out_reg[12]}]  \
  [get_cells {out_reg[13]}]  \
  [get_cells {out_reg[14]}]  \
  [get_cells {out_reg[15]}]  \
  [get_cells {out_reg[16]}]  \
  [get_cells {out_reg[17]}]  \
  [get_cells {out_reg[18]}]  \
  [get_cells {out_reg[19]}]  \
  [get_cells {out_reg[20]}]  \
  [get_cells {out_reg[21]}]  \
  [get_cells {out_reg[22]}]  \
  [get_cells {out_reg[23]}]  \
  [get_cells {out_reg[24]}]  \
  [get_cells {out_reg[25]}]  \
  [get_cells {out_reg[26]}]  \
  [get_cells {out_reg[27]}]  \
  [get_cells {out_reg[28]}]  \
  [get_cells {out_reg[29]}]  \
  [get_cells {out_reg[30]}]  \
  [get_cells {out_reg[31]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[7]}]  \
  [get_cells {Psum_reg[18]}]  \
  [get_cells {Psum_reg[20]}]  \
  [get_cells {Psum_reg[27]}] ] -to [list \
  [get_cells {Psum_reg[0]}]  \
  [get_cells {Psum_reg[1]}]  \
  [get_cells {Psum_reg[2]}]  \
  [get_cells {Psum_reg[3]}]  \
  [get_cells {Psum_reg[4]}]  \
  [get_cells {Psum_reg[5]}]  \
  [get_cells {Psum_reg[6]}]  \
  [get_cells {Psum_reg[7]}]  \
  [get_cells {Psum_reg[8]}]  \
  [get_cells {Psum_reg[9]}]  \
  [get_cells {Psum_reg[10]}]  \
  [get_cells {Psum_reg[11]}]  \
  [get_cells {Psum_reg[12]}]  \
  [get_cells {Psum_reg[13]}]  \
  [get_cells {Psum_reg[14]}]  \
  [get_cells {Psum_reg[15]}]  \
  [get_cells {Psum_reg[16]}]  \
  [get_cells {Psum_reg[17]}]  \
  [get_cells {Psum_reg[19]}]  \
  [get_cells {Psum_reg[21]}]  \
  [get_cells {Psum_reg[22]}]  \
  [get_cells {Psum_reg[23]}]  \
  [get_cells {Psum_reg[24]}]  \
  [get_cells {Psum_reg[25]}]  \
  [get_cells {Psum_reg[26]}]  \
  [get_cells {Psum_reg[28]}]  \
  [get_cells {Psum_reg[29]}]  \
  [get_cells {Psum_reg[30]}]  \
  [get_cells {Psum_reg[31]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[14]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[12]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[15]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[11]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[13]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[6]}]  \
  [get_cells {out_reg[0]}]  \
  [get_cells {out_reg[1]}]  \
  [get_cells {out_reg[2]}]  \
  [get_cells {out_reg[3]}]  \
  [get_cells {out_reg[4]}]  \
  [get_cells {out_reg[5]}]  \
  [get_cells {out_reg[6]}]  \
  [get_cells {out_reg[7]}]  \
  [get_cells {out_reg[8]}]  \
  [get_cells {out_reg[9]}]  \
  [get_cells {out_reg[10]}]  \
  [get_cells {out_reg[11]}]  \
  [get_cells {out_reg[12]}]  \
  [get_cells {out_reg[13]}]  \
  [get_cells {out_reg[14]}]  \
  [get_cells {out_reg[15]}]  \
  [get_cells {out_reg[16]}]  \
  [get_cells {out_reg[17]}]  \
  [get_cells {out_reg[18]}]  \
  [get_cells {out_reg[19]}]  \
  [get_cells {out_reg[20]}]  \
  [get_cells {out_reg[21]}]  \
  [get_cells {out_reg[22]}]  \
  [get_cells {out_reg[23]}]  \
  [get_cells {out_reg[24]}]  \
  [get_cells {out_reg[25]}]  \
  [get_cells {out_reg[26]}]  \
  [get_cells {out_reg[27]}]  \
  [get_cells {out_reg[28]}]  \
  [get_cells {out_reg[29]}]  \
  [get_cells {out_reg[30]}]  \
  [get_cells {out_reg[31]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[7]}]  \
  [get_cells {Psum_reg[18]}]  \
  [get_cells {Psum_reg[20]}]  \
  [get_cells {Psum_reg[27]}] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells {Psum_reg[0]}]  \
  [get_cells {Psum_reg[1]}]  \
  [get_cells {Psum_reg[2]}]  \
  [get_cells {Psum_reg[3]}]  \
  [get_cells {Psum_reg[4]}]  \
  [get_cells {Psum_reg[5]}]  \
  [get_cells {Psum_reg[6]}]  \
  [get_cells {Psum_reg[7]}]  \
  [get_cells {Psum_reg[8]}]  \
  [get_cells {Psum_reg[9]}]  \
  [get_cells {Psum_reg[10]}]  \
  [get_cells {Psum_reg[11]}]  \
  [get_cells {Psum_reg[12]}]  \
  [get_cells {Psum_reg[13]}]  \
  [get_cells {Psum_reg[14]}]  \
  [get_cells {Psum_reg[15]}]  \
  [get_cells {Psum_reg[16]}]  \
  [get_cells {Psum_reg[17]}]  \
  [get_cells {Psum_reg[19]}]  \
  [get_cells {Psum_reg[21]}]  \
  [get_cells {Psum_reg[22]}]  \
  [get_cells {Psum_reg[23]}]  \
  [get_cells {Psum_reg[24]}]  \
  [get_cells {Psum_reg[25]}]  \
  [get_cells {Psum_reg[26]}]  \
  [get_cells {Psum_reg[28]}]  \
  [get_cells {Psum_reg[29]}]  \
  [get_cells {Psum_reg[30]}]  \
  [get_cells {Psum_reg[31]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[14]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[12]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[15]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[11]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[13]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[6]}]  \
  [get_cells {out_reg[0]}]  \
  [get_cells {out_reg[1]}]  \
  [get_cells {out_reg[2]}]  \
  [get_cells {out_reg[3]}]  \
  [get_cells {out_reg[4]}]  \
  [get_cells {out_reg[5]}]  \
  [get_cells {out_reg[6]}]  \
  [get_cells {out_reg[7]}]  \
  [get_cells {out_reg[8]}]  \
  [get_cells {out_reg[9]}]  \
  [get_cells {out_reg[10]}]  \
  [get_cells {out_reg[11]}]  \
  [get_cells {out_reg[12]}]  \
  [get_cells {out_reg[13]}]  \
  [get_cells {out_reg[14]}]  \
  [get_cells {out_reg[15]}]  \
  [get_cells {out_reg[16]}]  \
  [get_cells {out_reg[17]}]  \
  [get_cells {out_reg[18]}]  \
  [get_cells {out_reg[19]}]  \
  [get_cells {out_reg[20]}]  \
  [get_cells {out_reg[21]}]  \
  [get_cells {out_reg[22]}]  \
  [get_cells {out_reg[23]}]  \
  [get_cells {out_reg[24]}]  \
  [get_cells {out_reg[25]}]  \
  [get_cells {out_reg[26]}]  \
  [get_cells {out_reg[27]}]  \
  [get_cells {out_reg[28]}]  \
  [get_cells {out_reg[29]}]  \
  [get_cells {out_reg[30]}]  \
  [get_cells {out_reg[31]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[7]}]  \
  [get_cells {Psum_reg[18]}]  \
  [get_cells {Psum_reg[20]}]  \
  [get_cells {Psum_reg[27]}] ] -to [list \
  [get_ports {out[31]}]  \
  [get_ports {out[30]}]  \
  [get_ports {out[29]}]  \
  [get_ports {out[28]}]  \
  [get_ports {out[27]}]  \
  [get_ports {out[26]}]  \
  [get_ports {out[25]}]  \
  [get_ports {out[24]}]  \
  [get_ports {out[23]}]  \
  [get_ports {out[22]}]  \
  [get_ports {out[21]}]  \
  [get_ports {out[20]}]  \
  [get_ports {out[19]}]  \
  [get_ports {out[18]}]  \
  [get_ports {out[17]}]  \
  [get_ports {out[16]}]  \
  [get_ports {out[15]}]  \
  [get_ports {out[14]}]  \
  [get_ports {out[13]}]  \
  [get_ports {out[12]}]  \
  [get_ports {out[11]}]  \
  [get_ports {out[10]}]  \
  [get_ports {out[9]}]  \
  [get_ports {out[8]}]  \
  [get_ports {out[7]}]  \
  [get_ports {out[6]}]  \
  [get_ports {out[5]}]  \
  [get_ports {out[4]}]  \
  [get_ports {out[3]}]  \
  [get_ports {out[2]}]  \
  [get_ports {out[1]}]  \
  [get_ports {out[0]}] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports core_clk]  \
  [get_ports rst_n]  \
  [get_ports spe_mac_en_cmac]  \
  [get_ports {i_ifm_bitw[1]}]  \
  [get_ports {i_ifm_bitw[0]}]  \
  [get_ports {i_wei_bitw[1]}]  \
  [get_ports {i_wei_bitw[0]}]  \
  [get_ports {i_bitw_sel[6]}]  \
  [get_ports {i_bitw_sel[5]}]  \
  [get_ports {i_bitw_sel[4]}]  \
  [get_ports {i_bitw_sel[3]}]  \
  [get_ports {i_bitw_sel[2]}]  \
  [get_ports {i_bitw_sel[1]}]  \
  [get_ports {i_bitw_sel[0]}]  \
  [get_ports spe_acc_clear_cmac]  \
  [get_ports {act0[7]}]  \
  [get_ports {act0[6]}]  \
  [get_ports {act0[5]}]  \
  [get_ports {act0[4]}]  \
  [get_ports {act0[3]}]  \
  [get_ports {act0[2]}]  \
  [get_ports {act0[1]}]  \
  [get_ports {act0[0]}]  \
  [get_ports {act1[7]}]  \
  [get_ports {act1[6]}]  \
  [get_ports {act1[5]}]  \
  [get_ports {act1[4]}]  \
  [get_ports {act1[3]}]  \
  [get_ports {act1[2]}]  \
  [get_ports {act1[1]}]  \
  [get_ports {act1[0]}]  \
  [get_ports {wei[7]}]  \
  [get_ports {wei[6]}]  \
  [get_ports {wei[5]}]  \
  [get_ports {wei[4]}]  \
  [get_ports {wei[3]}]  \
  [get_ports {wei[2]}]  \
  [get_ports {wei[1]}]  \
  [get_ports {wei[0]}] ] -to [list \
  [get_cells {Psum_reg[0]}]  \
  [get_cells {Psum_reg[1]}]  \
  [get_cells {Psum_reg[2]}]  \
  [get_cells {Psum_reg[3]}]  \
  [get_cells {Psum_reg[4]}]  \
  [get_cells {Psum_reg[5]}]  \
  [get_cells {Psum_reg[6]}]  \
  [get_cells {Psum_reg[7]}]  \
  [get_cells {Psum_reg[8]}]  \
  [get_cells {Psum_reg[9]}]  \
  [get_cells {Psum_reg[10]}]  \
  [get_cells {Psum_reg[11]}]  \
  [get_cells {Psum_reg[12]}]  \
  [get_cells {Psum_reg[13]}]  \
  [get_cells {Psum_reg[14]}]  \
  [get_cells {Psum_reg[15]}]  \
  [get_cells {Psum_reg[16]}]  \
  [get_cells {Psum_reg[17]}]  \
  [get_cells {Psum_reg[19]}]  \
  [get_cells {Psum_reg[21]}]  \
  [get_cells {Psum_reg[22]}]  \
  [get_cells {Psum_reg[23]}]  \
  [get_cells {Psum_reg[24]}]  \
  [get_cells {Psum_reg[25]}]  \
  [get_cells {Psum_reg[26]}]  \
  [get_cells {Psum_reg[28]}]  \
  [get_cells {Psum_reg[29]}]  \
  [get_cells {Psum_reg[30]}]  \
  [get_cells {Psum_reg[31]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[14]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[12]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[15]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[11]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[13]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0to7_s5_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a0_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a1_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a3_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a4_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a5_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[2]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[3]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[4]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[5]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[6]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[7]}]  \
  [get_cells {u_cnn_cmul_a7_s2_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com01_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com23_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com45_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[2]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[3]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[4]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[5]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[6]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[7]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[8]}]  \
  [get_cells {u_cnn_cmul_com67_s3_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com0123_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[2]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[3]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[4]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[5]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[7]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[8]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[9]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[10]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[11]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s4_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[0]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[2]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[3]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[4]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[5]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[6]}]  \
  [get_cells {out_reg[0]}]  \
  [get_cells {out_reg[1]}]  \
  [get_cells {out_reg[2]}]  \
  [get_cells {out_reg[3]}]  \
  [get_cells {out_reg[4]}]  \
  [get_cells {out_reg[5]}]  \
  [get_cells {out_reg[6]}]  \
  [get_cells {out_reg[7]}]  \
  [get_cells {out_reg[8]}]  \
  [get_cells {out_reg[9]}]  \
  [get_cells {out_reg[10]}]  \
  [get_cells {out_reg[11]}]  \
  [get_cells {out_reg[12]}]  \
  [get_cells {out_reg[13]}]  \
  [get_cells {out_reg[14]}]  \
  [get_cells {out_reg[15]}]  \
  [get_cells {out_reg[16]}]  \
  [get_cells {out_reg[17]}]  \
  [get_cells {out_reg[18]}]  \
  [get_cells {out_reg[19]}]  \
  [get_cells {out_reg[20]}]  \
  [get_cells {out_reg[21]}]  \
  [get_cells {out_reg[22]}]  \
  [get_cells {out_reg[23]}]  \
  [get_cells {out_reg[24]}]  \
  [get_cells {out_reg[25]}]  \
  [get_cells {out_reg[26]}]  \
  [get_cells {out_reg[27]}]  \
  [get_cells {out_reg[28]}]  \
  [get_cells {out_reg[29]}]  \
  [get_cells {out_reg[30]}]  \
  [get_cells {out_reg[31]}]  \
  [get_cells {u_cnn_cmul_a0_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a1_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a2_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a4_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_a5_s1_reg[7]}]  \
  [get_cells {u_cnn_cmul_a6_s1_reg[6]}]  \
  [get_cells {u_cnn_cmul_com4567_s4_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s1_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[0]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s2_reg[1]}]  \
  [get_cells {u_cnn_cmul_i_wei_bitw_s3_reg[1]}]  \
  [get_cells {u_cnn_cmul_wei_s1_reg[7]}]  \
  [get_cells {Psum_reg[18]}]  \
  [get_cells {Psum_reg[20]}]  \
  [get_cells {Psum_reg[27]}] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports core_clk]  \
  [get_ports rst_n]  \
  [get_ports spe_mac_en_cmac]  \
  [get_ports {i_ifm_bitw[1]}]  \
  [get_ports {i_ifm_bitw[0]}]  \
  [get_ports {i_wei_bitw[1]}]  \
  [get_ports {i_wei_bitw[0]}]  \
  [get_ports {i_bitw_sel[6]}]  \
  [get_ports {i_bitw_sel[5]}]  \
  [get_ports {i_bitw_sel[4]}]  \
  [get_ports {i_bitw_sel[3]}]  \
  [get_ports {i_bitw_sel[2]}]  \
  [get_ports {i_bitw_sel[1]}]  \
  [get_ports {i_bitw_sel[0]}]  \
  [get_ports spe_acc_clear_cmac]  \
  [get_ports {act0[7]}]  \
  [get_ports {act0[6]}]  \
  [get_ports {act0[5]}]  \
  [get_ports {act0[4]}]  \
  [get_ports {act0[3]}]  \
  [get_ports {act0[2]}]  \
  [get_ports {act0[1]}]  \
  [get_ports {act0[0]}]  \
  [get_ports {act1[7]}]  \
  [get_ports {act1[6]}]  \
  [get_ports {act1[5]}]  \
  [get_ports {act1[4]}]  \
  [get_ports {act1[3]}]  \
  [get_ports {act1[2]}]  \
  [get_ports {act1[1]}]  \
  [get_ports {act1[0]}]  \
  [get_ports {wei[7]}]  \
  [get_ports {wei[6]}]  \
  [get_ports {wei[5]}]  \
  [get_ports {wei[4]}]  \
  [get_ports {wei[3]}]  \
  [get_ports {wei[2]}]  \
  [get_ports {wei[1]}]  \
  [get_ports {wei[0]}] ] -to [list \
  [get_ports {out[31]}]  \
  [get_ports {out[30]}]  \
  [get_ports {out[29]}]  \
  [get_ports {out[28]}]  \
  [get_ports {out[27]}]  \
  [get_ports {out[26]}]  \
  [get_ports {out[25]}]  \
  [get_ports {out[24]}]  \
  [get_ports {out[23]}]  \
  [get_ports {out[22]}]  \
  [get_ports {out[21]}]  \
  [get_ports {out[20]}]  \
  [get_ports {out[19]}]  \
  [get_ports {out[18]}]  \
  [get_ports {out[17]}]  \
  [get_ports {out[16]}]  \
  [get_ports {out[15]}]  \
  [get_ports {out[14]}]  \
  [get_ports {out[13]}]  \
  [get_ports {out[12]}]  \
  [get_ports {out[11]}]  \
  [get_ports {out[10]}]  \
  [get_ports {out[9]}]  \
  [get_ports {out[8]}]  \
  [get_ports {out[7]}]  \
  [get_ports {out[6]}]  \
  [get_ports {out[5]}]  \
  [get_ports {out[4]}]  \
  [get_ports {out[3]}]  \
  [get_ports {out[2]}]  \
  [get_ports {out[1]}]  \
  [get_ports {out[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports rst_n]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports spe_mac_en_cmac]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_ifm_bitw[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_ifm_bitw[0]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_wei_bitw[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_wei_bitw[0]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[6]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[5]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[4]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[3]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[2]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {i_bitw_sel[0]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports spe_acc_clear_cmac]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[7]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[6]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[5]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[4]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[3]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[2]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act0[0]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[7]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[6]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[5]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[4]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[3]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[2]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {act1[0]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[7]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[6]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[5]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[4]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[3]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[2]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[1]}]
set_input_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {wei[0]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[31]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[30]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[29]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[28]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[27]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[26]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[25]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[24]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[23]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[22]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[21]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[20]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[19]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[18]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[17]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[16]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[15]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[14]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[13]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[12]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[11]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[10]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[9]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[8]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[7]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[6]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[5]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[4]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[3]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[2]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[1]}]
set_output_delay -clock [get_clocks core_clk] -add_delay 0.1 [get_ports {out[0]}]
set_max_transition 0.25 [current_design]
set_drive 0.0 [get_ports core_clk]
set_input_transition 0.1 [get_ports rst_n]
set_input_transition 0.1 [get_ports spe_mac_en_cmac]
set_input_transition 0.1 [get_ports {i_ifm_bitw[1]}]
set_input_transition 0.1 [get_ports {i_ifm_bitw[0]}]
set_input_transition 0.1 [get_ports {i_wei_bitw[1]}]
set_input_transition 0.1 [get_ports {i_wei_bitw[0]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[6]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[5]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[4]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[3]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[2]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[1]}]
set_input_transition 0.1 [get_ports {i_bitw_sel[0]}]
set_input_transition 0.1 [get_ports spe_acc_clear_cmac]
set_input_transition 0.1 [get_ports {act0[7]}]
set_input_transition 0.1 [get_ports {act0[6]}]
set_input_transition 0.1 [get_ports {act0[5]}]
set_input_transition 0.1 [get_ports {act0[4]}]
set_input_transition 0.1 [get_ports {act0[3]}]
set_input_transition 0.1 [get_ports {act0[2]}]
set_input_transition 0.1 [get_ports {act0[1]}]
set_input_transition 0.1 [get_ports {act0[0]}]
set_input_transition 0.1 [get_ports {act1[7]}]
set_input_transition 0.1 [get_ports {act1[6]}]
set_input_transition 0.1 [get_ports {act1[5]}]
set_input_transition 0.1 [get_ports {act1[4]}]
set_input_transition 0.1 [get_ports {act1[3]}]
set_input_transition 0.1 [get_ports {act1[2]}]
set_input_transition 0.1 [get_ports {act1[1]}]
set_input_transition 0.1 [get_ports {act1[0]}]
set_input_transition 0.1 [get_ports {wei[7]}]
set_input_transition 0.1 [get_ports {wei[6]}]
set_input_transition 0.1 [get_ports {wei[5]}]
set_input_transition 0.1 [get_ports {wei[4]}]
set_input_transition 0.1 [get_ports {wei[3]}]
set_input_transition 0.1 [get_ports {wei[2]}]
set_input_transition 0.1 [get_ports {wei[1]}]
set_input_transition 0.1 [get_ports {wei[0]}]
set_ideal_network [get_ports core_clk]
set_ideal_network [get_ports rst_n]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 0.2 [get_clocks core_clk]
set_clock_uncertainty -hold 0.2 [get_clocks core_clk]
