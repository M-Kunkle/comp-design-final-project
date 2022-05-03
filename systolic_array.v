`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/27/2022 10:07:01 PM
// Design Name: 
// Module Name: systolic_array
//////////////////////////////////////////////////////////////////////////////////


module systolic_array(a0, a1, a2, a3, b0, b1, b2, b3, out, clk, res);
    
    input clk,res;
    input [3:0] a0, a1, a2, a3;
    input [3:0] b0, b1, b2, b3;
    output [159:0] out;
    
    // Packs arrays into 1D vector, unpacked in top module
    assign out = {array[15], array[14], array[13], array[12], array[11], array[10], array[9], array[8], array[7], array[6], array[5], array[4], array[3], array[2], array[1], array[0]};
    
    wire [9:0] array [15:0]; // Holds Sum in these registers
    wire [3:0] h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15; //These are the wires for interconnecting MACS
        
    MAC zero(a0, b0, clk, res, h0, v0, array[0]),   //This is the basic structure of Systolic array
    one(h0, b1, clk, res, h1, v1, array[1]),  //MAC(a, b, clk, res, out_a, out_b, sum) a= horizontal
    two(h1, b2, clk, res, h2, v2, array[2]), 
    three(h2, b3, clk, res, h3, v3, array[3]), 
    four(a1, v0, clk, res, h4, v4, array[4]), 
    five(h4, v1, clk, res, h5, v5, array[5]), 
    six(h5, v2, clk, res, h6, v6, array[6]), 
    seven(h6, v3, clk, res, h7, v7, array[7]), 
    eight(a2, v4, clk, res, h8, v8, array[8]), 
    nine(h8, v5, clk, res, h9, v9, array[9]), 
    ten(h9, v6, clk, res, h10, v10, array[10]), 	
    eleven(h10, v7, clk, res, h11, v11, array[11]), 
    twelve(a3, v8, clk, res, h12, v12, array[12]), 
    thirteen(h12, v9, clk, res, h13, v13, array[13]), 
    fourteen(h13, v10, clk, res, h14, v14, array[14]), 
    fifteen(h14, v11, clk, res, h15, v15, array[15]);

        
endmodule
