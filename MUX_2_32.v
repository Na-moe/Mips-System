`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:19 11/24/2019 
// Design Name: 
// Module Name:    MUX_2_32 
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
module MUX_2_32(
    input [31:0] in1,
    input [31:0] in2,
    input sel,
    output [31:0] out
    );
	 
	 assign out = (sel==0)?in1:in2;


endmodule
