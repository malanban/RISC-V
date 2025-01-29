module alu_control(
    input reg [31:0] instruction_code,
    input wire [2:0] ALUOp,
    output reg [3:0] ALUControl
);

always @(*) begin
    if (ALUOp == 3'b000) begin
        ALUControl = 4'b0010; // Common case for ALUOp 00 and 01 (ADD or SUB)
		  
    end else if (ALUOp == 3'b010) begin
	 //register
        if (instruction_code[14:12] == 3'b000) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0010; // ADD
            end else if (instruction_code[31:25] == 7'b0100000) begin
                ALUControl = 4'b0110; // SUB
            end
			end else if (instruction_code[14:12] == 3'b101) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0100; // SRL
            end else if (instruction_code[31:25] == 7'b0100000) begin
                ALUControl = 4'b0101; // SRA
            end
        end else if (instruction_code[14:12] == 3'b111) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0000; // AND
            end
        end else if (instruction_code[14:12] == 3'b110) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0001; // OR
            end
			end else if (instruction_code[14:12] == 3'b001) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0011; // SLL
            end
			end else if (instruction_code[14:12] == 3'b100) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0111; // XOR
            end
			end else if (instruction_code[14:12] == 3'b010) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b1000; // SLT
            end
			end else if (instruction_code[14:12] == 3'b011) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b1001; // SLTU
            end
        end else begin
            ALUControl = 4'b0010; // Default value for other combinations
        end
		  
	 end else if (ALUOp == 3'b100) begin
	 //IMMEDIATES
			if (instruction_code[14:12] == 3'b000) begin
                ALUControl = 4'b1010; // ADDI
			end else if (instruction_code[14:12] == 3'b101) begin
            if (instruction_code[31:25] == 7'b0000000) begin
                ALUControl = 4'b0100; // SRLI
            end else if (instruction_code[31:25] == 7'b0100000) begin
                ALUControl = 4'b0101; // SRAI
            end
         end else if (instruction_code[14:12] == 3'b111) begin
                ALUControl = 4'b0000; // AND
         end else if (instruction_code[14:12] == 3'b110) begin
                ALUControl = 4'b0001; // OR
			end else if (instruction_code[14:12] == 3'b001) begin
                ALUControl = 4'b0011; // SLL
			end else if (instruction_code[14:12] == 3'b100) begin
                ALUControl = 4'b0111; // XOR
			end else if (instruction_code[14:12] == 3'b010) begin
                ALUControl = 4'b1000; // SLT
			end else if (instruction_code[14:12] == 3'b011) begin
                ALUControl = 4'b1001; // SLTU
         end else begin
                ALUControl = 4'b0010; // Default value for other combinations
         end
		
		end else if (ALUOp == 3'b001) begin
	 //BRANCHES
			if (instruction_code[14:12] == 3'b000) begin //BEQ
                ALUControl = 4'b0110; // SUB
			end else if (instruction_code[14:12] == 3'b001) begin //BNE
                ALUControl = 4'b0110; // SUB
         end else if (instruction_code[14:12] == 3'b100) begin //BLT
                ALUControl = 4'b1000; // SLT
         end else if (instruction_code[14:12] == 3'b110) begin //BLTU
                ALUControl = 4'b1001; // SLTU
			end else if (instruction_code[14:12] == 3'b101) begin //BGE
                ALUControl = 4'b1000; // SLT
			end else if (instruction_code[14:12] == 3'b111) begin //BGEU
                ALUControl = 4'b1001; // SLTU
         end else begin
                ALUControl = 4'b0010; // Default value for other combinations
         end
	 

    end else begin
        ALUControl = 4'b0000; // Default value for other ALUOp values.
    end
end

endmodule


//module alu_control(
//	input reg [31:0] instruction_code,
//	input wire [1:0] ALUOp,
//	output reg [3:0] ALUControl
//);
//  always @(*) begin
//    case (ALUOp)
//      2'b00: ALUControl = 4'b0010;
//		2'b01: ALUControl = 4'b0010;
//      2'b10: begin
//        case ({instruction_code[14:12], instruction_code[31:25]})
//			  3'b000 && 7'b0000000: ALUControl = 4'b0010; //ADD
//			  3'b000 && 7'b0100000: ALUControl = 4'b0110; //SUB
//			  3'b111 && 7'b0000000: ALUControl = 4'b0000; //AND
//			  3'b110 && 7'b0000000: ALUControl = 4'b0001; //OR
//			 endcase
//      end
//      default: ALUControl = 4'b0000; // Default value for other alu_op values.
//    endcase
//  end
//endmodule 