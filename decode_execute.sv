module decode_execute(
    input wire clk,             
    input wire reset,             
    input wire [31:0] instruction
    output reg [31:0] result,  
    output reg reg_write_enable 
);
  
  // STEP 1: Extract opcode and operands from instruction
  
  // Execute operation based on opcode
  // - use ALU module 
  // - use reg file? 
  
  
  
always @(posedge clk or posedge reset) begin
    if (reset) begin
        result <= 32'h0;
        reg_write_enable <= 1'b0;
    end else begin
      //decode instructiosn and set operands and connect to ALU/reg file 
        
    end
end
  
  


endmodule