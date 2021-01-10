`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:44 11/24/2019 
// Design Name: 
// Module Name:    MUX_3_32 
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
module MUX_3_32(
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [1:0] sel,
    output [31:0] out
    );
	 
	 assign out = (sel==2'b00)?in1:
						 (sel==2'b01)?in2:
						 (sel==2'b10)?in3:32'h0;


endmodule
