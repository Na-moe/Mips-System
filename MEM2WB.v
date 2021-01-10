`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:27 11/24/2019 
// Design Name: 
// Module Name:    MEM2WB 
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
module MEM2WB(
    input clk,
    input reset,
    input [31:0] Instr_3,
    input [31:0] PC_3,
	 input [31:0] DM_RD_3,
	 input [31:0] ALU_Out_3,
	 input [31:0] PC4_3,
	 input RegWrite_3,
	 output reg [31:0] Instr_34,
	 output reg [31:0] PC_34,
	 output reg [31:0] DM_RD_34,
	 output reg [31:0] ALU_Out_34,
	 output reg [31:0] PC4_34,
	 output reg RegWrite_34
    );
	 
	 always @(posedge clk) begin
		if(reset) begin
			Instr_34<=32'h0;
			PC_34<=32'h00003000;
			DM_RD_34<=32'h0;
			ALU_Out_34<=32'h0;
			PC4_34<=32'h0;
			RegWrite_34<=1'b0;
		end
		else begin
			Instr_34<=Instr_3;
			PC_34<=PC_3;
			DM_RD_34<=DM_RD_3;
			ALU_Out_34<=ALU_Out_3;
			PC4_34<=PC4_3;
			RegWrite_34<=RegWrite_3;
		end
	 end


endmodule
