`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:17 11/24/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	 input clk,
	 input reset,
	 input WE,
	 input [4:0] A1,
	 input [4:0] A2,
	 input [4:0] A3,
	 input [31:0] WD,
	 input [31:0] PC,
	 output [31:0] RD1,
	 output [31:0] RD2
    );
	 
	 reg [31:0] grf [31:0];
	 integer i;
	 always @(posedge clk) begin
		if(reset) begin
			for(i=0;i<32;i=i+1)
				grf[i]<=32'h0;
		end
		else if(WE==1&&A3!=5'b0) begin
			grf[A3]<=WD;
			$display("%d@%h: $%d <= %h", $time, PC, A3, WD);
		end
	 end
	 
	 assign RD1=(A1==A3 && A3 != 5'h0 && WE)?WD:grf[A1];
	 assign RD2=(A2==A3 && A3 != 5'h0 && WE)?WD:grf[A2];


endmodule
