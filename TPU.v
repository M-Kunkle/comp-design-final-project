`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////: 
// Engineer: Corey Marrs, Sam Griffin, Matthew Kunkle
// 
// Create Date: 04/27/2022 09:36:41 PM
// Design Name: 
// Module Name: computer
//////////////////////////////////////////////////////////////////////////////////


module TPU(clk, res);
    input clk,res;
    
    // Bus lines
    wire [9:0] ram_bus;
    wire [9:0] data_in_bus [1:0];
    wire [9:0] sys_array_bus [15:0];
    
    assign ram_bus = data_in_bus[finished];
    
    // Registers for systolic array clock
    reg sys_clk;
    reg [1:0] clk_count;
    reg [4:0] sys_clk_count;
    reg finished; // Determines whether the sys array has completed
    
    ///// SYSTOLIC ARRAY CLOCK
    always @(posedge clk or posedge res) begin  //This is getting 4x slower clock for systolic array
        if (res)
        begin
            clk_count <= 3;
            sys_clk <= 0;
            sys_clk_count <= 0;
            finished <= 0; 
        end else begin
            if (clk_count < 3) begin //This may be an area that needs more work
                clk_count <= clk_count + 1;
                if (clk_count == 1) begin
                    sys_clk <=0;
                    end
            end
                
            else begin
                clk_count <=0;
                sys_clk <= 1;
                sys_clk_count <= sys_clk_count + 1;
            end
        end
        
        if (sys_clk_count == 17)
            finished <= 1;
     end
     //////////////
     
     // Program Counter
     wire [5:0] program_count;
     program_counter program_counter(
        .clk(clk),
        .out(program_count),
        .res(res),
        .en(instruct_word[8]) 
     );
     
     // Instruction Memory
     wire [8:0] instruct_word;
     instruction_mem instruct_mem(
        .clk(clk),
        .addr(program_count),
        .dout(instruct_word)
     );
    
    
    // RAM A 
    // Holds horizontal fed values and final solution
    wire[9:0] ramA_dout;
    wire [4:0] ram_out;
    ram ram_A(   
        .clk(clk), 
        .wr(instruct_word[8] | finished),        
        .addr(ram_out),
        .din(ram_bus),
        .dout(ramA_dout),
        .res(res)
    );
    
    // RAM A Bus Lines for Final Solution
    assign data_in_bus[0] = {5'b00000,instruct_word[7:4]};
    assign data_in_bus[1] = sys_array_bus[ram_out[3:0]];
    
    // RAM B
    // Holds vertical fed values
    wire[9:0] ramB_dout;    
    ram ram_B( //Ram for inputs B (vertical)
        .clk(clk), 
        .wr(instruct_word[8]),
        .addr(ram_out),
        .din({5'b00000,instruct_word[3:0]}), 
        .dout(ramB_dout),
        .res(res)
    );
    
    // RAM Address Counter
    ram_counter ram_counter(
        .out(ram_out),
        .clk(clk),
        .res(res)
    );
    
    // Demultiplexer Counter
    wire [1:0] muxcount;
    mux_counter mux_counter(
        .clk(clk),
        .res(res),
        .muxcount(muxcount)
    );
    
    // Demultiplexor A - Horizontal Values
    wire[3:0] mux_a0;
    wire[3:0] mux_a1;
    wire[3:0] mux_a2;
    wire[3:0] mux_a3;

    demux demux_A(
        .muxcount(muxcount),
        .mem(ramA_dout[3:0]),
        .out0(mux_a0),
        .out1(mux_a1),
        .out2(mux_a2),
        .out3(mux_a3),
        .res(instruct_word[8]),
        .clk(clk),
        .dis(finished)
    );      
    
    
    // Demultiplexor B - Vertical Values
    wire[3:0] mux_b0;
    wire[3:0] mux_b1;
    wire[3:0] mux_b2;
    wire[3:0] mux_b3;
    
     demux demux_B(
        .muxcount(muxcount),
        .mem(ramB_dout[3:0]),
        .out0(mux_b0),
        .out1(mux_b1),
        .out2(mux_b2),
        .out3(mux_b3),
        .res(instruct_word[8]),
        .clk(clk),
        .dis(finished)
    );      
    
    // Systolic Array
    wire [159:0] result; // Ports cannot have 2D arrays assigned to them
                         // We packed array into 1D, and then unpack here in top module
    systolic_array systolic_array(
        .a0(mux_a0),
        .a1(mux_a1),
        .a2(mux_a2),
        .a3(mux_a3),
        .b0(mux_b0),
        .b1(mux_b1),
        .b2(mux_b2),
        .b3(mux_b3),
        .out(result),
        .clk(sys_clk),
        .res(res)
   );
   
   // Systolic Array Solution Bus Lines
   assign sys_array_bus [0] = result[9:0];
   assign sys_array_bus [1] = result[19:10];
   assign sys_array_bus [2] = result[29:20];
   assign sys_array_bus [3] = result[39:30];
   assign sys_array_bus [4] = result[49:40];
   assign sys_array_bus [5] = result[59:50];
   assign sys_array_bus [6] = result[69:60];
   assign sys_array_bus [7] = result[79:70];
   assign sys_array_bus [8] = result[89:80];
   assign sys_array_bus [9] = result[99:90];
   assign sys_array_bus [10] = result[109:100];
   assign sys_array_bus [11] = result[119:110];
   assign sys_array_bus [12] = result[129:120];
   assign sys_array_bus [13] = result[139:130];
   assign sys_array_bus [14] = result[149:140];
   assign sys_array_bus [15] = result[159:150];
endmodule
