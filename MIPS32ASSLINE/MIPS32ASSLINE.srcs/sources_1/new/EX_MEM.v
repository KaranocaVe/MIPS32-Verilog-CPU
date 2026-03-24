`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:24:35
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input Clk,
    //WB
    input EX_Wreg,EX_Reg2reg,
    output MEM_Wreg,MEM_Reg2reg,
    //M
    input EX_Wmem,
    output MEM_Wmem,
    //etc
    input [4:0] EX_Wr,
    output [4:0] MEM_Wr,
    input EX_Z,
    output MEM_Z,
    input [31:0] EX_R,EX_S,
    output [31:0] MEM_R,MEM_S
);

    reg Wreg,Reg2reg,Wmem;
    reg [4:0] Wr;
    reg Z;
    reg [31:0] R,S;

    always @(posedge Clk) begin
        Wreg<=EX_Wreg;
        Reg2reg<=EX_Reg2reg;
        Wmem<=EX_Wmem;
        Wr<=EX_Wr;
        Z<=EX_Z;
        R<=EX_R;
        S<=EX_S;
    end

    assign MEM_Wreg=Wreg;
    assign MEM_Reg2reg=Reg2reg;
    assign MEM_Wmem=Wmem;
    assign MEM_Wr=Wr;
    assign MEM_Z=Z;
    assign MEM_R=R;
    assign MEM_S=S;
endmodule
