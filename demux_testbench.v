module demux_testbench;
    reg clk,res;
    reg [1:0] muxcount;
    reg [3:0] mem;
    wire [3:0] out0,out1,out2,out3;

demux uut(
    .muxcount(muxcount),
    .mem(mem),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .res(res),
    .clk(clk)
    );
    
always #20 clk = ~clk;

initial begin
    res = 1; clk = 0;
    #20 res = 0; mem = 4'b1001; muxcount = 2'b00; //out0 should be 1001
    #40 mem = 4'b0000; muxcount = 2'b01; //out1 should be 0000
    #40 mem = 4'b1111; muxcount = 2'b10; //out2 should be 1111
    #40 mem = 4'b0110; muxcount = 2'b11; //out3 should be 0110
    #20 res = 1; 
end

endmodule