`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:44:13
// Design Name: 
// Module Name: D_FFEC
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


module D_FFEC(
    input D,Clk,En,Clrn,
    output Q,Qn
    );
    wire Y0,Y_C;
    
    assign Y0=En?D:Q;
    and i0(Y_C,Y0,Clrn);
    D_FF d0(Y_C,Clk,Q,Qn);
endmodule
