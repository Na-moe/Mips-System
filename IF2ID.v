`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:45 11/24/2019 
// Design Name: 
// Module Name:    IF2ID 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF2ID(
    input clk,
    input reset,
	 input stall,
    input [31:0] Instr_0,
	 input [31:0] PC_0,
	 output reg [31:0] Instr_01,
	 output reg [31:0] PC_01
    );
	 
	 always @(posedge clk) begin
		if(reset) begin
			Instr_01<=32'h0;
			PC_01<=32'h00003000;
		end
		else if(!stall) begin
			Instr_01<=Instr_0;
			PC_01<=PC_0;
		end
	 end


endmodule
