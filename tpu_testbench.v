`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2022 11:42:47 PM
// Design Name: 
// Module Name: tpu_testbench
//////////////////////////////////////////////////////////////////////////////////

// Solution Takes 97 Clock Cycles

// SOLUTION STORED IN RAM A

module TPU_testbench;
    reg clk,res;
    
    TPU uut(
        .clk(clk),
        .res(res)
        );

initial begin
    forever begin
        #20 clk = ~clk;
    end
end

initial begin
    res = 1; clk =0;
    #100 res = 0;
    #7000 res = 1;
    #10 res = 0;
end

endmodule
