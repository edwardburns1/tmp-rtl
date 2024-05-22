module top_level(
    input wire clk,       // Clock signal
    input wire reset     // Reset signal

    // Output signals
);

// Define signals for communication between pipeline stages
reg [31:0] fetch_instruction;
  reg [31:0] fetch_pc;
reg [31:0] decode_execute_result;
reg decode_execute_reg_write_enable;
  
  
// Instantiate register file
reg [31:0] register_file [31:0]; // 32 registers, each 32 bits wide
reg [31:0] rd; //special register for load
  
  
reg [31:0] memory [0:1023]; // Example: 1024 words of 32 bits each
  
//load memory dummy data
//how to interface with FPGA that handles SDRAM? 
initial begin
  memory[0] = 32'h11111111;
  memory[4] = 32'h22222222;
  memory[8] = 32'h33333333;
  memory[12] = 32'h44444444;
  memory[16] = 32'h55555555;
  memory[20] = 32'h66666666;
end

// Instantiate pipeline stages
fetch fetch_ins(
    .clk(clk),
    .reset(reset),
     .memory(memory),
    .pc_out(fetch_pc),
    .instruction(fetch_instruction)
);

decode_execute decode_execute_ins(
    .clk(clk),
    .reset(reset),
    .instruction(fetch_instruction),
    .result(decode_execute_result),
    .reg_write_enable(decode_execute_reg_write_enable)
  //is_branch ins--> need to execute another cycle , set input pc properly to prevent fetching next ins
);
/*
write_back write_back_ins(
    .clk(clk),
    .reset(reset),
    .result(decode_execute_result),
    .memory(memory),
    .reg_write_enable(decode_execute_reg_write_enable)
    
);*/

always @(posedge clk) begin
  $display("next pc: %d | Instruction: %h",fetch_pc, fetch_instruction);
    
end

endmodule