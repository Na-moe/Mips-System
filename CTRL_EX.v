`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:43 11/24/2019 
// Design Name: 
// Module Name:    CTRL_EX 
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
module CTRL_EX(
    input [5:0] op,
	 input [5:0] func,
    output reg [3:0] ALUOp,
    output reg ALUSrc,
	 output reg shifts
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
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				subu_func:begin
					ALUOp=4'h1;
					ALUSrc=0;
					shifts=0;
				end
				add_func:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				sub_func:begin
					ALUOp=4'h1;
					ALUSrc=0;
					shifts=0;
				end
				and_func:begin
					ALUOp=4'h3;
					ALUSrc=0;
					shifts=0;
				end
				or_func:begin
					ALUOp=4'h2;
					ALUSrc=0;
					shifts=0;
				end
				xor_func:begin
					ALUOp=4'h4;
					ALUSrc=0;
					shifts=0;
				end
				nor_func:begin
					ALUOp=4'h5;
					ALUSrc=0;
					shifts=0;
				end
				sll_func:begin
					ALUOp=4'h6;
					ALUSrc=0;
					shifts=1;
				end
				srl_func:begin
					ALUOp=4'h7;
					ALUSrc=0;
					shifts=1;
				end
				sra_func:begin
					ALUOp=4'h8;
					ALUSrc=0;
					shifts=1;
				end
				sllv_func:begin
					ALUOp=4'h6;
					ALUSrc=0;
					shifts=0;
				end
				srlv_func:begin
					ALUOp=4'h7;
					ALUSrc=0;
					shifts=0;
				end
				srav_func:begin
					ALUOp=4'h8;
					ALUSrc=0;
					shifts=0;
				end
				slt_func:begin
					ALUOp=4'h9;
					ALUSrc=0;
					shifts=0;
				end
				sltu_func:begin
					ALUOp=4'ha;
					ALUSrc=0;
					shifts=0;
				end
				jr_func:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				jalr_func:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				movz_func:begin
					ALUOp=4'h3;
					ALUSrc=0;
					shifts=0;
				end
				default:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
			endcase
		end
		else begin
			case(op)
				ori:begin
					ALUOp=4'h2;
					ALUSrc=1;
					shifts=0;
				end
				addi:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				addiu:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				andi:begin
					ALUOp=4'h3;
					ALUSrc=1;
					shifts=0;
				end
				xori:begin
					ALUOp=4'h4;
					ALUSrc=1;
					shifts=0;
				end
				slti:begin
					ALUOp=4'h9;
					ALUSrc=1;
					shifts=0;
				end
				sltiu:begin
					ALUOp=4'ha;
					ALUSrc=1;
					shifts=0;
				end
				lw:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				lb:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				lbu:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				lh:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				lhu:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				sw:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				sb:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				sh:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				beq:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				bne:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				bgtz:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				blez:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				lui:begin
					ALUOp=4'h0;
					ALUSrc=1;
					shifts=0;
				end
				j:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				jal:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
				default:begin
					ALUOp=4'h0;
					ALUSrc=0;
					shifts=0;
				end
			endcase
		end
	 end



endmodule
