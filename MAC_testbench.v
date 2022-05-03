module MAC_testbench;
    reg clk, res;
    reg [3:0] a, b;
    wire [3:0] out_a, out_b;
    wire [9:0] sum;
    
    MAC uut (
        .out_a(out_a),
        .out_b(out_b),
        .sum(sum),
        .a(a),
        .b(b),
        .clk(clk),
        .res(res)
    );
    
    initial begin
        forever begin
          #20 clk = ~clk;
        end
    end
    
    initial begin
        a = 0; b = 0; clk = 0;
        #10 res = 1; a = 4'b0000; b =  4'b0000;
        #40 res = 0; a = 4'b0000; b =  4'b0000;
        #90 res = 0; a = 4'b0010; b =  4'b0011;
        #30 res = 1;
        #30 res = 0; a = 4'b0001; b = 4'b0001;
    end
    
endmodule
