`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:17 12/02/2019 
// Design Name: 
// Module Name:    MUX_2_5 
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
module MUX_2_5(
    input [4:0] in1,
    input [4:0] in2,
    input sel,
    output [4:0] out
    );
	 
	 assign out=(sel==1'b0)?in1:in2;


endmodule
