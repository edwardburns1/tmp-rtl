module reg_file(
    input wire clk,    
    input  logic [4:0] rd1,    
    input  logic [4:0] rd2,    
    input  logic [4:0] wr,      
    input  logic [31:0] wr_data,
    input  logic wr_en,       
    output logic [31:0] rd1_data,
    output logic [31:0] rd2_data 
);

  logic [31:0] registers [31:0] = '{default: 32'h0};  // RISCV 32 registers

    // Read logic
    assign rd1_data = (rd1 != 0) ? registers[rd1] : 0;
    assign rd2_data = (rd2 != 0) ? registers[rd2] : 0; 
  
    // Write logic
    always @(posedge clk) begin
        if (wr_en) begin
            registers[wr] <= wr_data; 
        end
    end
  
  //implement special registers? 
  
  // Task to display register contents
    task display_registers;
        integer i;
        $display("Register File Contents:");
        for (i = 0; i < 32; i = i + 1) begin
            $display("Register %0d: %0d", i, registers[i]);
        end
    endtask

endmodule