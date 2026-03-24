`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:20:41
// Design Name: 
// Module Name: WB_
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


module WB_(
    //WB
    input MEM_Wreg,MEM_Reg2reg,
    output REGFILE_Wreg,
    //etc
    input [31:0] MEM_D,
    input [31:0] MEM_C,
    output [31:0] REGFILE_D,
    input [4:0] MEM_Wr,
    output [4:0] REGFILE_Wr
);

    assign REGFILE_Wreg=MEM_Wreg;

    assign REGFILE_Wr=MEM_Wr;

    MUX_2X32 mux(.Data0(MEM_C),.Data1(MEM_D),.Select(MEM_Reg2reg),.Y(REGFILE_D));
endmodule
