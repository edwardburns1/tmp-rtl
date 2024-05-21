
module PC (
    input wire clk,          
    input wire reset,         
    input wire [31:0] input_PC, 
    input wire branch_taken, 
    input wire [31:0] branch_offset,
  output reg [31:0] output_PC // Current PC value
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            output_PC <= 32'h0; // Reset PC to 0
        else begin
            if (branch_taken)
                 output_PC <= input_PC + branch_offset; 
            else
                 output_PC <= input_PC + 32'h4;
        end
    end

endmodule