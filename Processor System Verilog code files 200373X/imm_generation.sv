module imm_generation(
	input	[31:0] instruction,
	output reg [31:0] immediate
);
always @(*) begin
    if (instruction[6:0] == 7'b0010011) begin
        if (instruction[14:12] == 3'b101 || instruction[14:12] == 3'b001) begin
            immediate = 32'h00000000 + instruction[24:20];  //I TYPE
        end else begin
				immediate = $signed(instruction[31:20]); // Default I TYPE
		  end
	 end else if (instruction[6:0] == 7'b1100011) begin //BRANCH
				immediate = $signed({instruction[31],instruction[7],instruction[30:25],instruction[11:8]});
	 end else if (instruction[6:0] == 7'b1100111) begin //JALR
				immediate = $signed(instruction[31:20]); 
	 end else if (instruction[6:0] == 7'b1101111) begin //JAL
				immediate = $signed({instruction[31],instruction[19:12],instruction[20],instruction[30:21]});
	 end else if (instruction[6:0] == 7'b0000011) begin //Load
				immediate = 32'h00000000 + instruction[31:20];
	 end else if (instruction[6:0] == 7'b0100011) begin //Store
				immediate = 32'h00000000 + {instruction[31:25],instruction[11:7]};	
	 end else if (instruction[6:0] == 7'b0110111) begin //LUI
				immediate = 32'h00000000 + (instruction[31:12]<<12);
	 end else if (instruction[6:0] == 7'b0010111) begin //AUIPC
				immediate = 32'h00000000 + (instruction[31:12]<<12);	
    end else begin
        immediate = 32'h00000000 + instruction[31:20]; // Default value
    end
end
//assign immediate = 32'h00000000 + instruction[31:20];

endmodule 