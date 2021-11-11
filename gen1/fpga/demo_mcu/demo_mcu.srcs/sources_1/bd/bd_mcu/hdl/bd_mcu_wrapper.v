//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Thu Oct 28 16:51:05 2021
//Host        : DESKTOP-9H84E9K running 64-bit major release  (build 9200)
//Command     : generate_target bd_mcu_wrapper.bd
//Design      : bd_mcu_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_mcu_wrapper
   (CLK_clk_n,
    CLK_clk_p,
    NRST,
    UART_gnd,
    UART_rxd,
    UART_txd);
  input CLK_clk_n;
  input CLK_clk_p;
  input NRST;
  output [0:0]UART_gnd;
  input UART_rxd;
  output UART_txd;

  wire CLK_clk_n;
  wire CLK_clk_p;
  wire NRST;
  wire [0:0]UART_gnd;
  wire UART_rxd;
  wire UART_txd;

  bd_mcu bd_mcu_i
       (.CLK_clk_n(CLK_clk_n),
        .CLK_clk_p(CLK_clk_p),
        .NRST(NRST),
        .UART_gnd(UART_gnd),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
