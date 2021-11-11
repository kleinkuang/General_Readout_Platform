// File:    demo_led.sv
// Author:  Lei Kuang
// Date:    28th October 2021
// @ Imperial College London

module demo_led
(
    input  logic        clk_p,
    input  logic        clk_n,
    input  logic        but1,
    input  logic        but2,
    output logic [3:0]  led
);

logic clk;
logic nrst;

// Clock Wizard
clk_wiz_0 clk_wiz_inst
(
    .clk_in1_p  (clk_p),
    .clk_in1_n  (clk_n),
    .clk_out1   (clk),      // 10MHz
    .locked     (nrst)
 );
 
 // Clock Divider
 logic [31:0] clk_cnt;
 logic        clk_tick;
 
 assign clk_tick = clk_cnt==32'd9999999;
 
 always_ff @ (posedge clk, negedge but1)
    if(~but1)
        clk_cnt <= '0;
    else
        clk_cnt <= clk_tick ? '0 : clk_cnt + 32'd1;
        
// LED Output
always_ff @ (posedge clk, negedge but1)
    if(~but1)
        led <= '0;
    else
        if(clk_tick)
            led <= ~but2 ? '1 : (led + 1'd1);

endmodule
