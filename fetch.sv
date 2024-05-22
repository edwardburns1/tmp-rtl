module fetch(
    input wire clk,
    input wire reset,
    //input wire branch_taken,
    //input wire [31:0] branch_offset,
  output reg [31:0] pc_out,
    output reg [31:0] instruction
);

// Memory file declaration
  reg [31:0] memory [0:1023];   // Assuming a memory of size ... (1KB and 32-bit instructions)

// Testing: load memory file with instructions
  //interface with FPGA? 
initial begin
  memory[0] = 32'h11111111;
  memory[4] = 32'h22222222;
  memory[8] = 32'h33333333;
  memory[12] = 32'h44444444;
  memory[16] = 32'h55555555;
  memory[20] = 32'h66666666;
end
  

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
        pc_out <= 32'h0; // Reset output PC
    else
      pc_out <= next_pc; // Output current PC
      instruction <=memory[pc];
end

// Fetch instruction from memory based on the current PC
  /*
  always @(*) begin
    instruction = memory[pc];
end
*/
endmodule