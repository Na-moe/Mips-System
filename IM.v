`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:44 11/24/2019 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input clk,
    input reset,
    input [31:0] addr,
    output [31:0] data
    );
	 
	 reg [31:0] imem [4095:0];
	 integer i;
	 
	 always @(posedge clk) begin
		if(reset) begin
			for(i=0;i<4096;i=i+1)
				imem[i]=32'h0;
			$readmemh("code.txt",imem);
		end
	 end
	 
	 assign data = imem[(addr-32'h3000)>>2];


endmodule
