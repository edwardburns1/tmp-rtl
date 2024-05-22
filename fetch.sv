module fetch(
    input wire clk,
    input wire reset,
    input wire [31:0] memory [0:1023], // Memory input
    //input wire branch_taken,
    //input wire [31:0] branch_offset,
    output reg [31:0] pc_out,
    output reg [31:0] instruction
);


// Testing: load memory file with instructions
  //instruction memory interface with FPGA?  SDRAM module 

reg [31:0] pc, next_pc;
  

PC pc_inst (
    .clk(clk),
    .reset(reset),
    //.input_PC(pc),
   // .branch_taken(branch_taken),
   // .branch_offset(branch_offset),
    .output_PC(next_pc)
);


always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <= 32'h0; // Reset PC to initial value
    end else begin
        pc <= next_pc; // Update PC based on the next PC value from the PC module
       
    end
end
  
  
always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 32'h0; 
    else
      pc_out <= next_pc; 
      instruction <= memory[pc];
end

// Fetch instruction from memory based on the current PC
  /*
  always @(*) begin
    instruction = memory[pc];
end
*/
endmodule