`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:17:17
// Design Name: 
// Module Name: PiplineCPU
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


module PiplineCPU(
    input Clk,Clrn
);

// 线网声明
// 线网命名规则：Cb_发送模块_接收模块_信号??
// 连接IF模块与流水线寄存器
wire [31:0] Cb_IF_REG_PC4,Cb_IF_REG_Inst,Cb_IF_REG_jpc;

// 连接流水线寄存器与ID模块
wire [31:0] Cb_REG_ID_PC4,Cb_REG_ID_Inst,Cb_REG_ID_jpc;

// 连接ID模块与流水线寄存器
wire Cb_ID_REG_Wreg,Cb_ID_REG_Reg2reg,Cb_ID_REG_Wmem,Cb_ID_REG_Aluqb;
wire [5:0] Cb_ID_REG_op;
wire [1:0] Cb_ID_REG_Aluc,Cb_ID_REG_FwdA,Cb_ID_REG_FwdB;
wire [31:0] Cb_ID_REG_bpc,Cb_ID_REG_imm32,Cb_ID_REG_Qa,Cb_ID_REG_Qb;
wire [4:0] Cb_ID_REG_Wr;

// 连接流水线寄存器与EX模块
wire  Cb_REG_EX_Wreg,Cb_REG_EX_Reg2reg,Cb_REG_EX_Wmem,Cb_REG_EX_Aluqb;
wire [5:0] Cb_REG_EX_op;
wire [1:0] Cb_REG_EX_Aluc,Cb_REG_EX_FwdA,Cb_REG_EX_FwdB;
wire [31:0] Cb_REG_EX_bpc,Cb_REG_EX_imm32,Cb_REG_EX_Qa,Cb_REG_EX_Qb;
wire [4:0] Cb_REG_EX_Wr;

// 连接EX模块与流水线寄存器
wire Cb_EX_REG_Wreg,Cb_EX_REG_Reg2reg,Cb_EX_REG_Wmem;
wire [4:0] Cb_EX_REG_Wr;
wire Cb_EX_REG_Z;
wire [31:0] Cb_EX_REG_R,Cb_EX_REG_S;

// 连接流水线寄存器与MEM模块
wire Cb_REG_MEM_Wreg,Cb_REG_MEM_Reg2reg,Cb_REG_MEM_Wmem;
wire [4:0] Cb_REG_MEM_Wr;
wire Cb_REG_MEM_Z;
wire [31:0] Cb_REG_MEM_R,Cb_REG_MEM_S;

// 连接MEM模块与流水线寄存器
wire Cb_MEM_REG_Wreg,Cb_MEM_REG_Reg2reg;
wire [31:0] Cb_MEM_REG_D,Cb_MEM_REG_C;
wire [4:0] Cb_MEM_REG_Wr;

// 连接流水线寄存器与WB模块
wire Cb_REG_WB_Wreg,Cb_REG_WB_Reg2reg;
wire [31:0] Cb_REG_WB_D,Cb_REG_WB_C;
wire [4:0] Cb_REG_WB_Wr;

// 特殊信号
wire N_Stall,DB_N_Condep,N_Condep;
wire Cb_EX_CONUNIT_Wreg,Cb_EX_CONUNIT_Reg2reg;
wire [5:0] Cb_EX_CONUNIT_Op;
wire [4:0] Cb_EX_CONUNIT_Wr;
wire Cb_EX_CONUNIT_Z;
wire Cb_MEM_CONUNIT_Wreg;
wire [1:0] Pcsrc;
wire Cb_WB_ID_W_Wreg;
wire [31:0] Cb_WB_ID_D;
wire [4:0] Cb_MEM_ID_M_Rd,Cb_EX_ID_E_Rd;
wire [4:0] Cb_WB_ID_Rd;
wire [31:0]  Cb_EX_IF_bpc;

assign DB_N_Condep = (N_Condep & Clrn); // 当N_Condep和Clrn中有一个为低电平时，DB_N_Condep为低电平


// 模块实例化
// 实例化IF模块
IF_ ifmodule(
    .bpc(Cb_EX_IF_bpc),.ID_jpc(Cb_REG_ID_jpc),
    .Pcsrc(Pcsrc),
.Clk(Clk),.Reset(~Clrn),.PCWe(N_Stall),
    .ID_PC4(Cb_IF_REG_PC4),.ID_Inst(Cb_IF_REG_Inst),.IF_jpc(Cb_IF_REG_jpc)
);

// 实例化流水线寄存器IF_ID
IF_ID if_id(
    .We(N_Stall),.Clrn(DB_N_Condep),.Clk(Clk),
    .IF_PC4(Cb_IF_REG_PC4),.IF_IR(Cb_IF_REG_Inst),.IF_jpc(Cb_IF_REG_jpc),
    .ID_PC4(Cb_REG_ID_PC4),.ID_IR(Cb_REG_ID_Inst),.ID_jpc(Cb_REG_ID_jpc)
);

// 实例化ID模块
ID_ idmodule(
    .Clk(Clk),.Clrn(Clrn),
    .Z_(Cb_EX_CONUNIT_Z),.E_R2r(Cb_EX_CONUNIT_Reg2reg),.E_Wreg(Cb_EX_CONUNIT_Wreg),.M_Wreg(Cb_MEM_CONUNIT_Wreg),.W_Wreg(Cb_WB_ID_W_Wreg),
    .Inst(Cb_REG_ID_Inst),.IF_PC4(Cb_REG_ID_PC4),.WB_D(Cb_WB_ID_D),
    .M_Rd(Cb_MEM_ID_M_Rd),.E_Rd(Cb_EX_ID_E_Rd),.W_Rd(Cb_WB_ID_Rd),
    .E_Op(Cb_EX_CONUNIT_Op),
    .Wreg(Cb_ID_REG_Wreg),.Reg2reg(Cb_ID_REG_Reg2reg),.Wmem(Cb_ID_REG_Wmem),.Aluqb(Cb_ID_REG_Aluqb),.N_Stall(N_Stall),.N_Condep(N_Condep),.FwdA(Cb_ID_REG_FwdA),.FwdB(Cb_ID_REG_FwdB),
    .Aluc(Cb_ID_REG_Aluc),.Pcsrc(Pcsrc),
    .Wr(Cb_ID_REG_Wr),
    .Op(Cb_ID_REG_op),
    .Qa(Cb_ID_REG_Qa),.Qb(Cb_ID_REG_Qb),.bpc(Cb_ID_REG_bpc),.imm32(Cb_ID_REG_imm32)
);

// 实例化流水线寄存器ID_EX
wire ID_EX_Clrn;
assign ID_EX_Clrn = (DB_N_Condep & N_Stall); // 当DB_N_Condep或N_Stall中有1个为低电平时，ID_EX_Clrn为低电平

ID_EX id_ex(
    .Clrn(ID_EX_Clrn),.Clk(Clk),
    .ID_Wreg(Cb_ID_REG_Wreg),.ID_Reg2reg(Cb_ID_REG_Reg2reg),.ID_Wmem(Cb_ID_REG_Wmem),.ID_Aluqb(Cb_ID_REG_Aluqb),.ID_FwdA(Cb_ID_REG_FwdA),.ID_FwdB(Cb_ID_REG_FwdB),
    .ID_op(Cb_ID_REG_op),.ID_Aluc(Cb_ID_REG_Aluc),.ID_bpc(Cb_ID_REG_bpc),.ID_imm32(Cb_ID_REG_imm32),.ID_Qa(Cb_ID_REG_Qa),.ID_Qb(Cb_ID_REG_Qb),.ID_Wr(Cb_ID_REG_Wr),
    .EX_Wreg(Cb_REG_EX_Wreg),.EX_Reg2reg(Cb_REG_EX_Reg2reg),.EX_Wmem(Cb_REG_EX_Wmem),.EX_Aluqb(Cb_REG_EX_Aluqb),.EX_FwdA(Cb_REG_EX_FwdA),.EX_FwdB(Cb_REG_EX_FwdB),
    .EX_op(Cb_REG_EX_op),.EX_Aluc(Cb_REG_EX_Aluc),.EX_bpc(Cb_REG_EX_bpc),.EX_imm32(Cb_REG_EX_imm32),.EX_Qa(Cb_REG_EX_Qa),.EX_Qb(Cb_REG_EX_Qb),.EX_Wr(Cb_REG_EX_Wr)
);

// 实例化EX模块
EX_ exmodule(
    .ID_Wreg(Cb_REG_EX_Wreg),.ID_Reg2reg(Cb_REG_EX_Reg2reg),
    .ID_Wmem(Cb_REG_EX_Wmem),
    .ID_op(Cb_REG_EX_op),
    .ID_Aluqb(Cb_REG_EX_Aluqb),.ID_FwdA(Cb_REG_EX_FwdA),.ID_FwdB(Cb_REG_EX_FwdB),
    .ID_Aluc(Cb_REG_EX_Aluc),.ID_bpc(Cb_REG_EX_bpc),
    .IF_bpc(Cb_EX_IF_bpc),
    .ID_Wr(Cb_REG_EX_Wr),
    .MEM_Wreg(Cb_EX_REG_Wreg),.MEM_Reg2reg(Cb_EX_REG_Reg2reg),.CONUNIT_Wreg(Cb_EX_CONUNIT_Wreg),.CONUNIT_Reg2reg(Cb_EX_CONUNIT_Reg2reg),
    .MEM_Wmem(Cb_EX_REG_Wmem),
    .CONUNIT_Op(Cb_EX_CONUNIT_Op),
    .MEM_Wr(Cb_EX_REG_Wr),.CONUNIT_Wr(Cb_EX_CONUNIT_Wr),
    .CONUNIT_Z(Cb_EX_CONUNIT_Z),.MEM_Z(Cb_EX_REG_Z),
    .MEM_R(Cb_EX_REG_R),
    .ID_Qa(Cb_REG_EX_Qa),.ID_Qb(Cb_REG_EX_Qb),.MEM_R_Fwd(Cb_MEM_REG_D),.WB_R_Fwd(Cb_WB_ID_D),
    .ID_imm32(Cb_REG_EX_imm32),
    .MEM_S(Cb_EX_REG_S),
    .E_Rd(Cb_EX_ID_E_Rd)
);

// 实例化流水线寄存器EX_MEM
EX_MEM ex_mem(
    .Clk(Clk),
    .EX_Wreg(Cb_EX_REG_Wreg),.EX_Reg2reg(Cb_EX_REG_Reg2reg),
    .EX_Wmem(Cb_EX_REG_Wmem),
    .EX_Wr(Cb_EX_REG_Wr),
    .EX_Z(Cb_EX_REG_Z),
    .EX_R(Cb_EX_REG_R),.EX_S(Cb_EX_REG_S),
    .MEM_Wreg(Cb_REG_MEM_Wreg),.MEM_Reg2reg(Cb_REG_MEM_Reg2reg),
    .MEM_Wmem(Cb_REG_MEM_Wmem),
    .MEM_Wr(Cb_REG_MEM_Wr),
    .MEM_Z(Cb_REG_MEM_Z),
    .MEM_R(Cb_REG_MEM_R),.MEM_S(Cb_REG_MEM_S)
);

// 实例化MEM模块
MEM_ memmodule(
    .Clk(Clk),
    .EX_Wreg(Cb_REG_MEM_Wreg),.EX_Reg2reg(Cb_REG_MEM_Reg2reg),
    .EX_Wmem(Cb_REG_MEM_Wmem),
    .EX_R(Cb_REG_MEM_R),.EX_S(Cb_REG_MEM_S),
    .EX_Wr(Cb_REG_MEM_Wr),
    .WB_Wreg(Cb_MEM_REG_Wreg),.WB_Reg2reg(Cb_MEM_REG_Reg2reg),.CONUNIT_Wreg(Cb_MEM_CONUNIT_Wreg),
    .WB_D(Cb_MEM_REG_D),
    .WB_Wr(Cb_MEM_REG_Wr),
    .WB_C(Cb_MEM_REG_C),
    .M_Rd(Cb_MEM_ID_M_Rd)
);

// 实例化流水线寄存器MEM_WB
MEM_WB mem_wb(
    .Clk(Clk),
    .MEM_Wreg(Cb_MEM_REG_Wreg),.MEM_Reg2reg(Cb_MEM_REG_Reg2reg),
    .MEM_D(Cb_MEM_REG_D),.MEM_C(Cb_MEM_REG_C),
    .MEM_Wr(Cb_MEM_REG_Wr),
    .WB_Wreg(Cb_REG_WB_Wreg),.WB_Reg2reg(Cb_REG_WB_Reg2reg),
    .WB_D(Cb_REG_WB_D),.WB_C(Cb_REG_WB_C),
    .WB_Wr(Cb_REG_WB_Wr)
);

// 实例化WB模块
WB_  wbmodule(
    .MEM_Wreg(Cb_REG_WB_Wreg),.MEM_Reg2reg(Cb_REG_WB_Reg2reg),
    .MEM_D(Cb_REG_WB_D),.MEM_C(Cb_REG_WB_C),
    .MEM_Wr(Cb_REG_WB_Wr),
    .REGFILE_Wreg(Cb_WB_ID_W_Wreg),
    .REGFILE_D(Cb_WB_ID_D),
    .REGFILE_Wr(Cb_WB_ID_Rd)
);
endmodule