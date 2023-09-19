module programm_counter(
  input clk,
  input reset,
  input [31:0] imm,
  output reg [31:0] instruction_addr,
  input PCSrc
);

always @(posedge clk or posedge reset) begin
  if (reset) begin
    instruction_addr <= 32'h0; // Initialize instruction_addr to 0 on reset.
  end else begin
    if (PCSrc) begin
      // Use non-blocking assignment to update instruction_addr.
      instruction_addr <= instruction_addr + imm;
    end else begin
      instruction_addr <= instruction_addr + 32'h4;
    end
  end
end

endmodule
