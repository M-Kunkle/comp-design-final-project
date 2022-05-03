module ram_testbench;
    reg clk, wr, res;
    reg [4:0] addr;
    reg [8:0] din;
    wire [8:0] dout;
    
    ram uut(
        .clk(clk),
        .wr(wr),
        .addr(addr),
        .din(din),
        .dout(dout),
        .res(res)
        );
        
    initial begin
        forever begin
            #20 clk = ~clk;
        end
    end
    
    initial begin
        clk = 0; res = 1;
        #50 res = 0; addr = 5'b00100; wr = 0; din = 9'b10011001;
        #50 addr = 5'b00100; wr = 1; din = 9'b110011001;
        #50 addr = 5'b00101; wr = 1; din = 9'b111111111;
        #50 addr = 5'b00100; wr = 0; din = 9'b111111111;
    end  
endmodule