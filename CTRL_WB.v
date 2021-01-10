`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:30 11/24/2019 
// Design Name: 
// Module Name:    CTRL_WB 
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
module CTRL_WB(
    input [5:0] op,
    input [5:0] func,
    output reg [1:0] Mem2Reg,
	 output reg [1:0] RegDst
    );
	 
	 parameter addu_func = 6'b100001,
				  subu_func = 6'b100011,
				  jr_func = 6'b001000,
				  jalr_func = 6'b001001,
				  movz_func =6'b001010,
				  add_func = 6'b100000,
				  sub_func = 6'b100010,
				  and_func = 6'b100100,
				  or_func = 6'b100101,
				  xor_func = 6'b100110,
				  nor_func = 6'b100111,
				  sll_func = 6'b000000,
				  srl_func = 6'b000010,
				  sra_func = 6'b000011,
				  sllv_func = 6'b000100,
				  srlv_func = 6'b000110,
				  srav_func = 6'b000111,
				  slt_func = 6'b101010,
				  sltu_func = 6'b101011,
				  ori = 6'b001101,
				  lw  = 6'b100011,
				  sw = 6'b101011,
				  beq = 6'b000100,
				  bne = 6'b000101,
				  bgtz = 6'b000111,
				  blez = 6'b000110,
				  lui = 6'b001111,
				  slti = 6'b001010,
				  sltiu = 6'b001011,
				  addi = 6'b001000,
				  addiu = 6'b001001,
				  andi = 6'b001100,
				  xori = 6'b001110,
				  j = 6'b000010,
				  jal = 6'b000011,
				  lb = 6'b100000,
				  lbu = 6'b100100,
				  lh = 6'b100001,
				  lhu = 6'b100101,
				  sb = 6'b101000,
				  sh = 6'b101001;
				  
	 always @(op or func) begin
		if(op==6'b000000) begin
			case(func)
				addu_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				subu_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				add_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				sub_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				and_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				or_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				xor_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				nor_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				sll_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				srl_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				sra_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				sllv_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				srlv_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				srav_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				slt_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				sltu_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				jr_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				jalr_func:begin
					Mem2Reg=2'b10;
					RegDst=2'b01;
				end
				movz_func:begin
					Mem2Reg=2'b00;
					RegDst=2'b01;
				end
				default:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
			endcase
		end
		else begin
			case(op)
				ori:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				addi:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				addiu:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				andi:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				xori:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				slti:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				sltiu:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				lw:begin
					Mem2Reg=2'b01;
					RegDst=2'b00;
				end
				lb:begin
					Mem2Reg=2'b01;
					RegDst=2'b00;
				end
				lbu:begin
					Mem2Reg=2'b01;
					RegDst=2'b00;
				end
				lh:begin
					Mem2Reg=2'b01;
					RegDst=2'b00;
				end
				lhu:begin
					Mem2Reg=2'b01;
					RegDst=2'b00;
				end
				sw:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				sb:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				sh:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				beq:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				bne:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				bgtz:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				blez:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				lui:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				j:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
				jal:begin
					Mem2Reg=2'b10;
					RegDst=2'b10;
				end
				default:begin
					Mem2Reg=2'b00;
					RegDst=2'b00;
				end
			endcase
		end
	 end



endmodule
