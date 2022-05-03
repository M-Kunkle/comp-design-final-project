`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/27/2022 08:54:27 PM
// Design Name: 
// Module Name: ram
//////////////////////////////////////////////////////////////////////////////////


module ram(clk, wr, addr, din, dout, res);

    localparam Abits = 5;        // Number of bits in address
    localparam Dbits = 9;        // Number of bits in data
    localparam Nloc = 32;        // Number of memory locations

   input clk, wr, res; // WriteEnable:  if wr==1, data is written into mem
   input [Abits - 1 : 0] addr;   // Address for specifying location
   input [Dbits-1 : 0] din;    // Data for writing (if wr==1)
   output [Dbits-1 : 0] dout;   // Data read from memory (all the time)

   reg [Dbits-1 : 0] mem [Nloc-1 : 0];
            // The actual registers where data is stored
            // Memory write: only when wr==1 and clock tick
   always @(posedge clk) begin
      if (res) begin
        mem[0] <= 0; // Kind of defeats the purpose of localparams but necessary for res to function
        mem[1] <= 0;
        mem[3] <= 0;
        mem[4] <= 0;
        mem[5] <= 0;
        mem[6] <= 0;
        mem[7] <= 0;
        mem[8] <= 0;
        mem[9] <= 0;
        mem[10] <= 0;
        mem[11] <= 0;
        mem[12] <= 0;
        mem[13] <= 0;
        mem[14] <= 0;
        mem[15] <= 0;
        mem[16] <= 0;
        mem[17] <= 0;
        mem[18] <= 0;
        mem[19] <= 0;
        mem[20] <= 0;
        mem[21] <= 0;
        mem[22] <= 0;
        mem[23] <= 0;
        mem[24] <= 0;
        mem[25] <= 0;
        mem[26] <= 0;
        mem[27] <= 0;
        mem[28] <= 0;
        mem[29] <= 0;
        mem[30] <= 0;
        mem[31] <= 0;
      end else if(wr)
         mem[addr] <= din;
   end

   assign dout = mem[addr]; // Memory read all the time, no clock involved

endmodule
