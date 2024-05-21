`timescale 1ns / 1ps

module ALU_TB;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Declare signals
    reg [31:0] operand1;
    reg [31:0] operand2;
   reg [3:0] ALUControl;
    wire [31:0] result;

    // Instantiate ALU module
    ALU ALU_ins (
        .operand1(operand1),
        .operand2(operand2),
        .ALUControl(ALUControl),
        .result(result)
    );

    // Clock generation
    reg clk = 0;
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Test sequence
    initial begin
        // Test addition (ALUControl = 3'b000)
        operand1 = 32'h0000_0001;
        operand2 = 32'h0000_0002;
        ALUControl = 4'b0000;
        #10; // Wait for a few cycles
        $display("Addition: %d + %d = %d", operand1, operand2, result);

        // Test subtraction (ALUControl = 3'b001)
        operand1 = 32'h0000_0003;
        operand2 = 32'h0000_0002;
        ALUControl = 3'b0001;
        #10; // Wait for a few cycles
        $display("Subtraction: %d - %d = %d", operand1, operand2, result);

        // Test bitwise AND (ALUControl = 3'b010)
        operand1 = 32'h0000_00F0;
        operand2 = 32'h0000_0F00;
        ALUControl = 3'b0010;
        #10; // Wait for a few cycles
        $display("Bitwise AND: %h & %h = %h", operand1, operand2, result);

        // Test bitwise OR (ALUControl = 3'b011)
        operand1 = 32'hAAAA_AAAA;
        operand2 = 32'h5555_5555;
        ALUControl = 3'b0011;
        #10; // Wait for a few cycles
        $display("Bitwise OR: %h | %h = %h", operand1, operand2, result);

        // Test bitwise XOR (ALUControl = 3'b100)
        operand1 = 32'h1234_5678;
        operand2 = 32'h5678_1234;
        ALUControl = 3'b0100;
        #10; // Wait for a few cycles
        $display("Bitwise XOR: %h ^ %h = %h", operand1, operand2, result);

        // Test set less than (ALUControl = 3'b101)
        operand1 = 32'h0000_0001;
        operand2 = 32'h0000_0002;
        ALUControl = 3'b101;
        #10; // Wait for a few cycles
        $display("Set Less Than: %d < %d = %d", operand1, operand2, result);

        // End simulation
        $finish;
    end

endmodule