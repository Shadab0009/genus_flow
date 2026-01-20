`timescale 1ns / 1ps
`include "full_adder.v"

module rca_bit_32 (
	input [31:0] A,
	input [31:0] B,
	input Cin,
	output [31:0] Sum,
	output Cout
);

	wire[32:0] carry;
	assign carry[0] = Cin;
	assign Cout = carry[32];

full_adder INST0 (
	.a	( A[0] ),
	.b	( B[0] ),
	.cin	( carry[0] ),
	.sum	( Sum[0] ),
	.cout	( carry[1] )
);

full_adder INST1 (
	.a	( A[1] ),
	.b	( B[1] ),
	.cin	( carry[1] ),
	.sum	( Sum[1] ),
	.cout	( carry[2] )
);

full_adder INST2 (
	.a	( A[2] ),
	.b	( B[2] ),
	.cin	( carry[2] ),
	.sum	( Sum[2] ),
	.cout	( carry[3] )
);

full_adder INST3 (
	.a	( A[3] ),
	.b	( B[3] ),
	.cin	( carry[3] ),
	.sum	( Sum[3] ),
	.cout	( carry[4] )
);

full_adder INST4 (
	.a	( A[4] ),
	.b	( B[4] ),
	.cin	( carry[4] ),
	.sum	( Sum[4] ),
	.cout	( carry[5] )
);

full_adder INST5 (
	.a	( A[5] ),
	.b	( B[5] ),
	.cin	( carry[5] ),
	.sum	( Sum[5] ),
	.cout	( carry[6] )
);

full_adder INST6 (
	.a	( A[6] ),
	.b	( B[6] ),
	.cin	( carry[6] ),
	.sum	( Sum[6] ),
	.cout	( carry[7] )
);

full_adder INST7 (
	.a	( A[7] ),
	.b	( B[7] ),
	.cin	( carry[7] ),
	.sum	( Sum[7] ),
	.cout	( carry[8] )
);

full_adder INST8 (
	.a	( A[8] ),
	.b	( B[8] ),
	.cin	( carry[8] ),
	.sum	( Sum[8] ),
	.cout	( carry[9] )
);

full_adder INST9 (
	.a	( A[9] ),
	.b	( B[9] ),
	.cin	( carry[9] ),
	.sum	( Sum[9] ),
	.cout	( carry[10] )
);

full_adder INST10 (
	.a	( A[10] ),
	.b	( B[10] ),
	.cin	( carry[10] ),
	.sum	( Sum[10] ),
	.cout	( carry[11] )
);

full_adder INST11 (
	.a	( A[11] ),
	.b	( B[11] ),
	.cin	( carry[11] ),
	.sum	( Sum[11] ),
	.cout	( carry[12] )
);

full_adder INST12 (
	.a	( A[12] ),
	.b	( B[12] ),
	.cin	( carry[12] ),
	.sum	( Sum[12] ),
	.cout	( carry[13] )
);

full_adder INST13 (
	.a	( A[13] ),
	.b	( B[13] ),
	.cin	( carry[13] ),
	.sum	( Sum[13] ),
	.cout	( carry[14] )
);

full_adder INST14 (
	.a	( A[14] ),
	.b	( B[14] ),
	.cin	( carry[14] ),
	.sum	( Sum[14] ),
	.cout	( carry[15] )
);

full_adder INST15 (
	.a	( A[15] ),
	.b	( B[15] ),
	.cin	( carry[15] ),
	.sum	( Sum[15] ),
	.cout	( carry[16] )
);

full_adder INST16 (
	.a	( A[16] ),
	.b	( B[16] ),
	.cin	( carry[16] ),
	.sum	( Sum[16] ),
	.cout	( carry[17] )
);

full_adder INST17 (
	.a	( A[17] ),
	.b	( B[17] ),
	.cin	( carry[17] ),
	.sum	( Sum[17] ),
	.cout	( carry[18] )
);

full_adder INST18 (
	.a	( A[18] ),
	.b	( B[18] ),
	.cin	( carry[18] ),
	.sum	( Sum[18] ),
	.cout	( carry[19] )
);

full_adder INST19 (
	.a	( A[19] ),
	.b	( B[19] ),
	.cin	( carry[19] ),
	.sum	( Sum[19] ),
	.cout	( carry[20] )
);

full_adder INST20 (
	.a	( A[20] ),
	.b	( B[20] ),
	.cin	( carry[20] ),
	.sum	( Sum[20] ),
	.cout	( carry[21] )
);

full_adder INST21 (
	.a	( A[21] ),
	.b	( B[21] ),
	.cin	( carry[21] ),
	.sum	( Sum[21] ),
	.cout	( carry[22] )
);

full_adder INST22 (
	.a	( A[22] ),
	.b	( B[22] ),
	.cin	( carry[22] ),
	.sum	( Sum[22] ),
	.cout	( carry[23] )
);

full_adder INST23 (
	.a	( A[23] ),
	.b	( B[23] ),
	.cin	( carry[23] ),
	.sum	( Sum[23] ),
	.cout	( carry[24] )
);

full_adder INST24 (
	.a	( A[24] ),
	.b	( B[24] ),
	.cin	( carry[24] ),
	.sum	( Sum[24] ),
	.cout	( carry[25] )
);

full_adder INST25 (
	.a	( A[25] ),
	.b	( B[25] ),
	.cin	( carry[25] ),
	.sum	( Sum[25] ),
	.cout	( carry[26] )
);

full_adder INST26 (
	.a	( A[26] ),
	.b	( B[26] ),
	.cin	( carry[26] ),
	.sum	( Sum[26] ),
	.cout	( carry[27] )
);

full_adder INST27 (
	.a	( A[27] ),
	.b	( B[27] ),
	.cin	( carry[27] ),
	.sum	( Sum[27] ),
	.cout	( carry[28] )
);

full_adder INST28 (
	.a	( A[28] ),
	.b	( B[28] ),
	.cin	( carry[28] ),
	.sum	( Sum[28] ),
	.cout	( carry[29] )
);

full_adder INST29 (
	.a	( A[29] ),
	.b	( B[29] ),
	.cin	( carry[29] ),
	.sum	( Sum[29] ),
	.cout	( carry[30] )
);

full_adder INST30 (
	.a	( A[30] ),
	.b	( B[30] ),
	.cin	( carry[30] ),
	.sum	( Sum[30] ),
	.cout	( carry[31] )
);

full_adder INST31 (
	.a	( A[31] ),
	.b	( B[31] ),
	.cin	( carry[31] ),
	.sum	( Sum[31] ),
	.cout	( carry[32] )
);

endmodule
