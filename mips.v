`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:05 11/24/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 
	 /* Add instr with Conditional Regwrite
	 ** eg. movz, blezalc
	 ** CTRL_ID, CTRL_EX, CTRL_MEM, CTRL_WB : add parameter, add ctrl_signals related to this
	 ** mips : add func output(DE¡¢EM¡¢MW's RegWrite),  add stall and forward input(the same)
	 ** stall : TnewE, TnewM is related to RegWrite
	 ** forward : EM_Write, MW_Write is related to RegWrite
	 */
	 
	 /* Add instr only about calculate
	 ** alu add new paramter and operation
	 ** all CTRLs add parameter and ctrl_signals
	 ** stall : TuseD, TnewE, TnewM
	 ** forward : EM_Write, MW_Write
	 */
	 
	 /* Add instr about MemWrite
	 ** eg. sb, lb
	 ** MEM : MemWrite == sb ?
	 ** all CTRLs add parameter and ctrl_signals, similar to sw, lw, except MemWrite
	 ** stall : TuseD, TnewE, TnewM, similar to sw, lw
	 ** forward : EM_Write, MW_Write, similar to sw, lw
	 */
	 
	 wire stall;
	 wire RegWrite_DE, RegWrite_EM, RegWrite_MW;
	 wire [31:0] Instr_FD, Instr_DE, Instr_EM, Instr_MW;
	 wire forwardMD1, forwardMD2, forwardME1, forwardME2, forwardWD1, forwardWD2, forwardWE1, forwardWE2, forwardWM;
	 
	 func 		func_p5				(	.clk(clk),
													.reset(reset),
													.stall(stall),
													.forwardMD1(forwardMD1),
													.forwardMD2(forwardMD2),
													.forwardME1(forwardME1),
													.forwardME2(forwardME2),
													.forwardWD1(forwardWD1),
													.forwardWD2(forwardWD2),
													.forwardWE1(forwardWE1),
													.forwardWE2(forwardWE2),
													.forwardWM(forwardWM),
													.Instr_FD(Instr_FD),
													.Instr_DE(Instr_DE),
													.Instr_EM(Instr_EM),
													.Instr_MW(Instr_MW),
													.RegWrite_DE(RegWrite_DE),
													.RegWrite_EM(RegWrite_EM),
													.RegWrite_MW(RegWrite_MW));
								
	 forward 	forward_p5			(	.Instr_FD(Instr_FD),
													.Instr_DE(Instr_DE),
													.Instr_EM(Instr_EM),
													.Instr_MW(Instr_MW),
													.RegWrite_EM(RegWrite_EM),
													.RegWrite_MW(RegWrite_MW),
													.forwardMD1(forwardMD1),
													.forwardMD2(forwardMD2),
													.forwardME1(forwardME1),
													.forwardME2(forwardME2),
													.forwardWD1(forwardWD1),
													.forwardWD2(forwardWD2),
													.forwardWE1(forwardWE1),
													.forwardWE2(forwardWE2),
													.forwardWM(forwardWM));
	 
	 stall 		stall_p5				(	.Instr_FD(Instr_FD),
													.Instr_DE(Instr_DE),
													.Instr_EM(Instr_EM),
													.RegWrite_DE(RegWrite_DE),
													.RegWrite_EM(RegWrite_EM),
													.RegWrite_MW(RegWrite_MW),
													.stall(stall));
	 


endmodule
