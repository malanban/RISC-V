module clock(
	input logic clk,
	output logic clk_1
);
logic [19:0] count;
initial begin 
	clk_1 = 0;
	count = 0;
end

always @(posedge clk) begin
	if (count == 50000000) begin
		count = 0;
		clk_1 = ~(clk_1);
	end
	count = count + 1;	
end
endmodule 