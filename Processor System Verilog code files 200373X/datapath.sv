module datapath(
	input clk,
	input reset,
	output logic [55:0] display_out,
	input logic [4:0] mem_in
);

logic [31:0] data_output; //############
logic [31:0] data_output1; //############

assign data_output = data_output1;

reg clk_1;
reg [31:0] instruction_code;
reg [31:0] write_data;
reg [31:0] write_data_1;
reg [31:0] read_data;
reg [31:0] read_data1;
reg [31:0] read_data2;
reg RegWrite;
reg MemRead;
reg MemWrite;
reg [31:0] alu_result;
reg [31:0] in2;
reg [31:0] in1;
reg [3:0] ALUControl;
reg zero_flag;
		
reg Branch;
reg MemtoReg;
reg ALUSrc;
reg [2:0] ALUOp;
		
reg [31:0] PC;
reg [31:0] base_address;
reg jump;
reg branch;
reg branch1;
reg [31:0] PC_in;
//reg [31:0] PC_mux1;
reg [31:0] immediate;
reg [31:0] out_data;
reg [31:0] out_store;
reg [31:0] in1_b;
reg jalr;
reg auipc;
reg lui;

reg [3:0] dummy;

assign dummy = instruction_code [30:21];

//initial begin 
//		instruction_code = 32'b0;
//		write_data = 0;
//		read_data = 0;
//		read_data1 = 0;
//		read_data2 = 0;
//		RegWrite = 0;
//		MemRead = 0;
//		MemWrite = 0;
//		alu_result = 0;
//		in2 = 0;
//		ALUControl = 0;
//		zero_flag = 0;
//		
//		Branch = 0;
//		MemtoReg = 0;
//		ALUSrc = 0;
//		ALUOp = 0;
//		
//		PC = 0;
//		jump = 0;
//		branch = 0;
//	end

assign in2 = (ALUSrc) ? immediate:read_data2;
assign write_data_1 = (MemtoReg) ? out_data:alu_result;
assign write_data = (jump) ? (PC + 32'h00000004) :write_data_1;

assign branch = ((Branch && branch1) || jump);

//assign PC_mux1 = (branch) ? ($signed(immediate) + PC - 32'h00000004):PC;  //branch mux
assign PC_in = (branch) ? (base_address + immediate  - 32'h00000004):PC;  //jump mux

assign base_address = (jalr) ? read_data1 : PC; //base_reg 

//in1 alu
assign in1 = (lui) ? 32'h00000000:in1_b;
assign in1_b = (auipc) ? PC:read_data1;





register Register(
	.rs1(instruction_code [19:15]),
	.rs2(instruction_code [24:20]),
	.write_reg(instruction_code [11:7]),		//ins
	.write_data(write_data),
	.read_data1(read_data1),		
	.read_data2(read_data2),		//
	.RegWrite(RegWrite),
	.clk(clk_1),
	.reset(reset)
);

memory Memory(
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.ram_addr(alu_result),
	.write_data(out_store),
	.read_data(read_data),
	.display_mem(data_output1),    //##############33
	.addr_mem(mem_in),   //#############
	.clk(clk_1)	
);

alu ALU(
    .in1(in1),
	 .in2(in2),
    .alu_control(ALUControl),
    .alu_result(alu_result), 
    .zero_flag(zero_flag) 
);

programm_counter programm_counter(
	.clk(clk_1),
	.reset(reset),
	.PC_in(PC_in),
//	.branch(branch), 
//	.jump(jump), 
//	.branch_target(instruction_code), //ins branch
//	.jump_target(instruction_code),	//ins jump
	.PC(PC)
);

instruction_memory instruction_memory(
	.PC(PC),
	//input reset,
	.instruction_code(instruction_code)
);

control control(
	.instruction_code(instruction_code),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.Jump(jump),
	.jalr(jalr),
	.lui(lui),
	.auipc(auipc),
	.ALUOp(ALUOp)	
);

alu_control alu_control(
    .instruction_code(instruction_code),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
);

imm_generation imm_generation(
	.instruction(instruction_code),
	.immediate(immediate)
);

branch branch_module(
	.instruction(instruction_code),
	.alu_result(alu_result[0]),
	.zero_flag(zero_flag),
	.branch(branch1)
);

load load(
	.instruction(instruction_code[14:12]),
	.in_data(read_data),
	.out_data(out_data)
);

store store(
	.instruction(instruction_code[14:12]),
	.in_store(read_data2),
	.out_store(out_store)
);

binary_to_7seg converter1(
		.data_in(data_output[3:0]),
		.data_out(display_out[6:0])
	);
	
binary_to_7seg converter2(
		.data_in(data_output[7:4]),
		.data_out(display_out[13:7])
	);

binary_to_7seg converter3(
		.data_in(data_output[11:8]),
		.data_out(display_out[20:14])
	);

binary_to_7seg converter4(
		.data_in(data_output[15:12]),
		.data_out(display_out[27:21])
	);

binary_to_7seg converter5(
		.data_in(data_output[19:16]),
		.data_out(display_out[34:28])
	);
	
binary_to_7seg converter6(
		.data_in(data_output[23:20]),
		.data_out(display_out[41:35])
	);
	
binary_to_7seg converter7(
		.data_in(data_output[27:24]),
		.data_out(display_out[48:42])
	);

binary_to_7seg converter8(
		.data_in(data_output[31:28]),
		.data_out(display_out[55:49])
	);

clock clock(
	.clk(clk),
	.clk_1(clk_1)
);	

endmodule 