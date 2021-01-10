`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:58 11/24/2019 
// Design Name: 
// Module Name:    stall 
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
module stall(
	 input [31:0] Instr_FD,
	 input [31:0] Instr_DE,
	 input [31:0] Instr_EM,
	 input RegWrite_DE,
	 input RegWrite_EM,
	 input RegWrite_MW,
	 output stall
    );
	 
	 parameter 	addu_func 	= 	6'b100001,
						subu_func 	= 	6'b100011,
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
						jr_func 		= 	6'b001000,
						jalr_func		=	6'b001001,
						movz_func		=	6'b001010,
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
						sh 				= 	6'b101001,
						bgez_rt		=	5'b00001,
						bltz_rt		=	5'b00000;
	 
	 wire [1:0] TuseD_rs, TuseD_rt, TnewE_rt, TnewE_rd, TnewM_rt, TnewM_rd, TnewE_ra, TnewM_ra;
	 wire [4:0] D_rs, D_rt, E_rt, E_rd, M_rt, M_rd;
	 wire [5:0] opD, funcD, opE, funcE, opM, funcM;
	 
	 assign D_rs = Instr_FD[25:21];
	 assign D_rt = Instr_FD[20:16];
	 assign E_rt = Instr_DE[20:16];
	 assign E_rd = Instr_DE[15:11];
	 assign M_rt = Instr_EM[20:16];
	 assign M_rd = Instr_EM[15:11];
	 
	 assign opD = Instr_FD[31:26];
	 assign funcD = Instr_FD[5:0];
	 assign opE = Instr_DE[31:26];
	 assign funcE = Instr_DE[5:0];
	 assign opM = Instr_EM[31:26];
	 assign funcM = Instr_EM[5:0];
	 
	 assign TuseD_rs = 	(opD == 6'b000000)?
										(	(funcD ==	addu_func)	?2'b01:
											(funcD == subu_func)	?2'b01:
											(funcD ==	add_func)		?2'b01:
											(funcD == sub_func)		?2'b01:
											(funcD ==	and_func)		?2'b01:
											(funcD == or_func)		?2'b01:
											(funcD ==	xor_func)		?2'b01:
											(funcD == nor_func)		?2'b01:
											(funcD == sll_func)		?2'b11:
											(funcD ==	srl_func)		?2'b11:
											(funcD == sra_func)		?2'b11:
											(funcD == jr_func)		?2'b00:
											(funcD == sllv_func)	?2'b01:
											(funcD ==	srlv_func)	?2'b01:
											(funcD == slt_func)		?2'b01:
											(funcD ==	sltu_func)	?2'b01:
											(funcD == srav_func)	?2'b01:
											(funcD == jalr_func)	?2'b00:
											(funcD == movz_func)	?2'b01:2'b11):
									(opD == ori)							?2'b01:
									(opD == addi)						?2'b01:
									(opD == addiu)						?2'b01:
									(opD == andi)						?2'b01:
									(opD == xori)						?2'b01:
									(opD == slti)						?2'b01:
									(opD == sltiu)						?2'b01:
									(opD == lw)							?2'b01:
									(opD == lb)							?2'b01:
									(opD == lbu)							?2'b01:
									(opD == lh)							?2'b01:
									(opD == lhu)							?2'b01:
									(opD == sw)							?2'b01:
									(opD == sh)							?2'b01:
									(opD == sb)							?2'b01:
									(opD == beq)							?2'b00:
									(opD == bne)							?2'b00:
									(opD == bgtz)						?2'b00:
									(opD == blez)						?2'b00:
									(opD == lui)							?2'b01:
									(opD == 6'b000001)?
										(D_rt==bgez_rt)				?2'b00:
										(D_rt==bltz_rt)				?2'b00:2'b11:2'b11;
									
	 assign TuseD_rt = 	(opD == 6'b000000)?
										(	(funcD ==	addu_func)	?2'b01:
											(funcD == subu_func)	?2'b01:
											(funcD ==	add_func)		?2'b01:
											(funcD == sub_func)		?2'b01:
											(funcD ==	and_func)		?2'b01:
											(funcD == or_func)		?2'b01:
											(funcD ==	xor_func)		?2'b01:
											(funcD == nor_func)		?2'b01:
											(funcD == sll_func)		?2'b01:
											(funcD ==	srl_func)		?2'b01:
											(funcD == sra_func)		?2'b01:
											(funcD == sllv_func)	?2'b01:
											(funcD ==	srlv_func)	?2'b01:
											(funcD == srav_func)	?2'b01:
											(funcD == slt_func)		?2'b01:
											(funcD ==	sltu_func)	?2'b01:
											(funcD == jalr_func)	?2'b11:
											(funcD == movz_func)	?2'b00:2'b11):
									(opD == ori)							?2'b11:
									(opD == addi)						?2'b11:
									(opD == addiu)						?2'b11:
									(opD == andi)						?2'b11:
									(opD == xori)						?2'b11:
									(opD == slti)						?2'b11:
									(opD == sltiu)						?2'b11:
									(opD == lw)							?2'b11:
									(opD == lb)							?2'b11:
									(opD == lbu)							?2'b11:
									(opD == lh)							?2'b11:
									(opD == lhu)							?2'b11:
									(opD == sw)							?2'b10:
									(opD == sh)							?2'b10:
									(opD == sb)							?2'b10:
									(opD == beq)							?2'b00:
									(opD == bne)							?2'b00:
									(opD == bgtz)						?2'b11:
									(opD == blez)						?2'b11:
									(opD == lui)							?2'b11:2'b11;//bgez, bltz belong to default
	
	 assign TnewE_rt = 	(opE == 6'b000000)?
										(	(funcE ==	addu_func)	?2'b00:
											(funcE == subu_func)	?2'b00:
											(funcE ==	add_func)		?2'b00:
											(funcE == sub_func)		?2'b00:
											(funcE ==	and_func)		?2'b00:
											(funcE == or_func)		?2'b00:
											(funcE ==	xor_func)		?2'b00:
											(funcE == nor_func)		?2'b00:
											(funcE == sll_func)		?2'b00:
											(funcE ==	srl_func)		?2'b00:
											(funcE == sra_func)		?2'b00:
											(funcE == sllv_func)	?2'b00:
											(funcE ==	srlv_func)	?2'b00:
											(funcE == srav_func)	?2'b00:
											(funcE ==	slt_func)		?2'b00:
											(funcE == sltu_func)	?2'b00:
											(funcE == jalr_func)	?2'b00:
											(funcE == movz_func)	?2'b00:2'b00):
									(opE == ori)							?2'b01:
									(opE == addi)						?2'b01:
									(opE == addiu)						?2'b01:
									(opE == andi)						?2'b01:
									(opE == xori)						?2'b01:
									(opE == slti)						?2'b01:
									(opE == sltiu)						?2'b01:
									(opE == lw)							?2'b10:
									(opE == lb)							?2'b10:
									(opE == lbu)							?2'b10:
									(opE == lh)							?2'b10:
									(opE == lhu)							?2'b10:
									(opE == sw)							?2'b00:
									(opE == sh)							?2'b00:
									(opE == sb)							?2'b00:
									(opE == beq)							?2'b00:
									(opE == lui)							?2'b01:2'b00;//bgez, bltz belong to default
									
	 assign TnewE_rd = 	(opE == 6'b000000)?
										(	(funcE ==	addu_func)	?2'b01:
											(funcE == subu_func)	?2'b01:
											(funcE ==	add_func)		?2'b01:
											(funcE == sub_func)		?2'b01:
											(funcE ==	and_func)		?2'b01:
											(funcE == or_func)		?2'b01:
											(funcE ==	xor_func)		?2'b01:
											(funcE == nor_func)		?2'b01:
											(funcE == sll_func)		?2'b01:
											(funcE ==	srl_func)		?2'b01:
											(funcE == sra_func)		?2'b01:
											(funcE == sllv_func)	?2'b01:
											(funcE ==	srlv_func)	?2'b01:
											(funcE == srav_func)	?2'b01:
											(funcE ==	slt_func)		?2'b01:
											(funcE == sltu_func)	?2'b01:
											(funcE == jalr_func)	?2'b10:
											(funcE == movz_func)	?2'b01:2'b00):
									(opE == ori)							?2'b00:
									(opE == addi)						?2'b00:
									(opE == addiu)						?2'b00:
									(opE == andi)						?2'b00:
									(opE == xori)						?2'b00:
									(opE == slti)						?2'b00:
									(opE == sltiu)						?2'b00:
									(opE == lw)							?2'b00:
									(opE == lb)							?2'b00:
									(opE == lbu)							?2'b00:
									(opE == lh)							?2'b00:
									(opE == lhu)							?2'b00:
									(opE == sw)							?2'b00:
									(opE == sh)							?2'b00:
									(opE == sb)							?2'b00:
									(opE == beq)							?2'b00:
									(opE == lui)							?2'b00:2'b00;//bgez, bltz belong to default
								
	 assign TnewM_rt = 	(opM == 6'b000000)?
										(	(funcM ==	addu_func)	?2'b00:
											(funcM == subu_func)	?2'b00:
											(funcM ==	add_func)		?2'b00:
											(funcM == sub_func)		?2'b00:
											(funcM ==	and_func)		?2'b00:
											(funcM == or_func)		?2'b00:
											(funcM ==	xor_func)		?2'b00:
											(funcM == nor_func)		?2'b00:
											(funcM == sll_func)		?2'b00:
											(funcM ==	srl_func)		?2'b00:
											(funcM == sra_func)		?2'b00:
											(funcM == sllv_func)	?2'b00:
											(funcM ==	srlv_func)	?2'b00:
											(funcM == srav_func)	?2'b00:
											(funcM ==	slt_func)		?2'b00:
											(funcM == sltu_func)	?2'b00:
											(funcM == jalr_func)	?2'b00:
											(funcM == movz_func)	?2'b00:2'b00):
									(opM == ori)							?2'b00:
									(opM == addi)						?2'b00:
									(opM == addiu)						?2'b00:
									(opM == andi)						?2'b00:
									(opM == xori)						?2'b00:
									(opM == slti)						?2'b00:
									(opM == sltiu)						?2'b00:
									(opM == lw)							?2'b01:
									(opM == lb)							?2'b01:
									(opM == lbu)							?2'b01:
									(opM == lh)							?2'b01:
									(opM == lhu)							?2'b01:
									(opM == sw)							?2'b00:
									(opM == sh)							?2'b00:
									(opM == sb)							?2'b00:
									(opM == beq)							?2'b00:
									(opM == lui)							?2'b00:2'b00;//bgez, bltz belong to default
									
	 assign TnewM_rd = 	(opM == 6'b000000 && funcM == jalr_func)?2'b01:2'b00;
	 
	 assign TnewE_ra = (opE == jal)?2'b10:2'b00;
	 
	 assign TnewM_ra = (opM == jal)?2'b01:2'b00;
	 
	 assign stall = 		((D_rs==E_rt)?(TuseD_rs<TnewE_rt):1'b0)
								||	((D_rs==E_rd)?(TuseD_rs<TnewE_rd):1'b0)
								||	((D_rs==M_rt)?(TuseD_rs<TnewM_rt):1'b0)
								||	((D_rs==M_rd)?(TuseD_rs<TnewM_rd):1'b0)
								||	((D_rt==E_rt)?(TuseD_rt<TnewE_rt):1'b0)
								||	((D_rt==E_rd)?(TuseD_rt<TnewE_rd):1'b0)
								||	((D_rt==M_rt)?(TuseD_rt<TnewM_rt):1'b0)
								||	((D_rt==M_rd)?(TuseD_rt<TnewM_rd):1'b0)
								||	((D_rs==5'h1f)?(TuseD_rs<TnewE_ra):1'b0)
								||	((D_rt==5'h1f)?(TuseD_rt<TnewE_ra):1'b0)
								||	((D_rs==5'h1f)?(TuseD_rs<TnewM_ra):1'b0)
								||	((D_rt==5'h1f)?(TuseD_rt<TnewM_ra):1'b0);
	 


endmodule
