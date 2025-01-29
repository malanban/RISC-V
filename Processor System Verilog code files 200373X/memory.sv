module memory(
	input MemRead,
	input MemWrite,
	input [31:0] ram_addr,
	input [31:0] write_data,
	output [31:0] read_data,
	output [31:0] display_mem, //############
	input [4:0] addr_mem, //############
	input clk
	
);
wire [31:0] memory_addr = ram_addr[31:0];

reg [31:0] memory [31:0];
    // Initial values for memory
    initial begin
        for (int i = 0; i < 32; i = i + 1) begin
            memory[i] = i; //32'h8ad34df1;
        end
		  //memory[31] = 32'h8ad34df1;
    end

always @(posedge clk) begin
	if (MemWrite) memory[memory_addr] = write_data;
end

assign read_data = (MemRead == 1'b1) ? memory[memory_addr]: 16'd0;
assign display_mem = memory[32'h00000000 + addr_mem]; //#################################
endmodule 