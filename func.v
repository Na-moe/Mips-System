`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:35 11/24/2019 
// Design Name: 
// Module Name:    func 
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
module func(
    input clk,
    input reset,
	 input stall,
	 input forwardMD1,
	 input forwardMD2,
	 input forwardME1,
	 input forwardME2,
	 input forwardWD1,
	 input forwardWD2,
	 input forwardWE1,
	 input forwardWE2,
	 input forwardWM,
	 output [31:0] Instr_FD,
	 output [31:0] Instr_DE,
	 output [31:0] Instr_EM,
	 output [31:0] Instr_MW,
	 output RegWrite_DE,
	 output RegWrite_EM,
	 output RegWrite_MW
    );
	 
	 wire [31:0] NPC, GRF_WD;
	 wire [31:0] Instr_0, Instr_01, Instr_1, Instr_12, Instr_2, Instr_23, Instr_3, Instr_34, Instr_4;
	 wire [31:0] PC_0, PC_01, PC_1, PC_12, PC_2, PC_23, PC_3, PC_34, PC_4;
	 wire [31:0] PC4_1, PC4_12, PC4_2, PC4_23, PC4_3, PC4_34;
	 wire [31:0] RD1_1, RD1_12, RD1_2;
	 wire [31:0] RD2_1, RD2_12, RD2_2, RD2_23;
	 wire [31:0] imm32_1, imm32_12;
	 wire [31:0] ALU_Out_2, ALU_Out_23, ALU_Out_3, ALU_Out_34;
	 wire [31:0] DM_RD_3, DM_RD_34;
	 wire RegWrite;
	 wire [1:0] RegDst;
	 
	 wire [31:0] WD1_NPC, WD2_NPC, WE1_ALU, WE2_ALU, MD1_NPC, MD2_NPC, ME1_ALU, ME2_ALU, WM_DM;
	 
	 MUX_2_32 md1	(.in1(WD1_NPC), .in2(ALU_Out_23), .sel(forwardMD1), .out(MD1_NPC));
	 MUX_2_32 md2	(.in1(WD2_NPC), .in2(ALU_Out_23), .sel(forwardMD2), .out(MD2_NPC));
	 MUX_2_32 me1	(.in1(WE1_ALU), .in2(ALU_Out_23), .sel(forwardME1), .out(ME1_ALU));
	 MUX_2_32 me2	(.in1(WE2_ALU), .in2(ALU_Out_23), .sel(forwardME2), .out(ME2_ALU));
	 MUX_2_32 wd1	(.in1(RD1_1), .in2(GRF_WD), .sel(forwardWD1), .out(WD1_NPC));
	 MUX_2_32 wd2	(.in1(RD2_1), .in2(GRF_WD), .sel(forwardWD2), .out(WD2_NPC));
	 MUX_2_32 we1	(.in1(RD1_12), .in2(GRF_WD), .sel(forwardWE1), .out(WE1_ALU));
	 MUX_2_32 we2	(.in1(RD2_12), .in2(GRF_WD), .sel(forwardWE2), .out(WE2_ALU));
	 MUX_2_32 wm		(.in1(RD2_23), .in2(GRF_WD), .sel(forwardWM), .out(WM_DM));
	 
	 IF 			ifu		(	.clk(clk),
									.reset(reset), 
									.stall(stall), 
									.NPC(NPC), 
									.Instr_0(Instr_0), 
									.PC_0(PC_0));
									
	 IF2ID 		if2id	(	.clk(clk), 
									.reset(reset), 
									.stall(stall), 
									.Instr_0(Instr_0), 
									.PC_0(PC_0), 
									.Instr_01(Instr_01), 
									.PC_01(PC_01));
									
	 ID			id			(	.clk(clk), 
									.reset(reset), 
									.Instr_01(Instr_01), 
									.PC_01(PC_01), 
									.RegWrite_4(RegWrite_4), 
									.RegDst(RegDst), 
									.Instr_4prev(Instr_4), 
									.PC_4prev(PC_4), 
									.PC_now(PC_0), 
									.WD(GRF_WD), 
									.RD1(RD1_1), 
									.RD2(RD2_1), 
									.NPC_RD1(MD1_NPC),
									.NPC_RD2(MD2_NPC),
									.imm32(imm32_1), 
									.NPC(NPC), 
									.Instr_1(Instr_1), 
									.PC_1(PC_1), 
									.PC4_1(PC4_1),
									.RegWrite_1(RegWrite_1));
									
	 ID2EX		id2ex	(	.clk(clk), 
									.reset(reset||stall), 
									.Instr_1(Instr_1), 
									.PC_1(PC_1), 
									.PC4_1(PC4_1), 
									.RD1_1(RD1_1), 
									.RD2_1(RD2_1), 
									.RegWrite_1(RegWrite_1),
									.imm32_1(imm32_1), 
									.Instr_12(Instr_12), 
									.PC_12(PC_12), 
									.PC4_12(PC4_12), 
									.RD1_12(RD1_12), 
									.RD2_12(RD2_12), 
									.imm32_12(imm32_12),
									.RegWrite_12(RegWrite_12));
									
	 EX			ex			(	.Instr_12(Instr_12), 
									.PC_12(PC_12), 
									.PC4_12(PC4_12), 
									.RD1(ME1_ALU), 
									.RD2(ME2_ALU), 
									.RegWrite_12(RegWrite_12),
									.imm32(imm32_12), 
									.ALU_Out(ALU_Out_2), 
									.Instr_2(Instr_2), 
									.PC_2(PC_2), 
									.PC4_2(PC4_2), 
									.RD2_2(RD2_2),
									.RegWrite_2(RegWrite_2));
									
	 EX2MEM		ex2mem	(	.clk(clk), 
									.reset(reset), 
									.Instr_2(Instr_2), 
									.PC_2(PC_2), 
									.PC4_2(PC4_2), 
									.RD2_2(RD2_2), 
									.RegWrite_2(RegWrite_2),
									.ALU_Out_2(ALU_Out_2), 
									.Instr_23(Instr_23), 
									.PC_23(PC_23), 
									.PC4_23(PC4_23), 
									.RD2_23(RD2_23), 
									.ALU_Out_23(ALU_Out_23),
									.RegWrite_23(RegWrite_23));
									
	 MEM			mem		(	.clk(clk), 
									.reset(reset), 
									.Instr_23(Instr_23), 
									.PC_23(PC_23), 
									.PC4_23(PC4_23), 
									.RD2(WM_DM), 
									.RegWrite_23(RegWrite_23),
									.ALU_Out_23(ALU_Out_23), 
									.Instr_3(Instr_3), 
									.PC_3(PC_3), 
									.PC4_3(PC4_3), 
									.ALU_Out_3(ALU_Out_3), 
									.DM_RD(DM_RD_3),
									.RegWrite_3(RegWrite_3));
									
    MEM2WB		mem2wb	(	.clk(clk), 
									.reset(reset), 
									.Instr_3(Instr_3), 
									.PC_3(PC_3), 
									.PC4_3(PC4_3), 
									.RegWrite_3(RegWrite_3),
									.DM_RD_3(DM_RD_3), 
									.ALU_Out_3(ALU_Out_3), 
									.Instr_34(Instr_34), 
									.PC_34(PC_34), 
									.PC4_34(PC4_34), 
									.DM_RD_34(DM_RD_34), 
									.ALU_Out_34(ALU_Out_34),
									.RegWrite_34(RegWrite_34));
									
	 WB			wb			(	.DM_RD(DM_RD_34), 
									.ALU_Out(ALU_Out_34), 
									.Instr_34(Instr_34), 
									.PC_34(PC_34), 
									.PC4_34(PC4_34), 
									.GRF_WD(GRF_WD), 
									.RegWrite_34(RegWrite_34),
									.RegDst(RegDst), 
									.Instr_4(Instr_4), 
									.PC_4(PC_4),
									.RegWrite_4(RegWrite_4));
									
    assign Instr_FD = Instr_01;
	 assign Instr_DE = Instr_12;
	 assign Instr_EM = Instr_23;
	 assign Instr_MW = Instr_34;
	 assign RegWrite_DE = RegWrite_12;
	 assign RegWrite_EM = RegWrite_23;
	 assign RegWrite_MW = RegWrite_34;
		

endmodule
