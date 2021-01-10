`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:09 11/24/2019 
// Design Name: 
// Module Name:    MEM 
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
module MEM(
    input clk,
    input reset,
	 input [31:0] ALU_Out_23,
    input [31:0] PC_23,
    input [31:0] Instr_23,
    input [31:0] RD2,
	 input [31:0] PC4_23,
	 input RegWrite_23,
	 output [31:0] DM_RD,
	 output [31:0] ALU_Out_3,
	 output [31:0] Instr_3,
	 output [31:0] PC_3,
	 output [31:0] PC4_3,
	 output RegWrite_3
    );
	 
	 wire [2:0] MemOp;
	 wire MemWrite;
	 wire u;
	 
	 DM dm(.clk(clk), .reset(reset), .WE(MemWrite), .MemOp(MemOp), .Addr(ALU_Out_23), .PC(PC_23), .DM_WD(RD2), .DM_RD(DM_RD));
	 CTRL_MEM ctrl_mem(.op(Instr_23[31:26]), .func(Instr_23[5:0]), .MemWrite(MemWrite), .MemOp(MemOp));
	 assign ALU_Out_3=ALU_Out_23;
	 assign Instr_3=Instr_23;
	 assign PC_3=PC_23;
	 assign PC4_3=PC4_23;
	 assign RegWrite_3=RegWrite_23;


endmodule
