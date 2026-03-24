`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:20:41
// Design Name: 
// Module Name: ID_
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



module ID_(
    input Clk,Z_,E_R2r,E_Wreg,M_Wreg,W_Wreg,Clrn,
    input [31:0] Inst,IF_PC4,WB_D,
    input [4:0] M_Rd,E_Rd,W_Rd,
    input [5:0] E_Op,
    output Wreg,Reg2reg,Wmem,Aluqb,N_Stall,N_Condep,
    output [1:0] FwdA,FwdB,
    output [1:0] Aluc,Pcsrc,
    output [4:0] Wr,
    output [5:0] Op,
    output [31:0] Qa,Qb,bpc,imm32
);


    wire [5:0] op = Inst[31:26];
    wire [5:0] func = Inst[5:0];
    wire [4:0] rs = Inst[25:21];
    wire [4:0] rt = Inst[20:16];
    wire [4:0] rd = Inst[15:11];
    wire [15:0] immediate = Inst[15:0];
    wire [25:0] addr = Inst[25:0];

    wire Regrt,Se;

    wire Stall,Condep;
    assign N_Stall=~Stall;
    assign N_Condep=~Condep;

    assign  Op = op;

    CONUNIT uu1(.Op(op),.Func(func),.E_Op(E_Op),.Rs(rs),.Rt(rt),.E_Rd(E_Rd),.M_Rd(M_Rd),.Z_(Z_),.E_R2r(E_R2r),.E_Wreg(E_Wreg),.M_Wreg(M_Wreg),.Regrt(Regrt),.Se(Se),.Wreg(Wreg),.Reg2reg(Reg2reg),.Wmem(Wmem),.Aluqb(Aluqb),.Pcsrc(Pcsrc),.Aluc(Aluc),.FwdA(FwdA),.FwdB(FwdB),.STALL(Stall),.Condep(Condep));

    REGFILE uu2(.Ra(rs),.Rb(rt),.Wr(W_Rd),.D(WB_D),.We(W_Wreg),.Clk(Clk),.Clrn(Clrn),.Qa(Qa),.Qb(Qb));

    MUX_2X5 uu3(.Data0(rd),.Data1(rt),.Select(Regrt),.Y(Wr));


    EXT16T32 uu4(.X(immediate),.Se(Se),.Y(imm32));

    wire [31:0] immshifterv;
    SHIFTER_32Bit sf32(.X(imm32),.Sa(5'b10),.Arith(1'b0),.Right(1'b0),.Sh(immshifterv));

    assign bpc = IF_PC4 + immshifterv;

endmodule