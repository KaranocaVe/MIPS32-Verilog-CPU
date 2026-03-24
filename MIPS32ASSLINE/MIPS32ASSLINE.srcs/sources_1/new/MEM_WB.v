`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:24:35
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input Clk,
    //WB
    input MEM_Wreg,MEM_Reg2reg,
    output WB_Wreg,WB_Reg2reg,
    //etc
    input [31:0] MEM_D,MEM_C,
    output [31:0] WB_D,WB_C,
    input [4:0] MEM_Wr,
    output [4:0] WB_Wr
);

    reg Wreg,Reg2reg;
    reg [31:0] D,C;
    reg [4:0] Wr;

    always @(posedge Clk) begin
        Wreg<=MEM_Wreg;
        Reg2reg<=MEM_Reg2reg;
        D<=MEM_D;
        C<=MEM_C;
        Wr<=MEM_Wr;
    end

    assign WB_Wreg=Wreg;
    assign WB_Reg2reg=Reg2reg;
    assign WB_D=D;
    assign WB_C=C;
    assign WB_Wr=Wr;

endmodule
