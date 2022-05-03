`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/28/2022 07:55:26 PM
// Design Name: 
// Module Name: mux_counter
//////////////////////////////////////////////////////////////////////////////////


module mux_counter(clk,res,muxcount);
    input clk,res;
    output reg [1:0] muxcount;
    
    always @(posedge clk or posedge res)
    begin
        if (res)
            muxcount <= -1;
        else
            muxcount <= muxcount + 1;
    end
endmodule
