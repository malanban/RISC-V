module binary_to_7seg ( 
	input logic [3:0] data_in,
	output logic [6:0] data_out
);
    // Make a LUT to convert digits to 7 segment output
    // Input - 4 bits, output - 7 bits
    logic [15:0][6:0] lut_7seg;

    // Output is gfedcba
    assign lut_7seg[4'h0] = 7'b0111111;
    assign lut_7seg[4'h1] = 7'b0000110;
    assign lut_7seg[4'h2] = 7'b1011011;
    assign lut_7seg[4'h3] = 7'b1001111;
    assign lut_7seg[4'h4] = 7'b1100110;
    assign lut_7seg[4'h5] = 7'b1101101;
    assign lut_7seg[4'h6] = 7'b1111101;
    assign lut_7seg[4'h7] = 7'b0000111;
    assign lut_7seg[4'h8] = 7'b1111111;
    assign lut_7seg[4'h9] = 7'b1101111;
	 assign lut_7seg[4'hA] = 7'b1110111;
	 assign lut_7seg[4'hB] = 7'b1111100;
	 assign lut_7seg[4'hC] = 7'b0111001;
	 assign lut_7seg[4'hD] = 7'b1011110;
	 assign lut_7seg[4'hE] = 7'b1111001;
	 assign lut_7seg[4'hF] = 7'b1110001; 
//    assign lut_7seg[15:10] = 7'b0;    // unused
	 
	 assign data_out = ~lut_7seg[data_in];
	 
endmodule