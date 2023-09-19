module instruction(
	input [31:0] instruction_code,
	output [6:0] ins_1,
	output [11:7] ins_2,
	output [14:12] ins_3,
	output [19:15] ins_4,
	output [24:20] ins_5,
	output [31:25] ins_6
);
assign ins_1 = instruction_code[6:0];
assign ins_2 = instruction_code[11:7];
assign ins_3 = instruction_code[14:12];
assign ins_4 = instruction_code[19:15];
assign ins_5 = instruction_code[24:20];
assign ins_6 = instruction_code[31:25];
endmodule 