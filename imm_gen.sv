module imm_gen(
  input [31:0] instruction,
  output [31:0] immediate
);

  // Extract the opcode and other relevant fields
  wire [6:0] opcode = instruction[6:0];
  wire [4:0] rd = instruction[11:7];
  wire [4:0] rs1 = instruction[19:15];
  wire [7:0] funct3 = instruction[14:12];
  wire [11:0] imm = instruction[31:20];

  always @* begin
    // Initialize immediate to zero
    immediate = 32'h0;

    // Check the opcode to determine the instruction type
    case (opcode)

      7'b0000011: begin // Load instructions (e.g., LW, LH, LB)
        case (funct3)
          3'b010: immediate = {{20{imm[11]}}, imm}; // Sign-extend for LW
          3'b001: immediate = {{20{imm[11]}}, imm}; // Sign-extend for LH
          3'b000: immediate = {{24{imm[11]}}, imm}; // Sign-extend for LB
          default: immediate = 32'h0; // Default to zero for unsupported load instructions
        endcase
      end

      7'b0100011: begin // Store instructions (e.g., SW, SH, SB)
        case (funct3)
          3'b010: immediate = {imm[11:5], imm[4:0]}; // Immediate for SW
          3'b001: immediate = {imm[11:5], imm[4:0]}; // Immediate for SH
          3'b000: immediate = {imm[11:5], imm[4:0]}; // Immediate for SB
          default: immediate = 32'h0; // Default to zero for unsupported store instructions
        endcase
      end

      // Add more cases for other instructions if needed

      default: begin
        // Handle unsupported opcodes or other instructions
        immediate = 32'h0; // Default to zero
      end
    endcase
  end

endmodule
