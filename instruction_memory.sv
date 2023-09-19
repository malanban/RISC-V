module instruction_memory(
	input [31:0] PC,
	input reset,
	output [31:0] instruction_code
);
reg [7:0] Memory [31:0];
assign instruction_code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};
always @(reset)
	begin 
		if (reset==1) begin
			//type the instruction that you are giving
			//stage 1 Memory[PC]
			//stage 2 Memory[PC+1]
			//stage 3 Memory[PC+2]
			//stage 4 Memory[PC+3]
			
			// Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
            Memory[3] = 8'h00;
            Memory[2] = 8'h94;
            Memory[1] = 8'h03;
            Memory[0] = 8'h33;
		end
	end
endmodule 
