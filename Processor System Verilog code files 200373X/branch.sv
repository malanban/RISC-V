module branch(
	input [31:0] instruction,
	input alu_result,
	input zero_flag,
	output reg branch
);
always @(*) begin
		if (instruction[14:12] == 7'b000) begin //BEQ
			 branch = zero_flag;
		end else if (instruction[14:12] == 7'b001) begin //BNE
			 branch = ~(zero_flag);
		end else if (instruction[14:12] == 7'b100) begin //BLT
			 branch = alu_result;
		end else if (instruction[14:12] == 7'b110) begin //BLTU
			 branch = alu_result;
		end else if (instruction[14:12] == 7'b101) begin //BGE
			 branch = ~(alu_result);
		end else if (instruction[14:12] == 7'b111) begin //BGEU
			 branch = ~(alu_result);
		end else begin
			 branch = 1'b0;
		end
end
endmodule 