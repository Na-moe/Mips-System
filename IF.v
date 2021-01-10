`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:28 11/24/2019 
// Design Name: 
// Module Name:    IF 
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
module IF(
    input clk,
    input reset,
	 input stall,
    input [31:0] NPC,
    output [31:0] Instr_0,
	 output [31:0] PC_0
    );
	 
	 wire [31:0] PC_addr;
	 
	 PC pc(.clk(clk), .reset(reset), .stall(stall), .NPC(NPC), .PC(PC_addr));
	 IM im(.clk(clk), .reset(reset), .addr(PC_addr), .data(Instr_0));
	 assign PC_0 = PC_addr;


endmodule
