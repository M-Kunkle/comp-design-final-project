module instruction_mem_testbench;
    reg clk, res;
    wire [5:0] address_line;
    wire [8:0] out;
    
    
    instruction_mem dut1(
        .clk(clk),
        .addr(address_line),
        .dout(out)
    );
    
    program_counter dut2(
        .clk(clk),
        .res(res),
        .en(out[8]),
        .out(address_line)
    );

    initial begin
        forever begin
            #20 clk = ~clk;
        end
    end
    
    initial begin
    clk = 0; res = 1;
    #20 res = 0;
    end

endmodule
