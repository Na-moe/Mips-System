`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:44 11/24/2019 
// Design Name: 
// Module Name:    CTRL_MEM 
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
module CTRL_MEM(
    input [5:0] op,
    input [5:0] func,
    output reg MemWrite,
    output reg [2:0] MemOp
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
					MemWrite=0;
					MemOp=3'b000;
				end
				subu_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				add_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sub_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				and_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				or_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				xor_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				nor_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sll_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				srl_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sra_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sllv_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				srlv_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				srav_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				slt_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sltu_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				jr_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				jalr_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				movz_func:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				default:begin
					MemWrite=0;
					MemOp=3'b000;
				end
			endcase
		end
		else begin
			case(op)
				ori:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				addi:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				addiu:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				andi:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				xori:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				slti:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				sltiu:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				lw:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				lb:begin
					MemWrite=0;
					MemOp=3'b011;
				end
				lbu:begin
					MemWrite=0;
					MemOp=3'b100;
				end
				lh:begin
					MemWrite=0;
					MemOp=3'b001;
				end
				lhu:begin
					MemWrite=0;
					MemOp=3'b010;
				end
				sw:begin
					MemWrite=1;
					MemOp=3'b000;
				end
				sb:begin
					MemWrite=1;
					MemOp=3'b011;
				end
				sh:begin
					MemWrite=1;
					MemOp=3'b001;
				end
				beq:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				bne:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				bgtz:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				blez:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				lui:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				j:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				jal:begin
					MemWrite=0;
					MemOp=3'b000;
				end
				default:begin
					MemWrite=0;
					MemOp=3'b000;
				end
			endcase
		end
	 end



endmodule
