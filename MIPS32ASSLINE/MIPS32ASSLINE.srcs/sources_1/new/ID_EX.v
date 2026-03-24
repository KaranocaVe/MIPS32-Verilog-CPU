`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:24:35
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input Clk,Clrn,
    //WB
    input ID_Wreg,ID_Reg2reg,
    output EX_Wreg,EX_Reg2reg,
    //M
    input ID_Wmem,
    output EX_Wmem,
    input [5:0] ID_op,
    output [5:0] EX_op,
    //EX
    input ID_Aluqb,
    output EX_Aluqb,
    input [1:0] ID_Aluc,
    output [1:0] EX_Aluc,
    input [1:0] ID_FwdA,ID_FwdB,
    output [1:0] EX_FwdA,EX_FwdB,
    //etc
    input [31:0] ID_bpc,ID_imm32,ID_Qa,ID_Qb,
    output [31:0] EX_bpc,EX_imm32,EX_Qa,EX_Qb,
    input[4:0] ID_Wr,
    output[4:0] EX_Wr
);
    reg [31:0] bpc,imm32,Qa,Qb;
    reg [5:0] op;
    reg [4:0] Wr;
    reg [1:0] Aluc;
    reg Aluqb,Wreg,Reg2reg,Wmem;
    reg [1:0] FwdA,FwdB;

    always @(posedge Clk) begin
        if(~Clrn) begin
            bpc<=32'b0;
            imm32<=32'b0;
            Qa<=32'b0;
            Qb<=32'b0;
            op<=6'b0;
            Wr<=5'b0;
            Aluc<=2'b0;
            Aluqb<=1'b0;
            Wreg<=1'b0;
            Reg2reg<=1'b0;
            Wmem<=1'b0;
            FwdA<=1'b0;
            FwdB<=1'b0;
        end else begin
            bpc<=ID_bpc;
            imm32<=ID_imm32;
            Qa<=ID_Qa;
            Qb<=ID_Qb;
            op<=ID_op;
            Wr<=ID_Wr;
            Aluc<=ID_Aluc;
            Aluqb<=ID_Aluqb;
            Wreg<=ID_Wreg;
            Reg2reg<=ID_Reg2reg;
            Wmem<=ID_Wmem;
            FwdA<=ID_FwdA;
            FwdB<=ID_FwdB;
        end
    end

    assign EX_bpc=bpc;
    assign EX_imm32=imm32;
    assign EX_Qa=Qa;
    assign EX_Qb=Qb;
    assign EX_op=op;
    assign EX_Wr=Wr;
    assign EX_Aluc=Aluc;
    assign EX_Aluqb=Aluqb;
    assign EX_Wreg=Wreg;
    assign EX_Reg2reg=Reg2reg;
    assign EX_Wmem=Wmem;
    assign EX_FwdA=FwdA;
    assign EX_FwdB=FwdB;

endmodule
