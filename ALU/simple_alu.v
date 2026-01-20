`timescale 1ns/1ps
`include "/home/shadab/shadab/TCL/full_adder.v"
`include "/home/shadab/shadab/TCL/rca_bit_32.v"

module simple_alu (
	input [31:0] A,
	input [31:0] B,
	input [1:0] ALUControl,
	output [31:0] Result,
	output zero,
	output Cout
	);

	wire [31:0] Sum, or_op, and_op, B_input;
	
	assign or_op = A | B;
	assign and_op = A & B;
	assign B_input = (ALUControl[0] == 1'b1) ? ~B : B ;
	
	rca_bit_32 I1 (.A(A), .B(B_input), .Cin(ALUControl[0]), .Sum(Sum), .Cout(Cout));

	reg [31:0] final_result;

	always @(*) begin
		case (ALUControl)
			2'b00: final_result = Sum;
			2'b01: final_result = Sum;
			2'b10: final_result = and_op;
			2'b11: final_result = or_op;
			default: final_result = 32'b0;
		endcase
	end
	
	assign Result = final_result;
	assign zero = (Result == 32'b0);

endmodule
