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
    // 基础组
    input [5:0] Op,Func, // 操作码和功能码
    output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg, // 控制信号输出
    output [1:0] Aluc, // ALU控制信号
    // Pcsrc
    output [1:0] Pcsrc, // PC源选择信号
    input [5:0] E_Op, // 执行阶段操作码
    input Z_, // 零标志
    // 内部前推
    output [1:0] FwdA,FwdB, // 前推信号
    input [4:0] Rs,Rt, // 源寄存器
    input [4:0] E_Rd,M_Rd, // 执行阶段和存储阶段目的寄存器
    input E_Wreg,M_Wreg, // 执行阶段和存储阶段写寄存器信号
    // lw冒险 
    input E_R2r, // 执行阶段寄存器到寄存器信号
    output  STALL, // 停顿信号
    // 控制冒险
    output Condep // 控制冒险信号
    );

    // R型指令判断
    wire R_type=(Op==6'b000000);
    wire I_add=R_type&&(Func==6'b100000);
    wire I_sub=R_type&&(Func==6'b100010);
    wire I_and=R_type&&(Func==6'b100100);
    wire I_or=R_type&&(Func==6'b100101);

    // I型指令判断
    wire I_addi=(Op==6'b001000);
    wire I_andi=(Op==6'b001100);
    wire I_ori=(Op==6'b001101);
    wire I_lw=(Op==6'b100011);
    wire I_sw=(Op==6'b101011);
    wire I_beq=(Op==6'b000100);
    wire I_bne=(Op==6'b000101);
    wire I_j=(Op==6'b000010);

    // 控制信号生成
    assign Regrt=I_addi|I_andi||I_ori||I_lw||I_sw||I_beq||I_bne||I_j;
    assign Se=I_addi||I_lw||I_sw||I_beq||I_bne;
    assign Wreg=I_add||I_sub||I_and||I_or||I_addi||I_andi||I_ori||I_lw;
    assign Aluqb=I_add||I_sub||I_and||I_or||I_beq||I_bne||I_j;
    assign Wmem=I_sw;
    assign Reg2reg=I_add||I_sub||I_and||I_or||I_addi||I_andi||I_ori||I_beq||I_bne||I_j;
    assign Aluc[1]=I_and||I_or||I_andi||I_ori;
    assign Aluc[0]=I_sub||I_or||I_ori||I_beq||I_bne;

    // 执行阶段指令判断
    wire E_beq=(E_Op==6'b000100);
    wire E_bne=(E_Op==6'b000101);
    wire E_j=(E_Op==6'b000010);

    // PC源选择信号生成
    assign Pcsrc=(E_beq&&Z_)||(E_bne&&!Z_)?2'b10:E_j?2'b11:2'b00;

    // 前推信号生成
    assign FwdA=((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1)) ? 2'b10 : 
                        ((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1)) ? 2'b01:2'b00;

    assign FwdB=(((Rt==E_Rd)&&((I_add)||(I_sub)||(I_and)||(I_or)||(I_sw)||(I_beq)||(I_bne))&&(E_Rd!=0)&&(E_Wreg==1)))?2'b10:(((Rt==M_Rd)&&((I_add)||(I_sub)||(I_and)||(I_or)||(I_sw)||(I_beq)||(I_bne))&&(M_Rd!=0)&&(M_Wreg==1)))?2'b01:2'b00;

    // 停顿信号生成
    assign STALL=((Rs==E_Rd)||(Rt==E_Rd))&&(E_R2r==0)&&(E_Rd!=0)&&(E_Wreg==1);
    // 控制冒险信号生成
    assign Condep=( E_beq & Z_) | ( E_bne & ~Z_) | E_j ;
 
endmodule