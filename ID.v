`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:11 11/24/2019 
// Design Name: 
// Module Name:    ID 
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
module ID(
    input clk,
    input reset,
	 input [31:0] PC_01,
	 input [31:0] Instr_01,
	 input [31:0] WD,
	 input RegWrite_4,
	 input [1:0] RegDst,
	 input [31:0] Instr_4prev,
	 input [31:0] PC_4prev,
	 input [31:0] PC_now,
	 input [31:0] NPC_RD1,
	 input [31:0] NPC_RD2,
	 output [31:0] RD1,
	 output [31:0] RD2,
	 output [31:0] imm32,
	 output [31:0] NPC,
	 output [31:0] PC4_1,
	 output [31:0] Instr_1,
	 output [31:0] PC_1,
	 output RegWrite_1
    );
	 
	 wire [5:0] op, func;
	 wire [4:0] rs, rt, rt_prev, rd, rd_prev, GRF_A3;
	 wire [1:0] EXTOp;
	 wire [3:0] NPCOp;
	 wire [31:0] rd1, rd2;
	 
	 assign op = Instr_01[31:26];
	 assign func = Instr_01[5:0];
	 assign rs = Instr_01[25:21];
	 assign rt = Instr_01[20:16];
	 assign rd = Instr_01[15:11];
	 assign rt_prev = Instr_4prev[20:16];
	 assign rd_prev = Instr_4prev[15:11];
	 
	 GRF grf(.clk(clk), .reset(reset), .WE(RegWrite_4), .A1(rs), .A2(rt), .A3(GRF_A3), .WD(WD), .PC(PC_4prev), .RD1(rd1), .RD2(rd2));
	 EXT ext(.imm16(Instr_01[15:0]), .EXTOp(EXTOp), .imm32(imm32));
	 CTRL_ID ctrl_id(.op(op), .func(func), .RD1(NPC_RD1), .RD2(NPC_RD2), .rt(rt), .EXTOp(EXTOp), .NPCOp(NPCOp), .RegWrite(RegWrite_1));
	 NPC npc(.PC(PC_now), .imm(Instr_01[25:0]), .NPCOp(NPCOp), .RD1(NPC_RD1), .RD2(NPC_RD2), .NPC(NPC), .PC4(PC4_1));
	 MUX_3_5 mux_3_5(.in1(rt_prev), .in2(rd_prev), .in3(5'h1f), .sel(RegDst), .out(GRF_A3));
	 assign RD1 = rd1;
	 assign RD2 = rd2;
	 assign PC_1 = PC_01;
	 assign Instr_1 = Instr_01;


endmodule
