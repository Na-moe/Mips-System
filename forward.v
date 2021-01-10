`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:38:11 11/24/2019 
// Design Name: 
// Module Name:    forward 
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
module forward(
	  input [31:0] Instr_FD,
	  input [31:0] Instr_DE,
	  input [31:0] Instr_EM,
	  input [31:0] Instr_MW,
	  input RegWrite_EM,
	  input RegWrite_MW,
	  output forwardMD1,
	  output forwardMD2,
	  output forwardME1,
	  output forwardME2,
	  output forwardWD1,
	  output forwardWD2,
	  output forwardWE1,
	  output forwardWE2,
	  output forwardWM
    );
	 `define __op [31:26]
	 `define __func [5:0]
	 `define __rs [25:21]
	 `define __rt [20:16]
	 `define __rd [15:11]
	 
	 parameter 	addu_func 	= 	6'b100001,
						subu_func 	= 	6'b100011,
						jr_func 		= 	6'b001000,
						jalr_func		=	6'b001001,
						movz_func 	=	6'b001010,
						add_func 		= 	6'b100000,
						sub_func 		= 	6'b100010,
						and_func 		= 	6'b100100,
						or_func 		= 	6'b100101,
						xor_func 		= 	6'b100110,
						nor_func 		= 	6'b100111,
						sll_func 		= 	6'b000000,
						srl_func 		= 	6'b000010,
						sra_func 		= 	6'b000011,
						sllv_func 	= 	6'b000100,
						srlv_func 	= 	6'b000110,
						srav_func 	= 	6'b000111,
						slt_func 		= 	6'b101010,
						sltu_func 	= 	6'b101011,
						ori 				=	6'b001101,
						lw					=	6'b100011,
						sw					=	6'b101011,
						beq 				=	6'b000100,
						bne 				= 	6'b000101,
						bgtz 			= 	6'b000111,
						blez 			= 	6'b000110,
						lui 				=	6'b001111,
						slti 			= 	6'b001010,
						sltiu		 	= 	6'b001011,
						addi 			= 	6'b001000,
						addiu 			= 	6'b001001,
						andi 			= 	6'b001100,
						xori 			= 	6'b001110,
						j 					=	6'b000010,
						jal 				=	6'b000011,
						lb 				= 	6'b100000,
						lbu 				= 	6'b100100,
						lh 				= 	6'b100001,
						lhu 				= 	6'b100101,
						sb 				= 	6'b101000,
						sh 				= 	6'b101001;
	 
	 wire [4:0] EM_Write, MW_Write;
	 
	 assign EM_Write = 	(Instr_EM`__op == 6'b000000)?
										(	(Instr_EM`__func ==	addu_func)	?Instr_EM`__rd:
											(Instr_EM`__func == subu_func)	?Instr_EM`__rd:
											(Instr_EM`__func ==	add_func)		?Instr_EM`__rd:
											(Instr_EM`__func == sub_func)	?Instr_EM`__rd:
											(Instr_EM`__func == and_func)	?Instr_EM`__rd:
											(Instr_EM`__func == or_func)		?Instr_EM`__rd:
											(Instr_EM`__func == xor_func)	?Instr_EM`__rd:
											(Instr_EM`__func == nor_func)	?Instr_EM`__rd:
											(Instr_EM`__func == sll_func)	?Instr_EM`__rd:
											(Instr_EM`__func == srl_func)	?Instr_EM`__rd:
											(Instr_EM`__func == sra_func)	?Instr_EM`__rd:
											(Instr_EM`__func == sllv_func)	?Instr_EM`__rd:
											(Instr_EM`__func == srlv_func)	?Instr_EM`__rd:
											(Instr_EM`__func == srav_func)	?Instr_EM`__rd:
											(Instr_EM`__func == slt_func)	?Instr_EM`__rd:
											(Instr_EM`__func == sltu_func)	?Instr_EM`__rd:
											(Instr_EM`__func == jr_func)		?5'h0:
											(Instr_EM`__func == jalr_func)	?5'h0:
											(Instr_EM`__func == movz_func)  ?((RegWrite_EM)?Instr_EM`__rd:5'h0)
																								:5'h0):
									(Instr_EM`__op == ori)						?Instr_EM`__rt:
									(Instr_EM`__op == addi)						?Instr_EM`__rt:
									(Instr_EM`__op == addiu)						?Instr_EM`__rt:
									(Instr_EM`__op == andi)						?Instr_EM`__rt:
									(Instr_EM`__op == xori)						?Instr_EM`__rt:
									(Instr_EM`__op == slti)						?Instr_EM`__rt:
									(Instr_EM`__op == sltiu)						?Instr_EM`__rt:
									(Instr_EM`__op == lw)							?5'h0:
									(Instr_EM`__op == lb)							?5'h0:
									(Instr_EM`__op == lbu)						?5'h0:
									(Instr_EM`__op == lh)							?5'h0:
									(Instr_EM`__op == lhu)						?5'h0:
									(Instr_EM`__op == sw)							?5'h0:
									(Instr_EM`__op == sh)							?5'h0:
									(Instr_EM`__op == sb)							?5'h0:
									(Instr_EM`__op == beq)						?5'h0:
									(Instr_EM`__op == bne)						?5'h0:
									(Instr_EM`__op == bgtz)						?5'h0:
									(Instr_EM`__op == blez)						?5'h0:
									(Instr_EM`__op == lui)						?Instr_EM`__rt:
									(Instr_EM`__op == j)							?5'h0:
									(Instr_EM`__op == jal)						?5'h0:5'h0;//bgez,bltz belong to default
	 
	 assign MW_Write = 	(Instr_MW`__op == 6'b000000)?
										(	(Instr_MW`__func ==	addu_func)	?Instr_MW`__rd:
											(Instr_MW`__func == subu_func)	?Instr_MW`__rd:
											(Instr_EM`__func ==	add_func)		?Instr_MW`__rd:
											(Instr_EM`__func == sub_func)	?Instr_MW`__rd:
											(Instr_EM`__func == and_func)	?Instr_MW`__rd:
											(Instr_EM`__func == or_func)		?Instr_MW`__rd:
											(Instr_EM`__func == xor_func)	?Instr_MW`__rd:
											(Instr_EM`__func == nor_func)	?Instr_MW`__rd:
											(Instr_EM`__func == sll_func)	?Instr_MW`__rd:
											(Instr_EM`__func == srl_func)	?Instr_MW`__rd:
											(Instr_EM`__func == sra_func)	?Instr_MW`__rd:
											(Instr_EM`__func == sllv_func)	?Instr_MW`__rd:
											(Instr_EM`__func == srlv_func)	?Instr_MW`__rd:
											(Instr_EM`__func == srav_func)	?Instr_MW`__rd:
											(Instr_EM`__func == slt_func)	?Instr_MW`__rd:
											(Instr_EM`__func == sltu_func)	?Instr_MW`__rd:
											(Instr_MW`__func == jr_func)		?5'h0:
											(Instr_MW`__func == jr_func)		?Instr_MW`__rd:
											(Instr_MW`__func == movz_func)  ?((RegWrite_MW)?Instr_MW`__rd:5'h0)
																								:5'h0):
									(Instr_MW`__op == ori)						?Instr_MW`__rt:
									(Instr_MW`__op == addi)						?Instr_MW`__rt:
									(Instr_MW`__op == addiu)						?Instr_MW`__rt:
									(Instr_MW`__op == andi)						?Instr_MW`__rt:
									(Instr_MW`__op == xori)						?Instr_MW`__rt:
									(Instr_MW`__op == slti)						?Instr_MW`__rt:
									(Instr_MW`__op == sltiu)						?Instr_MW`__rt:
									(Instr_MW`__op == lw)							?Instr_MW`__rt:
									(Instr_MW`__op == lb)							?Instr_MW`__rt:
									(Instr_MW`__op == lbu)						?Instr_MW`__rt:
									(Instr_MW`__op == lh)							?Instr_MW`__rt:
									(Instr_MW`__op == lhu)						?Instr_MW`__rt:
									(Instr_MW`__op == sw)							?5'h0:
									(Instr_EM`__op == sh)							?5'h0:
									(Instr_EM`__op == sb)							?5'h0:
									(Instr_MW`__op == beq)						?5'h0:
									(Instr_EM`__op == bne)						?5'h0:
									(Instr_EM`__op == bgtz)						?5'h0:
									(Instr_EM`__op == blez)						?5'h0:
									(Instr_MW`__op == lui)						?Instr_MW`__rt:
									(Instr_MW`__op == j)							?5'h0:
									(Instr_MW`__op == jal)						?5'h1f:5'h0;//bgez,bltz belong to default
	 
	 assign forwardMD1 	= 		((EM_Write==Instr_FD`__rs) && EM_Write!=5'h0);
	 assign forwardMD2 	= 		((EM_Write==Instr_FD`__rt) && EM_Write!=5'h0);
	 assign forwardME1 	= 		((EM_Write==Instr_DE`__rs) && EM_Write!=5'h0);
	 assign forwardME2 	= 		((EM_Write==Instr_DE`__rt) && EM_Write!=5'h0);
	 assign forwardWD1 	= 		((MW_Write==Instr_FD`__rs) && MW_Write!=5'h0);
	 assign forwardWD2 	= 		((MW_Write==Instr_FD`__rt) && MW_Write!=5'h0);
	 assign forwardWE1 	= 		((MW_Write==Instr_DE`__rs) && MW_Write!=5'h0);
	 assign forwardWE2 	= 		((MW_Write==Instr_DE`__rt) && MW_Write!=5'h0);
	 assign forwardWM 	= 		((MW_Write==Instr_EM`__rt) && MW_Write!=5'h0);
	 


endmodule
