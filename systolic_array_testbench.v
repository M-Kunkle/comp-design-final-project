module systolic_array_testbench;
    reg [3:0] a0, a1, a2, a3;
    reg [3:0] b0, b1, b2, b3;
    reg res, clk;
    wire [159:0] out;
    
    systolic_array uut(
        .res(res),
        .clk(clk),
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .b0(b0),
        .b1(b1),
        .b2(b2),
        .b3(b3),
        .out(out)
        );
        
        always  #20 clk = ~clk;
     
    
    initial begin
        res = 1; clk = 0;
        #60 res = 0; a0 = 2; a1 = 0; a2 = 0; a3 = 0;
            b0 = 2; b1 = 0; b2 = 0; b3 = 0;
        #40 a0 = 2; a1 = 2; a2 = 0; a3 = 0;
            b0 = 2; b1 = 2; b2 = 0; b3 = 0;
        #40 a0 = 2; a1 = 2; a2 = 2; a3 = 0;
            b0 = 2; b1 = 2; b2 = 2; b3 = 0;
        #40 a0 = 2; a1 = 2; a2 = 2; a3 = 2;
            b0 = 2; b1 = 2; b2 = 2; b3 = 2;
        #40 a0 = 0; a1 = 2; a2 = 2; a3 = 2;
            b0 = 0; b1 = 2; b2 = 2; b3 = 2;
        #40 a0 = 0; a1 = 0; a2 = 2; a3 = 2;
            b0 = 0; b1 = 0; b2 = 2; b3 = 2;
        #40 a0 = 0; a1 = 0; a2 = 0; a3 = 2;
            b0 = 0; b1 = 0; b2 = 0; b3 = 2;
        #40 a0 = 0; a1 = 0; a2 = 0; a3 = 0;
            b0 = 0; b1 = 0; b2 = 0; b3 = 0;
    end
endmodule
