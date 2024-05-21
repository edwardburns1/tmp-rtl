module PC_testbench();
    reg clk;
    reg reset;
    reg branch_taken;
    reg [31:0] input_PC;
    reg [31:0] branch_offset;
    wire [31:0] output_PC;

    // Instantiate PC module
    PC pc_inst (
        .clk(clk),
        .reset(reset),
        .input_PC(input_PC),
        .branch_taken(branch_taken),
        .branch_offset(branch_offset),
        .output_PC(output_PC)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        reset = 1; // Assert reset initially
        branch_taken = 0;
        input_PC = 0;
        branch_offset = 0;
        #10 reset = 0; // Deassert reset after 10 time units
    end

     // Test sequence
    int i = 0 ; 
  
    always @(posedge clk) begin
        if (!reset) begin
          $display("clock cycle: %d | PC: %d", i++, input_PC);
        end
        if (output_PC == 100) begin // Set end time to 100 time units
            $finish; // Finish simulation
        end
    end
  
  always @(posedge clk) begin
    if (input_PC == 32'h10) begin
            branch_taken <= 1'b1;
            branch_offset <= 32'h10;// branch offset by 16 dec
        end else begin
            branch_taken <= 1'b0;
        end
        input_PC <= output_PC; // Update input_PC with output_PC for all clock cycles
  end

endmodule