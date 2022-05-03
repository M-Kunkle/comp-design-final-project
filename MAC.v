`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/27/2022 08:16:19 PM
// Design Name: 
// Module Name: MAC
//////////////////////////////////////////////////////////////////////////////////


module MAC(
    input [3:0] a,
    input [3:0] b,
    input clk,
    input res,
    output reg [3:0] out_a,
    output reg [3:0] out_b,
    output reg [9:0] sum
    );
    
    always@(posedge clk or posedge res)
    begin
        if (res == 1)
        begin
            sum <= 0;
            out_a <= 0;
            out_b <= 0;
        end
        else begin
            sum <= sum + (a * b);
            out_a <= a;
            out_b <= b;
        end
    end
endmodule