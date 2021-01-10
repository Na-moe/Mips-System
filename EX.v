`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:54 11/24/2019 
// Design Name: 
// Module Name:    EX 
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
module EX(
	 input [31:0] PC_12,
	 input [31:0] Instr_12,
	 input [31:0] PC4_12,
	 input [31:0] RD1,
	 input [31:0] RD2,
	 input [31:0] imm32,
	 input RegWrite_12,
	 output [31:0] ALU_Out,
	 output [31:0] Instr_2,
	 output [31:0] PC_2,
	 output [31:0] PC4_2,
	 output [31:0] RD2_2,
	 output RegWrite_2
    );
	 
	 wire [31:0] B;
	 wire [3:0] ALUOp;
	 wire ALUSrc;
	 wire [4:0] s;
	 wire shifts;
	 
	 ALU alu(.A(RD1), .B(B), .s(s), .ALUOp(ALUOp), .Out(ALU_Out));
	 MUX_2_32 mux_2_32(.in1(RD2), .in2(imm32), .sel(ALUSrc), .out(B));
	 MUX_2_5 mux_2_5(.in1(RD1[4:0]), .in2(imm32[10:6]), .sel(shifts), .out(s));
	 CTRL_EX ctrl_ex(.op(Instr_12[31:26]), .func(Instr_12[5:0]), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .shifts(shifts));
	 assign PC_2=PC_12;
	 assign Instr_2=Instr_12;
	 assign PC4_2=PC4_12;
	 assign RD2_2=RD2;
	 assign RegWrite_2=RegWrite_12;


endmodule
