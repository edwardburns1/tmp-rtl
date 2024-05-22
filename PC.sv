module PC (
    input wire clk,
    input wire reset,
   // input wire branch_taken,
  //  input wire [31:0] branch_offset,
    output reg [31:0] output_PC
);

reg [31:0] current_PC;

always @(posedge clk or posedge reset) begin
    if (reset)
        current_PC <= 32'h0; // Reset PC to 0
    else begin
        current_PC <= current_PC + 32'h4;
      /*
        if (branch_taken)
            current_PC <= current_PC + branch_offset;
        else
            current_PC <= current_PC + 32'h4;
            */
    end
end

always @(posedge clk or posedge reset) begin
    if (reset)
        output_PC <= 32'h0; 
    else
        output_PC <= current_PC; 
end
endmodule