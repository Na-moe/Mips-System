`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:01 11/24/2019 
// Design Name: 
// Module Name:    CTRL_ID 
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
module CTRL_ID(
    input [5:0] op,
    input [5:0] func,
	 input [4:0] rt,
	 input [31:0] RD1,
	 input [31:0] RD2,
	 output reg [1:0] EXTOp,
	 output reg [3:0] NPCOp,
	 output reg RegWrite
    );
	 
	 parameter addu_func = 6'b100001,
				  subu_func = 6'b100011,
				  jr_func = 6'b001000,
				  jalr_func = 6'b001001,
				  movz_func = 6'b001010,
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
				  sh = 6'b101001,
				  bgez_rt = 5'b00001,
				  bltz_rt = 5'b00000;
				  
	 always @(*) begin
		if(op==6'b000000) begin
			case(func)
				addu_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				add_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				subu_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sub_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				and_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				or_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				xor_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				nor_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sll_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				srl_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sra_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sllv_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				srlv_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				srav_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				slt_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sltu_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				jr_func:begin
					EXTOp=2'b00;
					NPCOp=4'h3;
					RegWrite=1'b0;
				end
				jalr_func:begin
					EXTOp=2'b00;
					NPCOp=4'h4;
					RegWrite=1'b1;
				end
				movz_func:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=(RD2==32'h0)?1'b1:1'b0;
				end
				default:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b0;
				end
			endcase
		end
		else begin
			case(op)
				ori:begin
					EXTOp=2'b01;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				addi:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				addiu:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				andi:begin
					EXTOp=2'b01;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				xori:begin
					EXTOp=2'b01;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				slti:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sltiu:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				lw:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				lb:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				lbu:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				lh:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				lhu:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				sw:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b0;
				end
				sb:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b0;
				end
				sh:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b0;
				end
				beq:begin
					EXTOp=2'b00;
					NPCOp=4'h1;
					RegWrite=1'b0;
				end
				bne:begin
					EXTOp=2'b00;
					NPCOp=4'h5;
					RegWrite=1'b0;
				end
				bgtz:begin
					EXTOp=2'b00;
					NPCOp=4'h6;
					RegWrite=1'b0;
				end
				blez:begin
					EXTOp=2'b00;
					NPCOp=4'h7;
					RegWrite=1'b0;
				end
				lui:begin
					EXTOp=2'b10;
					NPCOp=4'h0;
					RegWrite=1'b1;
				end
				j:begin
					EXTOp=2'b00;
					NPCOp=4'h2;
					RegWrite=1'b0;
				end
				jal:begin
					EXTOp=2'b00;
					NPCOp=4'h2;
					RegWrite=1'b1;
				end
				6'b000001:begin
					case(rt)
						bgez_rt:begin
							EXTOp=2'b00;
							NPCOp=4'h8;
							RegWrite=1'b0;
						end
						bltz_rt:begin
							EXTOp=2'b00;
							NPCOp=4'h9;
							RegWrite=1'b0;
						end
					endcase
				end
				default:begin
					EXTOp=2'b00;
					NPCOp=4'h0;
					RegWrite=1'b0;
				end
			endcase
		end
	 end
	 


endmodule
