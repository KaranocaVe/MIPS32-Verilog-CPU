`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 15:23:28
// Design Name: 
// Module Name: CLA_4Bit
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


module CLA_4Bit(
    input [3:0] X,Y,
    input Cin,
    output [3:0] S,
    output Cout
    );

    wire G0,P0,G1,P1,G2,P2,G3,P3;
    wire Cout0,Cout1,Cout2;

    assign G0=X[0]&Y[0];
    assign P0=X[0]|Y[0];
    assign G1=X[1]&Y[1];
    assign P1=X[1]|Y[1];
    assign G2=X[2]&Y[2];
    assign P2=X[2]|Y[2];
    assign G3=X[3]&Y[3];
    assign P3=X[3]|Y[3];

    assign Cout0=G0|(P0&Cin);
    assign Cout1=G1|(P1&G0)|(P1&P0&Cin);
    assign Cout2=G2|(P2&G1)|(P2&P1&G0)|(P2&P1&P0&Cin);
    assign Cout=G3|(P3&G2)|(P3&P2&G1)|(P3&P2&P1&G0)|(P3&P2&P1&P0&Cin);

    assign S[0]=X[0]^Y[0]^Cin;
    assign S[1]=X[1]^Y[1]^Cout0;
    assign S[2]=X[2]^Y[2]^Cout1;
    assign S[3]=X[3]^Y[3]^Cout2;

endmodule
