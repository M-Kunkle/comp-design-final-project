`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/28/2022 02:06:10 PM
// Design Name: 
// Module Name: ram_counter
//////////////////////////////////////////////////////////////////////////////////

module ram_counter(out, clk, res); //Counts from 0-31 for 32 mem locations
    output [4:0] out;
    input res, clk;
	
	reg [4:0] out;
	 
	 always@(posedge res) begin
	   out <= -1;
	 end
	 
     always@(posedge clk) begin
            out <= out + 1;
     end
endmodule
