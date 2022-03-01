//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Mar  1 12:14:16 2022
//Host        : DESKTOP-9H84E9K running 64-bit major release  (build 9200)
//Command     : generate_target bd_mcu_wrapper.bd
//Design      : bd_mcu_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_mcu_wrapper
   (CLK_clk_n,
    CLK_clk_p,
    I2C_DAC_scl_io,
    I2C_DAC_sda_io,
    LED,
    NRST,
    UART_gnd,
    UART_rxd,
    UART_txd);
  input CLK_clk_n;
  input CLK_clk_p;
  inout I2C_DAC_scl_io;
  inout I2C_DAC_sda_io;
  output [3:0]LED;
  input NRST;
  output [0:0]UART_gnd;
  input UART_rxd;
  output UART_txd;

  wire CLK_clk_n;
  wire CLK_clk_p;
  wire I2C_DAC_scl_i;
  wire I2C_DAC_scl_io;
  wire I2C_DAC_scl_o;
  wire I2C_DAC_scl_t;
  wire I2C_DAC_sda_i;
  wire I2C_DAC_sda_io;
  wire I2C_DAC_sda_o;
  wire I2C_DAC_sda_t;
  wire [3:0]LED;
  wire NRST;
  wire [0:0]UART_gnd;
  wire UART_rxd;
  wire UART_txd;

  IOBUF I2C_DAC_scl_iobuf
       (.I(I2C_DAC_scl_o),
        .IO(I2C_DAC_scl_io),
        .O(I2C_DAC_scl_i),
        .T(I2C_DAC_scl_t));
  IOBUF I2C_DAC_sda_iobuf
       (.I(I2C_DAC_sda_o),
        .IO(I2C_DAC_sda_io),
        .O(I2C_DAC_sda_i),
        .T(I2C_DAC_sda_t));
  bd_mcu bd_mcu_i
       (.CLK_clk_n(CLK_clk_n),
        .CLK_clk_p(CLK_clk_p),
        .I2C_DAC_scl_i(I2C_DAC_scl_i),
        .I2C_DAC_scl_o(I2C_DAC_scl_o),
        .I2C_DAC_scl_t(I2C_DAC_scl_t),
        .I2C_DAC_sda_i(I2C_DAC_sda_i),
        .I2C_DAC_sda_o(I2C_DAC_sda_o),
        .I2C_DAC_sda_t(I2C_DAC_sda_t),
        .LED(LED),
        .NRST(NRST),
        .UART_gnd(UART_gnd),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd));
endmodule
