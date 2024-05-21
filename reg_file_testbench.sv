module reg_file_testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Declare signals
    logic clk = 0;
    logic reset_n = 0;
    logic [4:0] rd1, rd2, wr;
    logic [31:0] wr_data;
    logic wr_en;
    logic [31:0] rd1_data, rd2_data;

    // Instantiate RegisterFile module
   reg_file reg_file_ins (
     .clk(clk),
        .rd1(rd1),
        .rd2(rd2),
        .wr(wr),
        .wr_data(wr_data),
        .wr_en(wr_en),
        .rd1_data(rd1_data),
        .rd2_data(rd2_data)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Test sequence
    initial begin
        // Reset
        reset_n = 0;
        #20; // Wait for a few cycles
        reset_n = 1;

        // Write to register 10
        wr <= 10;
        wr_data <= 100;
        wr_en <= 1;
        #20; // Wait for a few cycles
        $display("Register File (After writing to register 10):");
        reg_file_ins.display_registers();

        // Read from registers 2 and 10
        rd1 = 2;
        rd2 = 10;
        wr_en = 0;
        #20; // Wait for a few cycles
        $display("Register File (After reading from registers 2 and 10):");
        reg_file_ins.display_registers();

        //Write to register 2
        wr = 2;
        wr_data = 50;
        wr_en = 1;
        #20; // Wait for a few cycles
        $display("Register File (After writing to register 2):");
        reg_file_ins.display_registers();

        //Read from registers 2 and 10
        rd1 = 2;
        rd2 = 10;
        wr_en = 0;
        #20; // Wait for a few cycles
        $display("Register File (After reading from registers 2 and 10 again):");
        reg_file_ins.display_registers();

        // End simulation
        $finish;
    end

   
endmodule