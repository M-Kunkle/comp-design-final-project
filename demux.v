`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/28/2022 07:56:58 PM
// Design Name: 
// Module Name: demux
//////////////////////////////////////////////////////////////////////////////////


module demux(muxcount,mem,out0,out1,out2,out3,res,clk, dis);
    input res,clk, dis; // Dis = Disable
    input [1:0] muxcount; //from muxcounter increases from 0-3
    input [3:0] mem; //Data from RAM
    output reg [3:0] out0,out1,out2,out3;

    always @(posedge clk or posedge res) begin
        if (res | dis) begin // Resets or Disables Muxes By Forcing Zeroes
            out0<=0; 
            out1<=0; 
            out2<=0; 
            out3<=0;
        end else begin
            case (muxcount)
                2'b00: out0 = mem;
                2'b01: out1 = mem;
                2'b10: out2 = mem;
                2'b11: out3 = mem;
            endcase
        end
    end
endmodule
