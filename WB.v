`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:08 11/24/2019 
// Design Name: 
// Module Name:    WB 
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
module WB(
    input [31:0] DM_RD,
    input [31:0] ALU_Out,
	 input [31:0] PC4_34,
	 input [31:0] PC_34,
	 input [31:0] Instr_34,
	 input RegWrite_34,
    output [31:0] GRF_WD,
	 output RegWrite_4,
	 output [1:0] RegDst,
	 output [31:0] PC_4,
	 output [31:0] Instr_4
    );
	 
	 wire [1:0] Mem2Reg;
	 
	 MUX_3_32 mux_3_32(.in1(ALU_Out), .in2(DM_RD), .in3(PC4_34), .sel(Mem2Reg), .out(GRF_WD));
	 CTRL_WB ctrl_wb(.op(Instr_34[31:26]), .func(Instr_34[5:0]), .Mem2Reg(Mem2Reg), .RegDst(RegDst));
	 assign PC_4=PC_34;
	 assign Instr_4=Instr_34;
	 assign RegWrite_4=RegWrite_34;

endmodule
