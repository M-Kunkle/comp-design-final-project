`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/28/2022 01:23:37 PM
// Design Name: 
// Module Name: instruction_memory
//////////////////////////////////////////////////////////////////////////////////


module instruction_mem(clk, addr, dout); //This isnt completely finished, later we need to add memory locations for reading 

    localparam Abits = 6;        // Number of bits in address
    localparam Dbits = 9;        // Number of bits in data
    localparam Nloc = 64;        // Number of memory locations

   input clk; // WriteEnable:  if wr==1, data is written into mem
   input [Abits-1 : 0] addr;   // Address for specifying location
   output [Dbits-1 : 0] dout;   // Data read from memory (all the time)

   reg [Dbits-1 : 0] mem [Nloc-1 : 0];
            // The actual registers where data is stored
            // Memory write: only when wr==1 and clock tick
   
   
   // 9 Bit Control Word = 1 bit Opcode : 4 Bits A Data : 4 Bits B Data
   always @(posedge clk) begin
        mem[0] =  {1'b1, 4'h2, 4'h5}; //R0
        mem[1] =  9'b100000000; //R1
        mem[2] =  9'b100000000; //R2
        mem[3] =  9'b100000000; //R3
        mem[4] =  {1'b1, 4'h5, 4'hf}; //R4
        mem[5] =  {1'b1, 4'h6, 4'hd}; //R5
        mem[6] =  9'b100000000; //R6
        mem[7] =  9'b100000000; //R7
        mem[8] =  {1'b1, 4'h1, 4'h4}; //R8
        mem[9] =  {1'b1, 4'hf, 4'h0}; //R9
        mem[10] = {1'b1, 4'hc, 4'h8}; //R10
        mem[11] = 9'b100000000; //R11
        mem[12] = {1'b1, 4'h4, 4'hc}; //R12
        mem[13] = {1'b1, 4'h2, 4'h2}; //R13
        mem[14] = {1'b1, 4'h8, 4'h5}; //R14
        mem[15] = {1'b1, 4'h7, 4'h2}; //R15
        mem[16] = 9'b100000000; //R16
        mem[17] = {1'b1, 4'h2, 4'h9}; //R17
        mem[18] = {1'b1, 4'h3, 4'h0}; //R18
        mem[19] = {1'b1, 4'h4, 4'h2}; //R19
        mem[20] = 9'b100000000; //R20
        mem[21] = 9'b100000000; //R21
        mem[22] = {1'b1, 4'hd, 4'h4}; //R22
        mem[23] = {1'b1, 4'hf, 4'h8}; //R23
        mem[24] = 9'b100000000; //R24
        mem[25] = 9'b100000000; //R25
        mem[26] = 9'b100000000; //R26
        mem[27] = {1'b1, 4'h3, 4'h7}; //R27
        mem[28] = 9'b100000000; //R28
        mem[29] = 9'b000000000; //R29
        mem[30] = 9'b000000000; //R30
        mem[31] = 9'b000000000; //R31
        mem[32] = 9'b000000000;
        mem[33] = 9'b000000000;
        mem[34] = 9'b000000000;
        mem[35] = 9'b000000000;
        mem[36] = 9'b000000000;
        mem[37] = 9'b000000000;
        mem[38] = 9'b000000000;
        mem[39] = 9'b000000000;
        mem[40] = 9'b000000000;
        mem[41] = 9'b000000000;
        mem[42] = 9'b000000000;
        mem[43] = 9'b000000000;
        mem[44] = 9'b000000000;
        mem[45] = 9'b000000000;
        mem[46] = 9'b000000000;
        mem[47] = 9'b000000000;
        mem[48] = 9'b000000000;
        mem[49] = 9'b000000000;
        mem[50] = 9'b000000000;
        mem[51] = 9'b000000000;
        mem[52] = 9'b000000000;
        mem[53] = 9'b000000000;
        mem[54] = 9'b000000000;
        mem[55] = 9'b000000000;
        mem[56] = 9'b000000000;
        mem[57] = 9'b000000000;
        mem[58] = 9'b000000000;
        mem[59] = 9'b000000000;
        mem[60] = 9'b000000000;
        mem[61] = 9'b000000000;
        mem[62] = 9'b000000000;
        mem[63] = 9'b100000000;

   end

   assign dout = mem[addr]; // Memory read all the time, no clock involved

endmodule
