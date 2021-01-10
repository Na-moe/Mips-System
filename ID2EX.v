`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:25 11/24/2019 
// Design Name: 
// Module Name:    ID2EX 
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
module ID2EX(
    input clk,
    input reset,
	 input [31:0] Instr_1,
	 input [31:0] PC_1,
	 input [31:0] RD1_1,
	 input [31:0] RD2_1,
	 input [31:0] imm32_1,
	 input [31:0] PC4_1,
	 input RegWrite_1,
	 output reg [31:0] Instr_12,
	 output reg [31:0] PC_12,
	 output reg [31:0] RD1_12,
	 output reg [31:0] RD2_12,
	 output reg [31:0] imm32_12,
	 output reg [31:0] PC4_12,
	 output reg RegWrite_12
    );
	 
	 always @(posedge clk) begin
		if(reset) begin
			Instr_12<=32'h0;
			PC_12<=32'h00003000;
			RD1_12<=32'h0;
			RD2_12<=32'h0;
			imm32_12<=32'h0;
			PC4_12<=32'h0;
			RegWrite_12<=1'b0;
		end
		else begin
			Instr_12<=Instr_1;
			PC_12<=PC_1;
			RD1_12<=RD1_1;
			RD2_12<=RD2_1;
			imm32_12<=imm32_1;
			PC4_12<=PC4_1;
			RegWrite_12<=RegWrite_1;
		end
	 end


endmodule
