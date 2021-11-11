// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Oct 28 16:30:52 2021
// Host        : DESKTOP-9H84E9K running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/General_Platform/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0_stub.v
// Design      : bd_mcu_clk_wiz_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module bd_mcu_clk_wiz_1_0(clk_out1, resetn, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,resetn,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1;
  input resetn;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
