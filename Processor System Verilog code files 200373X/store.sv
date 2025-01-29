module store(
	input [2:0] instruction,
	input [31:0] in_store,
	output reg [31:0] out_store
);
always @(*) begin
	if (instruction == 3'b000) out_store = in_store[7:0] + 32'h00000000; //SB
	else if (instruction == 3'b001) out_store = in_store[15:0] + 32'h00000000; //SH
	else out_store = in_store; //LW
end
endmodule 
