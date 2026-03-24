`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 20:31:43
// Design Name: 
// Module Name: SHIFT_16Bit
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


module SHIFT_16Bit(
    input [31:0] X,
    input Sa,
    input Arith,
    input Right,
    output [31:0] Sh
    );

    parameter N = 16;

    wire [N-1:0] ZeroFill=0;
    wire [N-1:0] SignFill = X[31] ? {N{1'b1}} : {N{1'b0}};
    wire [31:0] L_L={X[31-N:0],ZeroFill};
    wire [31:0] A_L={X[31-N:0],ZeroFill};
    wire [31:0] L_R={ZeroFill,X[31:N]};
    wire [31:0] A_R={SignFill,X[31:N]};

    assign Sh=Sa?(Right?(Arith?A_R:L_R):(Arith?A_L:L_L)):X;
    
endmodule
