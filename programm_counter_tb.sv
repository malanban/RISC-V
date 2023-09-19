`timescale 1ns/1ns

module programm_counter_tb;

    reg clk;
    reg reset;
    reg [31:0] imm;
    wire [31:0] instruction_addr;
    reg PCSrc;

    // Instantiate the programm_counter module
    programm_counter dut (
        .clk(clk),
        .reset(reset),
        .imm(imm),
        .instruction_addr(instruction_addr),
        .PCSrc(PCSrc)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Create a clock signal with a period of 10ns
    end

    // Reset generation
    initial begin
        reset = 1'b1; // Assert reset
        PCSrc = 0;
        imm = 32'h0;
        #20 reset = 1'b0; // Deassert reset after 20ns
        #100 $finish; // End the simulation after 100ns
    end

    // Stimulus generation
    initial begin
        clk = 0;
        // Provide test inputs here
        // Set PCSrc and imm to test different scenarios
        
        // Test case 1: No branch (PCSrc = 0), increment by 4
        imm = 32'h4;
        PCSrc = 0;
        #10; // Wait for 10ns

        // Test case 2: Branch (PCSrc = 1), imm added to instruction_addr
        imm = 32'h8;
        PCSrc = 1;
        #10; // Wait for 10ns

        // Add more test cases and input sequences as needed

        // End the simulation
        $finish;
    end

    // Add monitors, checks, and assertions as needed to verify the correctness of instruction_addr

endmodule

// Optional: You can create additional modules or tasks for monitoring and checking outputs.
