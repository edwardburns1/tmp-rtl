module ALU (
    input [31:0] operand1,
    input [31:0] operand2,
  input [3:0] ALUControl,
    output reg [31:0] result
);

// ALU operations
localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam AND = 4'b0010;
localparam OR = 4'b0011;
localparam XOR = 4'b0100;
localparam SLT = 4'b0101;

  always @(ALUControl,operand1,operand2)
begin 
    case(ALUControl)
        ADD: result = operand1 + operand2;
        SUB: result = operand1 - operand2;
        AND: result = operand1 & operand2;
        OR: result = operand1 | operand2;
        XOR: result = operand1 ^ operand2;
        SLT: result = (operand1 < operand2) ? 1 : 0;
        default: result = 0;
    endcase
end

endmodule