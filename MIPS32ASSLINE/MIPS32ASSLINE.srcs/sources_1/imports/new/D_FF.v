`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:43:36
// Design Name: 
// Module Name: D_FF
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


module D_FF(
    input D,Clk,
    output Q,Qn
    );

    wire ClkN,Q0,Qn0;
    not i0(ClkN,Clk);
    D_Latch d0(D,ClkN,Q0,Qn0);
    D_Latch d1(Q0,Clk,Q,Qn);
endmodule
