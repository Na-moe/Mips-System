`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:33 11/24/2019 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	 input [15:0] imm16,
	 input [1:0] EXTOp,
	 output [31:0] imm32
    );
	 
	 assign imm32 = (EXTOp==2'b00)?({{16{imm16[15]}},imm16}):
							 (EXTOp==2'b01)?({16'b0,imm16}):
							 (EXTOp==2'b10)?({imm16,16'b0}):
							 (EXTOp==2'b11)?({{14{imm16[15]}},imm16,2'b0}):32'b0;


endmodule
