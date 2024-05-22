module top_level_tb();

    // Define parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Declare signals
    reg clk;
    reg reset;

    // Instantiate the DUT (Design Under Test)
    top_level dut (
        .clk(clk),
        .reset(reset)
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
          i++;
          //$display("clock cycle: %d ", i++);
        end
      if (i == 10) begin // Set end time to 100 time units
            $finish; // Finish simulation
        end
    end
  
endmodule