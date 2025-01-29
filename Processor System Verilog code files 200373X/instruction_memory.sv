module instruction_memory(
	input [31:0] PC,
	//input reset,
	output reg [31:0] instruction_code
);
reg [7:0] Memory [1240:0];

	assign instruction_code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};
	
	initial begin 
//			// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h01;
//            Memory[2] = 8'hCD;
//            Memory[1] = 8'h07;
//            Memory[0] = 8'h33;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[7] = 8'h41;
//				Memory[6] = 8'hCD;
//				Memory[5] = 8'h07;
//				Memory[4] = 8'h33;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[11] = 8'h01;
//				Memory[10] = 8'hCD;
//				Memory[9] = 8'h17;
//				Memory[8] = 8'h33;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[15] = 8'h01;
//				Memory[14] = 8'hCD;
//				Memory[13] = 8'h57;
//				Memory[12] = 8'h33;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[19] = 8'h41;
//				Memory[18] = 8'hCD;
//				Memory[17] = 8'h57;
//				Memory[16] = 8'h33;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[23] = 8'h01;
//				Memory[22] = 8'hCD;
//				Memory[21] = 8'h77;
//				Memory[20] = 8'h33;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[27] = 8'h01;
//				Memory[26] = 8'hCD;
//				Memory[25] = 8'h67;
//				Memory[24] = 8'h33;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[31] = 8'h01;
//				Memory[30] = 8'hCD;
//				Memory[29] = 8'h47;
//				Memory[28] = 8'h33;
//				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[35] = 8'h01;
//				Memory[34] = 8'hCD;
//				Memory[33] = 8'h27;
//				Memory[32] = 8'h33;
//				
//				//ANDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[39] = 8'h01;
//				Memory[38] = 8'hCD;
//				Memory[37] = 8'h37;
//				Memory[36] = 8'h33;

				
				
				
				
				
				
	
	
	
	
	
//	// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h08;
//            Memory[2] = 8'h14;
//            Memory[1] = 8'h87;
//            Memory[0] = 8'h13;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[7] = 8'h08;
//				Memory[6] = 8'h14;
//				Memory[5] = 8'hA7;
//				Memory[4] = 8'h13;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[11] = 8'h08;
//				Memory[10] = 8'h14;
//				Memory[9] = 8'hB7;
//				Memory[8] = 8'h13;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[15] = 8'h08;
//				Memory[14] = 8'h14;
//				Memory[13] = 8'hC7;
//				Memory[12] = 8'h13;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[19] = 8'h08;
//				Memory[18] = 8'h14;
//				Memory[17] = 8'hE7;
//				Memory[16] = 8'h13;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[23] = 8'h08;
//				Memory[22] = 8'h14;
//				Memory[21] = 8'hF7;
//				Memory[20] = 8'h13;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[27] = 8'h00;
//				Memory[26] = 8'h34;
//				Memory[25] = 8'h97;
//				Memory[24] = 8'h13;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[31] = 8'h00;
//				Memory[30] = 8'h34;
//				Memory[29] = 8'hD7;
//				Memory[28] = 8'h13;
//				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[35] = 8'h40;
//				Memory[34] = 8'h34;
//				Memory[33] = 8'hD7;
//				Memory[32] = 8'h13;
//				

				
				
				
				
				
				
		
	
	// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h49;
//            Memory[2] = 8'hAD;
//            Memory[1] = 8'h04;
//            Memory[0] = 8'hE3;
				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[7] = 8'h49;
//				Memory[6] = 8'hA4;
//				Memory[5] = 8'h84;
//				Memory[4] = 8'hE3;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[11] = 8'h48;
//				Memory[10] = 8'h9A;
//				Memory[9] = 8'h04;
//				Memory[8] = 8'hE3;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[15] = 8'h49;
//				Memory[14] = 8'hAD;
//				Memory[13] = 8'h14;
//				Memory[12] = 8'hE3;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[19] = 8'h49;
//				Memory[18] = 8'hA4;
//				Memory[17] = 8'h94;
//				Memory[16] = 8'hE3;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[23] = 8'h48;
//				Memory[22] = 8'h9A;
//				Memory[21] = 8'h14;
//				Memory[20] = 8'hE3;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[27] = 8'h49;
//				Memory[26] = 8'hAD;
//				Memory[25] = 8'h44;
//				Memory[24] = 8'hE3;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[31] = 8'h49;
//				Memory[30] = 8'hA4;
//				Memory[29] = 8'hC4;
//				Memory[28] = 8'hE3;
//				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[35] = 8'h48;
//				Memory[34] = 8'h9A;
//				Memory[33] = 8'h44;
//				Memory[32] = 8'hE3;
//				
//					// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[39] = 8'h49;
//            Memory[38] = 8'hAD;
//            Memory[37] = 8'h64;
//            Memory[36] = 8'hE3;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[43] = 8'h49;
//				Memory[42] = 8'hA4;
//				Memory[41] = 8'hE4;
//				Memory[40] = 8'hE3;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[47] = 8'h48;
//				Memory[46] = 8'h9A;
//				Memory[45] = 8'h64;
//				Memory[44] = 8'hE3;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[51] = 8'h49;
//				Memory[50] = 8'hAD;
//				Memory[49] = 8'h54;
//				Memory[48] = 8'hE3;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[55] = 8'h49;
//				Memory[54] = 8'hA4;
//				Memory[53] = 8'hD4;
//				Memory[52] = 8'hE3;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[59] = 8'h48;
//				Memory[58] = 8'h9A;
//				Memory[57] = 8'h54;
//				Memory[56] = 8'hE3;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[63] = 8'h49;
//				Memory[62] = 8'hAD;
//				Memory[61] = 8'h74;
//				Memory[60] = 8'hE3;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[67] = 8'h49;
//				Memory[66] = 8'hA4;
//				Memory[65] = 8'hF4;
//				Memory[64] = 8'hE3;
//				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[71] = 8'h48;
//				Memory[70] = 8'h9A;
//				Memory[69] = 8'h74;
//				Memory[68] = 8'hE3;
	






// //Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h4C;
//            Memory[2] = 8'h26;
//            Memory[1] = 8'h80;
//            Memory[0] = 8'hE7;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[1234] = 8'h00;
//				Memory[1233] = 8'h00;
//				Memory[1232] = 8'h81;
//				Memory[1231] = 8'h67;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[7] = 8'h4C;
//				Memory[6] = 8'h26;
//				Memory[5] = 8'h80;
//				Memory[4] = 8'hEF;






//load store check

	// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h00;
//            Memory[2] = 8'h1D;
//            Memory[1] = 8'h88;
//            Memory[0] = 8'h83;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[7] = 8'h00;
//				Memory[6] = 8'h1D;
//				Memory[5] = 8'hA8;
//				Memory[4] = 8'h83;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[11] = 8'h00;
//				Memory[10] = 8'h1D;
//				Memory[9] = 8'h98;
//				Memory[8] = 8'h83;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[15] = 8'h8A;
//				Memory[14] = 8'hCD;
//				Memory[13] = 8'hD8;
//				Memory[12] = 8'h83;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[19] = 8'h8A;
//				Memory[18] = 8'hCD;
//				Memory[17] = 8'hA8;
//				Memory[16] = 8'h83;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[23] = 8'h00;
//				Memory[22] = 8'hBD;
//				Memory[21] = 8'h86;
//				Memory[20] = 8'h23;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[27] = 8'h00;
//				Memory[26] = 8'hBD;
//				Memory[25] = 8'h96;
//				Memory[24] = 8'h23;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[31] = 8'h00;
//				Memory[30] = 8'hBD;
//				Memory[29] = 8'hA6;
//				Memory[28] = 8'h23;
				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[35] = 8'h48;
//				Memory[34] = 8'h9A;
//				Memory[33] = 8'h44;
//				Memory[32] = 8'hE3;




//			//type the instruction that you are giving
//			//stage 1 Memory[PC]
//			//stage 2 Memory[PC+1]
//			//stage 3 Memory[PC+2]
//			//stage 4 Memory[PC+3]
//			
//			// Setting 32-bit instruction: add t1, s0,s1 => 0x0016db17

//0x006403b3

//				Memory[3] = 8'h00;
//            Memory[2] = 8'h64;
//            Memory[1] = 8'h03;
//            Memory[0] = 8'hB3;
//				
//				
//            Memory[7] = 8'h00;
//            Memory[6] = 8'h16;
//            Memory[5] = 8'hDB;
//            Memory[4] = 8'h17;
//
//				Memory[11] = 8'h00; //0x001cb2b7
//				Memory[10] = 8'h1C;
//				Memory[9] = 8'hB2;
//				Memory[8] = 8'hB7;





		
				
	
//			//type the instruction that you are giving
//			//stage 1 Memory[PC]
//			//stage 2 Memory[PC+1]
//			//stage 3 Memory[PC+2]
//			//stage 4 Memory[PC+3]
//			
//			// Setting 32-bit instruction: add t1, s0,s1 => 0x004A0566 
//            Memory[3] = 8'h00;
//            Memory[2] = 8'h4A;
//            Memory[1] = 8'h05;
//            Memory[0] = 8'h66;
//			
//			// Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
////            Memory[3] = 8'h00;
////            Memory[2] = 8'h94;
////            Memory[1] = 8'h03;
////            Memory[0] = 8'h33;
//				
//				//ADD t2, s3, s4 (encoded as 0x01CD0733):
//				Memory[7] = 8'h01;
//				Memory[6] = 8'hCD;
//				Memory[5] = 8'h07;
//				Memory[4] = 8'h33;
//				
//				//sub t2, s3, s4 (encoded as 0x41CD0733):
//				Memory[11] = 8'h41;
//				Memory[10] = 8'hCD;
//				Memory[9] = 8'h07;
//				Memory[8] = 8'h33;
//
//				//OR t2, s3, s4 (encoded as 0x01CD6733):
//				Memory[15] = 8'h01;
//				Memory[14] = 8'hCD;
//				Memory[13] = 8'h67;
//				Memory[12] = 8'h33;
//				
//				//AND t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[19] = 8'h01;
//				Memory[18] = 8'hCD;
//				Memory[17] = 8'h77;
//				Memory[16] = 8'h33;
//				
//				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[23] = 8'h08;
//				Memory[22] = 8'h14;
//				Memory[21] = 8'h87;
//				Memory[20] = 8'h13;
//				
//				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[27] = 8'h00;
//				Memory[26] = 8'h34;
//				Memory[25] = 8'h97;
//				Memory[24] = 8'h13;
//				
//				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[31] = 8'h00;
//				Memory[30] = 8'h34;
//				Memory[29] = 8'hD7;
//				Memory[28] = 8'h13;
//				
//				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[35] = 8'h40;
//				Memory[34] = 8'h34;
//				Memory[33] = 8'hD7;
//				Memory[32] = 8'h13;
//				
//				//ANDI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[39] = 8'h08;
//				Memory[38] = 8'h14;
//				Memory[37] = 8'hF7;
//				Memory[36] = 8'h13;
//				
//				//ORI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[43] = 8'h08;
//				Memory[42] = 8'h14;
//				Memory[41] = 8'hE7;
//				Memory[40] = 8'h13;
//				
//				//XORI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[47] = 8'h08;
//				Memory[46] = 8'h14;
//				Memory[45] = 8'hC7;
//				Memory[44] = 8'h13;
//				
//				//SLTI t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[51] = 8'h08;
//				Memory[50] = 8'h14;
//				Memory[49] = 8'hA7;
//				Memory[48] = 8'h13;
//				
//				//SLTIU t2, s3, s4 (encoded as 0x01CD7733):
//				Memory[55] = 8'h08;
//				Memory[54] = 8'h14;
//				Memory[53] = 8'hB7;
//				Memory[52] = 8'h13;
				

				
				
				
				
				
				Memory[3] = 8'h00;
            Memory[2] = 8'h00;
            Memory[1] = 8'h12;
            Memory[0] = 8'hB7;
				
				//ADD t2, s3, s4 (encoded as 0x01CD0733):
				Memory[7] = 8'h00;
				Memory[6] = 8'hC2;
				Memory[5] = 8'hD2;
				Memory[4] = 8'h93;
				
				//sub t2, s3, s4 (encoded as 0x41CD0733):
				Memory[11] = 8'h00;
				Memory[10] = 8'h00;
				Memory[9] = 8'h01;
				Memory[8] = 8'hB7;

				//OR t2, s3, s4 (encoded as 0x01CD6733):
				Memory[15] = 8'h00;
				Memory[14] = 8'h00;
				Memory[13] = 8'h75;
				Memory[12] = 8'hB7;
				
				//AND t2, s3, s4 (encoded as 0x01CD7733):
				Memory[19] = 8'h00;
				Memory[18] = 8'hC5;
				Memory[17] = 8'hD5;
				Memory[16] = 8'h93;
				
				//ADDI t2, s3, s4 (encoded as 0x01CD7733):
				Memory[23] = 8'h02;
				Memory[22] = 8'hB2;
				Memory[21] = 8'h80;
				Memory[20] = 8'h63;
				
				//SLLI t2, s3, s4 (encoded as 0x01CD7733):
				Memory[27] = 8'h00;
				Memory[26] = 8'h51;
				Memory[25] = 8'h81;
				Memory[24] = 8'hB3;
				
				//SRLI t2, s3, s4 (encoded as 0x01CD7733):
				Memory[31] = 8'h00;
				Memory[30] = 8'h12;
				Memory[29] = 8'h82;
				Memory[28] = 8'h93;
				
				//SRAI t2, s3, s4 (encoded as 0x01CD7733):
				Memory[35] = 8'hFE;
				Memory[34] = 8'h9F;
				Memory[33] = 8'hF0;
				Memory[32] = 8'hEF;
				
				//ANDI t2, s3, s4 (encoded as 0x01CD7733): 0x0037a023
				Memory[39] = 8'h00;
				Memory[38] = 8'h37;
				Memory[37] = 8'hA0;
				Memory[36] = 8'h23;
				
				//0007ab03
				Memory[43] = 8'h00;
				Memory[42] = 8'h07;
				Memory[41] = 8'hAB;
				Memory[40] = 8'h03;
	end
endmodule

