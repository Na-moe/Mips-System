`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:25 11/24/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
	 input [4:0] s,
    input [3:0] ALUOp,
    output [31:0] Out
    );
	 
	 parameter add = 4'h0, sub = 4'h1, ori = 4'h2, anda = 4'h3, xora = 4'h4, nora = 4'h5, sll = 4'h6, srl = 4'h7, sra = 4'h8, slt = 4'h9, sltu = 4'ha;
	 
	 assign Out = (ALUOp==add)?(A+B):
						 (ALUOp==sub)?(A-B):
						 (ALUOp==ori)?(A|B):
						 (ALUOp==anda)?(A&B):
						 (ALUOp==xora)?(A^B):
						 (ALUOp==nora)?(~(A|B)):
						 (ALUOp==sll)?(B<<s):
						 (ALUOp==srl)?(B>>s):
						 (ALUOp==sra)?$signed($signed(B)>>>s):
						 (ALUOp==slt)?($signed(A)<$signed(B)?32'h1:32'h0):
						 (ALUOp==sltu)?(A<B?32'h1:32'h0):32'h0;


endmodule
