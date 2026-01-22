`timescale 1ns/1ps

module counter #(parameter N=8) (
	input reset,
	input clk,
	output logic [N-1:0] count
	);

	always_ff @(posedge clk, posedge reset)
		if (reset)
			count <= 0;
		else
			count <= count+1;
endmodule
