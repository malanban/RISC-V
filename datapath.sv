module datapath(
	input clk,
	input reset
);
//`include "programm_counter.sv"
//`include "instruction_memory.sv"
//`include "register.sv"
//`include "alu.sv"
//`include "control.sv"
//`include "alu_control.sv"
//`include "memory.sv"
//`include "multiplexor.sv"
//`include "imm_gen.sv"
//`include "instruction.sv"

instruction i1(
	.instruction_code(instruction_code_inru1),
	.ins_1(ins_1),
	.ins_2(ins_2),
	.ins_3(ins_3),
	.ins_4(ins_4),
	.ins_5(ins_5),
	.ins_6(ins_6)
);

programm_counter p1(
	.clk(clk),
	.reset(reset),
	.imm(immediate_ig1),
	.instruction_addr(instruction_addr_p1),
	.PCSrc(PcSrc_p1)
);

instruction_memory inru1(
	.PC(instruction_addr_p1),
	.reset(reset),
	.instruction_code(instruction_code_inru1)
);

register r1(
	.rs1(ins_4),
	.rs2(ins_5),
	.write_reg(ins_2),
	.write_data(write_data_r1),
	.read_data1(read_data1_r1),
	.read_data2(read_data2_r1),
	.RegWrite(RegWrite_r1),
	.clk(clk),
	.reset(reset)
);

alu a1(
	.in1(in1_a1),
	.in2(in2_a1),
	.alu_control(alu_control_a1),
	.alu_result(alu_result_a1),
	.zero_flag(zero_flag_a1)
);

control c1(
	.instruction_code(ins_1),
	.branch(branch_c1),
	.MemRead(MemRead_c1),
	.MemtoReg(MemtoReg_c1),
	.MemWrite(MemWrite_c1),
	.ALUSrc(ALUSrc_c1),
	.RegWrite(RegWrite_c1),
	.alu_op(alu_op_c1)
);

alu_control ac1(
	.alu_op(alu_op_ac1),
	.instruction_code(instruction_code_inru1),
	.alucontrol(alucontrol_ac1)
);

memory m1(
	.MemRead(MemRead_m1),
	.MemWrite(MemWrite_m1),
	.ram_addr(ram_addr_m1),
	.write_data(write_data_m1),
	.read_data(read_data_m1),
	.clk(clk)	
);

imm_gen ig1(
  .instruction(instruction_code_inru1),
  .immediate(immediate_ig1)
);
 //control
 assign PcSrc_p1 = branch_c1 & zero_flag_a1;
 assign MemRead_c1=MemRead_m1;
 assign alu_op_c1=alu_op_ac1;
 assign MemWrite_c1=MemWrite_m1;
 assign RegWrite_c1=RegWrite_r1;
 
 //alu
 assign alucontrol_ac1=alu_control_a1;
 assign read_data1_r1=in1_a1;
 assign in2_a1 = (ALUSrc_c1) ? immediate_ig1:read_data2_r1;
 assign alu_result_a1=ram_addr_m1;
  
 //memory
 assign write_data_m1 = read_data2_r1;
 
 //register
 assign write_data_r1 = (MemtoReg_c1) ? read_data_m1:alu_result_a1;

  
 
endmodule 