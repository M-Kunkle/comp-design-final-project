module ram_counter_testbench;
    reg clk,res;
    wire [4:0] out;

ram_counter uut(
    .clk(clk),
    .out(out),
    .res(res)
    );

always #20 clk= ~clk;

initial begin
    res = 1; clk = 0;
    #20 res = 0;
    #140 res = 1;
    #40 res = 0; 
end

endmodule

