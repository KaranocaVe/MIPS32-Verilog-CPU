`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 12:06:01
// Design Name: 
// Module Name: CONUNIT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CONUNIT(
    input [5:0] Op,Func,
    input Z_,
    output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,
    output [1:0] Pcsrc,Aluc
    );



    wire R_type=(Op==6'b000000);
    wire I_add=R_type&&(Func==6'b100000);
    wire I_sub=R_type&&(Func==6'b100010);
    wire I_and=R_type&&(Func==6'b100100);
    wire I_or=R_type&&(Func==6'b100101);

    wire I_addi=(Op==6'b001000);
    wire I_andi=(Op==6'b001100);
    wire I_ori=(Op==6'b001101);
    wire I_lw=(Op==6'b100011);
    wire I_sw=(Op==6'b101011);
    wire I_beq=(Op==6'b000100);
    wire I_bne=(Op==6'b000101);
    wire I_j=(Op==6'b000010);

    assign Regrt    = I_addi  | I_andi   | I_ori  | I_lw  | I_sw   | I_beq  | I_bne | I_j  ;
    assign Se       = I_addi  | I_sw     | I_lw   | I_beq | I_bne  ;
    assign Wreg     = I_add   | I_sub    | I_and  | I_or  | I_addi | I_andi | I_ori | I_lw ;
    assign Aluqb    = I_add   | I_sub    | I_and  | I_or  | I_beq  | I_bne  | I_j   ;
    assign Aluc[1]  = I_and   | I_or     | I_andi | I_ori;
    assign Aluc[0]  = I_sub   | I_or     | I_ori  | I_beq | I_bne  ;
    assign Wmem     = I_sw;
    assign Pcsrc[1] = I_beq&Z_ | I_bne&~Z_ | I_j    ;
    assign Pcsrc[0] = I_j;
    assign Reg2reg  = I_add   | I_sub    | I_and  | I_or  | I_addi | I_andi | I_ori | I_sw | I_beq | I_bne | I_j;

endmodule