module load(
	input [2:0] instruction,
	input [31:0] in_data,
	output reg [31:0] out_data
);
always @(*) begin
	if (instruction == 3'b000) out_data = $signed(in_data[7:0]) + $signed(32'h00000000); //LB
	else if (instruction == 3'b100) out_data = (in_data[7:0] + 32'h00000000); //LBU
	else if (instruction == 3'b001) out_data = $signed(in_data[15:0]) + $signed(32'h00000000); //LH
	else if (instruction == 3'b101) out_data = (in_data[15:0] + 32'h00000000); //LHU
	else out_data = in_data; //LW
end
endmodule 

//always @(*) begin
//	if (instruction == 3'b000) begin 
//		out_data = $signed(in_data[7:0]); //LB
//	end else if (instruction == 3'b100) begin
//		out_data = in_data[7:0]; //LBU
//	end else if (instruction == 3'b001) begin
//		out_data = $signed(in_data[15:0]); //LH
//	end else if (instruction == 3'b101) begin
//		out_data = in_data[15:0]; //LHU
//	end else begin
//		(instruction == 3'b010) out_data = in_data; //LW
//	end
//end 