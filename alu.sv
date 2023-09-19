module alu(
	input [31:0] in1,in2,
	input [3:0]  alu_control,
	output [31:0] alu_result,
	output zero_flag
);
always @(*) begin
	case (alu_control)
		  4'b0000: alu_result = in1&in2;
        4'b0001: alu_result = in1|in2;
        4'b0010: alu_result = in1+in2;
        4'b0110: alu_result = in1-in2;

	endcase
	if (alu_result == 0) zero_flag = 1'b1;
	else zero_flag = 1'b0;
end
endmodule 