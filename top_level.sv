module Top_Level_Module(
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal
    input wire [31:0] instruction,  // Input instruction

    // Output signals
);

// Internal pipeline registers..

// Stage 1: Instruction Fetch (I)
always @(posedge clk or posedge reset) begin

end

  // Stage 2: Execute (A)
always @(posedge clk or posedge reset) begin
  
end

  // Stage 3:Write back (W)
always @(posedge clk or posedge reset) begin
    
end


endmodule
