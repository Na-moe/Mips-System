`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:46 11/24/2019 
// Design Name: 
// Module Name:    EX2MEM 
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
module EX2MEM(
    input clk,
    input reset,
	 input [31:0] Instr_2,
	 input [31:0] PC_2,
	 input [31:0] RD2_2,
	 input [31:0] ALU_Out_2,
	 input [31:0] PC4_2,
	 input RegWrite_2,
	 output reg [31:0] Instr_23,
	 output reg [31:0] PC_23,
	 output reg [31:0] RD2_23,
	 output reg [31:0] ALU_Out_23,
	 output reg [31:0] PC4_23,
	 output reg RegWrite_23
    );
	 
	 always @(posedge clk) begin
		if(reset) begin
			Instr_23<=32'h0;
			PC_23<=32'h00003000;
			RD2_23<=32'h0;
			ALU_Out_23<=32'h0;
			PC4_23<=32'h0;
			RegWrite_23<=1'b0;
		end
		else begin
			Instr_23<=Instr_2;
			PC_23<=PC_2;
			RD2_23<=RD2_2;
			ALU_Out_23<=ALU_Out_2;
			PC4_23<=PC4_2;
			RegWrite_23<=RegWrite_2;
		end
	 end


endmodule
