`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:14 11/24/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
    input reset,
    input WE,
    input [2:0] MemOp,
    input [31:0] Addr,
    input [31:0] PC,
    input [31:0] DM_WD,
    output [31:0] DM_RD
    );
	 
	 reg [7:0] dmem [16383:0];
	 integer i;
	 
	 parameter w=3'b000, h=3'b001, hu=3'b010, b=3'b011, bu=3'b100;
	 
	 wire [31:0] Addr_word = {Addr[31:2], 2'b00};
	 wire [31:0] Addr_hword = {Addr[31:1], 1'b0};
	 
	 always @(posedge clk) begin
		if(reset)
			for(i=0;i<16384;i=i+1)
				dmem[i]=8'h0;
		else if(WE) begin
			case(MemOp)
				w:begin
					{dmem[Addr_word+3], dmem[Addr_word+2], dmem[Addr_word+1], dmem[Addr_word]} = DM_WD;
					$display("%d@%h: *%h <= %h", $time, PC, Addr_word, DM_WD);
				end
				h:begin
					{dmem[Addr_hword+1], dmem[Addr_hword]} = DM_WD[15:0];
					$display("%d@%h: *%h <= %h", $time, PC, Addr_word, (Addr[1]==1'b0)?	{dmem[Addr_word+3], dmem[Addr_word+2], DM_WD[15:0]}:
																																	{DM_WD[15:0], dmem[Addr_word+1], dmem[Addr_word]});
				end
				b:begin
					dmem[Addr] = DM_WD[7:0];
					$display("%d@%d: *%h <= %h", $time, PC, Addr_word, 	(Addr[1:0]==2'b00)?	{dmem[Addr_word+3], dmem[Addr_word+2], dmem[Addr_word+1], DM_WD[7:0]}:
																										(Addr[1:0]==2'b01)?	{dmem[Addr_word+3], dmem[Addr_word+2], DM_RD[7:0], dmem[Addr_word]}:
																										(Addr[1:0]==2'b10)?	{dmem[Addr_word+3], DM_RD[7:0], dmem[Addr_word+1], dmem[Addr_word]}:
																										(Addr[1:0]==2'b11)?	{DM_RD[7:0], dmem[Addr_word+2], dmem[Addr_word+1], dmem[Addr_word]}:32'h0);
				end
			endcase
		end
	 end
	 
	 assign DM_RD = 	(MemOp == w)? 	{dmem[Addr_word+3], dmem[Addr_word+2], dmem[Addr_word+1], dmem[Addr_word]}:
								(MemOp == h)?	{{16{dmem[Addr_hword+1][7]}}, dmem[Addr_hword+1], dmem[Addr_hword]}:
								(MemOp == hu)? {16'h0, dmem[Addr_hword+1], dmem[Addr_hword]}:
								(MemOp == b)?	{{24{dmem[Addr][7]}}, dmem[Addr]}:
								(MemOp == bu)?	{24'h0, dmem[Addr]}:32'h0;


endmodule
