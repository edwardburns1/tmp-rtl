module fetch(
    input wire clk,         
    input wire reset,        
    output reg [31:0] instruction // Output instruction
);

// Memory file declaration
reg [31:0] memory [0:1023];   // Assuming a memory of size 1KB and 32-bit instructions

// Testing: load memory file with instructions 
initial begin
    $readmemh("memory_file.mem", memory);
end
  
  //initialize PC module to set pc counter properly in the case of branches 
  
  
  

always @(posedge clk or posedge rst) begin
    if (rst) begin
        instruction <= 32'h0; 
    end else begin
        instruction <= memory[pc];
      // doesn't implement NOPs or stalls at the moment 
    end
end

endmodule