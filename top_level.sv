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
  

// Instantiate pipeline stages
fetch fetch_ins(
    .clk(clk),
    .reset(reset),
  .pc_out(fetch_pc),
    .instruction(fetch_instruction)
);
/*
decode_execute decode_execute_ins(
    .clk(clk),
    .reset(reset),
    .instruction(fetch_instruction),
    .result(decode_execute_result),
    .reg_write_enable(decode_execute_reg_write_enable)
);

write_back write_back_ins(
    .clk(clk),
    .reset(reset),
    .result(decode_execute_result),
    .reg_write_enable(decode_execute_reg_write_enable)
);*/

always @(posedge clk) begin
  $display("next pc: %d | Instruction: %h",fetch_pc, fetch_instruction);
    
end

endmodule