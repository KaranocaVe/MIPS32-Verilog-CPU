`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:20:41
// Design Name: 
// Module Name: EX_
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


module EX_(
    //WB
    input ID_Wreg,ID_Reg2reg,
    output MEM_Wreg,MEM_Reg2reg,CONUNIT_Wreg,CONUNIT_Reg2reg,
    //M
    input ID_Wmem,
    output MEM_Wmem,
    input [5:0] ID_op,
    output [5:0] CONUNIT_Op,
    //EX
    input ID_Aluqb,
    input [1:0] ID_FwdA,ID_FwdB,
    input [1:0] ID_Aluc,
    input [31:0] ID_bpc,
    output [31:0] IF_bpc,
    input [4:0] ID_Wr,
    output [4:0] MEM_Wr,CONUNIT_Wr,
    output CONUNIT_Z,MEM_Z,
    output [31:0] MEM_R,
    input [31:0] ID_Qa,ID_Qb,MEM_R_Fwd,WB_R_Fwd,
    input [31:0] ID_imm32,
    output [31:0] MEM_S,
    output [4:0] E_Rd
);

assign MEM_Wreg=ID_Wreg;
assign MEM_Reg2reg=ID_Reg2reg;
assign CONUNIT_Wreg=ID_Wreg;
assign CONUNIT_Reg2reg=ID_Reg2reg;
assign MEM_Wmem=ID_Wmem;
assign CONUNIT_Op=ID_op;
assign IF_bpc=ID_bpc;
assign CONUNIT_Wr=ID_Wr;
assign MEM_Wr=ID_Wr;

assign E_Rd=ID_Wr;

wire [31:0] alu_x,alu_y,aluqb1;

MUX_4X32 fwdamux(.Data0(ID_Qa),.Data1(WB_R_Fwd),.Data2(MEM_R_Fwd),.Data3(32'b0),.Select(ID_FwdA),.Y(alu_x));

MUX_4X32 fwdbmux(.Data0(ID_Qb),.Data1(WB_R_Fwd),.Data2(MEM_R_Fwd),.Data3(32'b0),.Select(ID_FwdB),.Y(aluqb1));

MUX_2X32 aluqbmux(.Data0(ID_imm32),.Data1(aluqb1),.Select(ID_Aluqb),.Y(alu_y));

wire Z_;

ALU uu1(.X(alu_x),.Y(alu_y),.Aluc(ID_Aluc),.R(MEM_R),.Z_(Z_));

assign MEM_Z=Z_;
assign CONUNIT_Z=Z_;

assign MEM_S=aluqb1;


endmodule
