module program_counter_testbench;

	// Inputs
	reg res;
	reg clk;
	reg en;

	// Outputs
	wire [5:0] out;

	// Instantiate the Unit Under Test (UUT)
	program_counter uut (
	    .en(en),
		.out(out), 
		.clk(clk),
		.res(res)
	);

	initial begin
		// Initialize Inputs
		res = 1'b1;
		clk = 0;
		en = 1;
		
		#20 clk = 1'b1;
		#5 res = 0;
		
		forever begin
			#20 clk = ~clk;
		end
	end
      
endmodule
