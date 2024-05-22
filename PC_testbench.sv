module PC_testbench();
    reg clk;
    reg reset;
    //reg branch_taken;
    //reg [31:0] input_PC;
    //reg [31:0] branch_offset;
    wire [31:0] output_PC;

    // Instantiate PC module
    PC pc_inst (
        .clk(clk),
        .reset(reset),
        //.input_PC(input_PC),
       // .branch_taken(branch_taken),
       // .branch_offset(branch_offset),
        .output_PC(output_PC)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        reset = 1; // Assert reset initially
     //   branch_taken = 0;
  //      input_PC = 0;
     //   branch_offset = 0;
        #10 reset = 0; // Deassert reset after 10 time units
    end

     // Test sequence
    int i = 0 ; 
  
    always @(posedge clk) begin
        if (!reset) begin
          $display("clock cycle: %d | next PC: %d", i++, output_PC);
        end
        if (output_PC == 100) begin // Set end time to 100 time units
            $finish; // Finish simulation
        end
    end
  


endmodule