`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:20:41
// Design Name: 
// Module Name: MEM_
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


module MEM_(
    input Clk,
    //WB
    input EX_Wreg,EX_Reg2reg,
    output WB_Wreg,WB_Reg2reg,CONUNIT_Wreg,
    //M
    input EX_Wmem,
    //etc
    input [31:0] EX_R,EX_S,
    output [31:0] WB_D,
    input [4:0] EX_Wr,
    output [4:0] WB_Wr,
    output [31:0] WB_C,
    output [4:0] M_Rd
);

    DATAMEM dmem(.Addr(EX_R),.Din(EX_S),.Clk(Clk),.We(EX_Wmem),.Dout(WB_C));

    assign WB_Wreg=EX_Wreg;
    assign WB_Reg2reg=EX_Reg2reg;
    assign CONUNIT_Wreg=EX_Wreg;
    assign WB_D=EX_R;
    assign WB_Wr=EX_Wr;
    assign M_Rd=EX_Wr;
endmodule
