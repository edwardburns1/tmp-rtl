module decode_execute(
    input wire clk,             
    input wire reset,             
    input wire [31:0] instruction,
    output reg [31:0] result,  
    output reg reg_write_enable,
    output reg mem_write_enable, 
    output reg [4:0] register, 
    output reg [31:0] mem_address
  
);
  
  // STEP 1: Extract opcode and operands from instruction
  
  // Execute operation based on opcode
  // - use ALU module 
  // - use reg file? 
  
  //reg [31:0] register, memory_address;
  
always @(posedge clk or posedge reset) begin
    if (reset) begin
        result <= 32'h0;
        reg_write_enable <= 1'b0;
        mem_write_enable <= 1'b0;
    end else begin
      //ex: load word 
      if (instruction[31:29] == 3'b010 ) begin
        $display(" decoding instruction: lw");
        //set reg write enable to true,
        // set source and desitnation addresses for writeback 
        // write back always loads inot register ld
      end 
      //decode instructiosn and set operands and connect to ALU/reg file 
        
    end
end
  
  


endmodule