`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28
// Design Name: MIPS32 Single-Cycle CPU
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//     This module integrates the CPU core, data memory, and instruction memory 
//     into a single CPU unit. Internal connections are hidden, and only external 
//     interfaces are exposed for testing purposes.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CPU(
    input Clk,
    input Clrn,
    output [31:0] Iaddr,
    output [31:0] Daddr,
    output [31:0] Dwrite,
    output Wmem
);

    // 内部信号定义
    wire [31:0] pcin, pcout;
    wire [31:0] pcselect0, pcselect2, pcselect3;
    wire [31:0] Imem_inst; // 指令存储器输出
    wire [31:0] Dmem_dout; // 数据存储器输出

    assign Iaddr = pcout;

    // 指令解析
    wire [5:0] op = Imem_inst[31:26];
    wire [5:0] func = Imem_inst[5:0];
    wire [4:0] rs = Imem_inst[25:21];
    wire [4:0] rt = Imem_inst[20:16];
    wire [4:0] rd = Imem_inst[15:11];
    wire [15:0] immediate = Imem_inst[15:0];
    wire [25:0] addr = Imem_inst[25:0];

    // 控制信号
    wire Z_, regrt, se, wreg, aluqb, wmem, reg2reg;
    wire [1:0] aluc;
    wire [1:0] pcsrc;

    // 程序计数器
    PC pc(
        .Clk(Clk),
        .Reset(~Clrn),
        .R(pcin),
        .Address(pcout)
    );

    // PC前加法器
    GRA_32Bit pcfrontadd(
        .A(pcout),
        .B(32'h4),
        .Cin(1'b0),
        .S(pcselect0),
        .Cout()
    );

    // 控制单元
    CONUNIT conunit(
        .Op(op),
        .Func(func),
        .Z_(Z_),
        .Regrt(regrt),
        .Se(se),
        .Wreg(wreg),
        .Aluqb(aluqb),
        .Wmem(wmem),
        .Reg2reg(reg2reg),
        .Pcsrc(pcsrc),
        .Aluc(aluc)
    );

    // 寄存器文件
    wire [4:0] wr;
    wire [31:0] regwdata;
    wire [31:0] qa, qb;
    MUX_2X5 rtrd2wrswitch(
        .Data0(rd),
        .Data1(rt),
        .Select(conunit.Regrt),
        .Y(wr)
    );

    REGFILE regfile(
        .Ra(rs),
        .Rb(rt),
        .Wr(wr),
        .D(regwdata),
        .We(wreg),
        .Clk(Clk),
        .Clrn(Clrn),
        .Qa(qa),
        .Qb(qb)
    );

    // 立即数扩展
    wire [31:0] extaddr;
    EXT16T32 immext(
        .X(immediate),
        .Se(se),
        .Y(extaddr)
    );

    // ALU操作
    wire [31:0] aluy, alur;
    MUX_2X32 cluyswitch(
        .Data0(extaddr),
        .Data1(qb),
        .Select(aluqb),
        .Y(aluy)
    );

    assign Daddr = alur;
    assign Dwrite = qb;
    assign Wmem = wmem;

    MUX_2X32 regdataswitch(
        .Data0(Dmem_dout),
        .Data1(alur),
        .Select(reg2reg),
        .Y(regwdata)
    );

    ALU alu(
        .X(qa),
        .Y(aluy),
        .Aluc(aluc),
        .R(alur),
        .Z_(Z_)
    );

    // 分支处理
    wire [31:0] immshifterv;
    SHIFTER_32Bit immshifter(
        .X(extaddr),
        .Sa(5'b10),
        .Arith(1'b0),
        .Right(1'b0),
        .Sh(immshifterv)
    );

    GRA_32Bit beqbnepcadd(
        .A(pcselect0),
        .B(immshifterv),
        .Cin(1'b0),
        .S(pcselect2),
        .Cout()
    );

    assign pcselect3 = {pcselect0[31:28], addr[25:0], 2'b00};
    MUX_4X32 pcselect(
        .Data0(pcselect0),
        .Data1(32'b0),
        .Data2(pcselect2),
        .Data3(pcselect3),
        .Select(pcsrc),
        .Y(pcin)
    );

    // 内部集成的指令存储器
    INSTMEM instmem_inst (
        .Addr(pcout),
        .Inst(Imem_inst)
    );

    // 内部集成的数据存储器
    DATAMEM datamem_inst (
        .Addr(alur),
        .Din(qb),
        .Clk(Clk),
        .We(wmem),
        .Dout(Dmem_dout)
    );

endmodule
