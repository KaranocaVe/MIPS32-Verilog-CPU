`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:20:41
// Design Name: 
// Module Name: IF_
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



module IF_(
    input [31:0] bpc, ID_jpc,          // 输入信号：分支目标地址(bpc)和跳转目标地址(ID_jpc)
    input [1:0] Pcsrc,              // 输入信号：PC选择信号(Pcsrc)
    input Clk, Reset, PCWe,         // 输入信号：时钟信号(Clk)、复位信号(Reset)和PC写使能信号(PCWe)
    output [31:0] ID_PC4, ID_Inst,  // 输出信号：PC+4(ID_PC4)、指令(ID_Inst)和跳转目标地址(IF_jpc)
    output reg [31:0] IF_jpc
    );

    wire [31:0] R, PC;              // 定义32位宽的内部连线R和PC
    reg [31:0] internaljpc;    // 定义32位宽的内部连线internaljpc

    // 4选1多路复用器实例化，根据Pcsrc选择ID_PC4、bpc或ID_jpc中的一个输出到R
    MUX_4X32 uu1(.Data0(ID_PC4), .Data2(bpc), .Data3(internaljpc), .Select(Pcsrc), .Y(R));
    
    // 程序计数器实例化，使用时钟信号、复位信号和写使能信号，根据R的值更新PC
    PC uu2(.Clk(Clk), .Reset(Reset), .R(R), .Address(PC), .En(PCWe));
    
    // 将PC加4的结果赋值给ID_PC4
    assign ID_PC4 = PC + 32'b100;
    
    // 指令存储器实例化，根据PC的值读取指令并输出到ID_Inst
    INSTMEM uu3(.Addr(PC), .Inst(ID_Inst));

    // 这一部分不需要，但是我暂时不想改了
    always @(ID_Inst,ID_PC4) begin
        // 如果指令为跳转指令，则将跳转目标地址输出到IF_jpc
        if (ID_Inst[31:26] == 6'b000010) begin
            IF_jpc = {ID_Inst[25:0], 6'b0};
        end
        // 否则将PC+4的值输出到IF_jpc
        else begin
            IF_jpc = ID_PC4;
        end
    end


    // 这才是要的
    // assign internaljpc=(ID_Inst[31:26]==6'b000010)?{ID_PC4[31:28],ID_Inst[25:0],2'b00}:R;

    always @(ID_Inst,ID_PC4) begin
        if (ID_Inst[31:26] == 6'b000010) begin
            internaljpc = {ID_PC4[31:28], ID_Inst[25:0], 2'b00};
        end
    end

endmodule
