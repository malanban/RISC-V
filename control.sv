module control(
	 input [31:0] instruction_code,
	 output branch,
	 output MemRead,
	 output MemtoReg,
	 output MemWrite,
	 output ALUSrc,
	 output RegWrite,
	 output reg [1:0] alu_op
);
assign branch = (instruction_code[6:0]==1100011) ? 1'b1 : 1'b0; //B Type
assign MemRead = (instruction_code[6:0]==0000011) ? 1'b1 : 1'b0; //Load
assign MemtoReg = (instruction_code[6:0]==0000011) ? 1'b1 : 1'b0; //mux
assign MemWrite = (instruction_code[6:0]==0100011) ? 1'b1 : 1'b0; //Store
assign RegWrite = ((instruction_code[6:0]==0000011) | (instruction_code[6:0]==0110011)) ? 1'b1 : 1'b0; //read + alu results
assign ALUSrc = ((instruction_code[6:0]==0000011) | (instruction_code[6:0]==0010011) | (instruction_code[6:0]==1100111)) ? 1'b1 : 1'b0; //I type
assign alu_op[0] = (instruction_code[6:0]==1100011) ? 1'b1 : 1'b0; //B Type
assign alu_op[1] = (instruction_code[6:0]==0110011) ? 1'b1 : 1'b0; //R Type
endmodule 