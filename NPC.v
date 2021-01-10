`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:02 11/24/2019 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] PC,
    input [25:0] imm,
    input [3:0] NPCOp,
    input [31:0] RD1,
    input [31:0] RD2,
    output [31:0] NPC,
    output [31:0] PC4
    );
	 
	 parameter beq = 4'h1, j = 4'h2, jr = 4'h3, jalr = 4'h4, bne = 4'h5, bgtz = 4'h6, blez = 4'h7, bgez = 4'h8, bltz = 4'h9;
	 
	 assign PC4=PC+4;
	 assign NPC = ((NPCOp==beq) && (RD1==RD2))	?(PC+{{14{imm[15]}},imm[15:0],2'b00})://PC already +4
					    (NPCOp==j)									?{PC[31:28],imm,2'b00}:
						 (NPCOp==jr)								?RD1:
						 (NPCOp==jalr)								?RD1:
						 ((NPCOp==bne) && (RD1!=RD2))		?(PC+{{14{imm[15]}},imm[15:0],2'b00}):
						 ((NPCOp==bgtz) && (RD1[31]==0))?(PC+{{14{imm[15]}},imm[15:0],2'b00}):
						 ((NPCOp==blez) && (RD1[31]==1||RD1==0))?(PC+{{14{imm[15]}},imm[15:0],2'b00}):
						 ((NPCOp==bgez) && (RD1[31]==0||RD1==0))?(PC+{{14{imm[15]}},imm[15:0],2'b00}):
						 ((NPCOp==bltz) && (RD1[31]==1))?(PC+{{14{imm[15]}},imm[15:0],2'b00}):PC4;
																	 
																	 
endmodule
