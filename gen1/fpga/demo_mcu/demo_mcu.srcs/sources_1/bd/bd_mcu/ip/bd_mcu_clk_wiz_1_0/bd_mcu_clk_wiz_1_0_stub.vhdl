-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Oct 28 16:30:52 2021
-- Host        : DESKTOP-9H84E9K running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/General_Platform/fpga/demo_mcu/demo_mcu.srcs/sources_1/bd/bd_mcu/ip/bd_mcu_clk_wiz_1_0/bd_mcu_clk_wiz_1_0_stub.vhdl
-- Design      : bd_mcu_clk_wiz_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_mcu_clk_wiz_1_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end bd_mcu_clk_wiz_1_0;

architecture stub of bd_mcu_clk_wiz_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,resetn,locked,clk_in1_p,clk_in1_n";
begin
end;
