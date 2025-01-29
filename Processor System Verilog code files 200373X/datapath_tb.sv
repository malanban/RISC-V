`timescale 1ns / 1ns

module datapath_tb();

  // Define test signals
  reg clk;
  reg reset;
  reg [55:0] display_out;
  reg [4:0] mem_in;

  datapath dut (
    .clk(clk),
    .reset(reset),
	 .display_out(display_out),
	 .mem_in(mem_in)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  initial begin 
    clk = 0;
    reset = 0;
	 mem_in = 5'b01111;

	 #10 reset = 1;
	 #10 reset = 0;

    #80000000 $finish;
  end



endmodule


