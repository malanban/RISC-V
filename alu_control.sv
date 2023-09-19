module alu_control(
  input [1:0] alu_op,
  input [31:0] instruction_code,
  output [3:0] alucontrol
);
  
  always @(*) begin
    case (alu_op)
      2'b00: alucontrol = 4'b0010;
		2'b01: alucontrol = 4'b0010;
      2'b10: begin
        case ({instruction_code[14:12], instruction_code[31:25]})
			  3'b000 & 8'b00000000: alucontrol = 4'b0010;
			  3'b000 & 8'b01000000: alucontrol = 4'b0110;
			  3'b111 & 8'b00000000: alucontrol = 4'b0000;
			  3'b110 & 8'b00000000: alucontrol = 4'b0001;
			 endcase
      end
      default: alucontrol = 4'b0000; // Default value for other alu_op values.
    endcase
  end

endmodule
