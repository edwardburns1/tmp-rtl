module top_level(
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal

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
    .rst(reset),
    .instruction(fetch_instruction)
);

decode_execute decode_execute_ins(
    .clk(clk),
    .rst(reset),
    .instruction(fetch_instruction),
    .result(decode_execute_result),
    .reg_write_enable(decode_execute_reg_write_enable)
);

write_back write_back_ins(
    .clk(clk),
    .rst(reset),
    .result(decode_execute_result),
    .reg_write_enable(decode_execute_reg_write_enable)
);

always @(posedge clk) begin
    // Clock edge-triggered logic to control pipeline stages
    if (!rst) begin
        // Reset signals
        fetch_pc <= 32'h0;   // Reset program counter to initial value
        fetch_instruction <= 32'h0;
        decode_execute_result <= 32'h0;
        decode_execute_reg_write_enable <= 1'b0;
    end else begin
        // Control flow between stages
        
    end
end

endmodule