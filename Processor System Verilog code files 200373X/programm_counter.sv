module programm_counter(
	input clk,
	input reset,
	input [31:0] PC_in,
	//input wire branch, 
	//input wire jump, 
	//input wire [31:0] branch_target,
	//input wire [31:0] jump_target,
	output reg [31:0] PC
);
initial begin
	PC <= 32'h00000000;
end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
            PC <= 32'h00000000;
      end
		else begin
				PC = PC_in + 32'h00000004;
		end
   end
	//assign PC = PC_adder;

endmodule 


