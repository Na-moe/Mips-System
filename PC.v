`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:32 11/24/2019 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input clk,
    input reset,
	 input stall,
    input [31:0] NPC,
    output reg [31:0] PC
    );
	 
	 always @(posedge clk) begin
		if(reset)
			PC<=32'h00003000;
		else if(!stall)
			PC<=NPC;
	 end
	 
	 
endmodule
