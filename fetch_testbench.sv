module fetch_tb;
    reg clk;
    reg reset;
  wire [31:0] instruction_out, pc_out;

    fetch fetch_ins (
        .clk(clk),
        .reset(reset),
      .pc_out(pc_out),
        .instruction(instruction_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
      	clk = 0;
        reset = 1;
        #100; // Reset for 100 time units
        reset = 0;
    end

    // Stimulus generation
     // Test sequence
    int i = 0 ; 
  
    always @(posedge clk) begin
        if (!reset) begin
          $display("clock cycle: %d | pc: %d | Instruction: %h", i++,pc_out, instruction_out);
        end
      if (i == 10) begin // Set end time to 100 time units
            $finish; // Finish simulation
        end
    end
  
  

endmodule