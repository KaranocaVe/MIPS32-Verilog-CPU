`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 19:16:28
// Design Name: 
// Module Name: ADDSUB_32
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


module ADDSUB_32(
    input [31:0] A,B,
    input Sub,
    output [31:0] S,
    output Cout
    );

    GRA_32Bit gra0(.A(A),.B(B^{32{Sub}}),.Cin(Sub),.S(S),.Cout(Cout));
endmodule
