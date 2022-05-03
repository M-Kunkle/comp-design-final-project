`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/27/2022 09:54:18 PM
// Design Name: 
// Module Name: program_counter
//////////////////////////////////////////////////////////////////////////////////

module program_counter(out, clk, res,en); // needs to count from 0-63
    output [5:0] out;   //ADD HALT so this stops increasing when once we are done with inputs
    input res, clk,en;
	 
	 reg [5:0] out;
	 
	 always@(posedge clk or posedge res) begin
		if (res)
			out <=-1;
	    else if (en) begin 
			out <= out + 1;
	   end else begin
		out <= out;
		end
	end
endmodule
