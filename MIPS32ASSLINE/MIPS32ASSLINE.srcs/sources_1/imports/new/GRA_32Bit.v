`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 16:00:17
// Design Name: 
// Module Name: GRA_32Bit
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


module GRA_32Bit(
    input [31:0] A,B,
    input Cin,
    output [31:0] S,
    output Cout
    );

    wire Cout0,Cout1,Cout2,Cout3,Cout4,Cout5,Cout6;

    CLA_4Bit cla0(.X(A[3:0]),.Y(B[3:0]),.Cin(Cin),.S(S[3:0]),.Cout(Cout0));
    CLA_4Bit cla1(.X(A[7:4]),.Y(B[7:4]),.Cin(Cout0),.S(S[7:4]),.Cout(Cout1));
    CLA_4Bit cla2(.X(A[11:8]),.Y(B[11:8]),.Cin(Cout1),.S(S[11:8]),.Cout(Cout2));
    CLA_4Bit cla3(.X(A[15:12]),.Y(B[15:12]),.Cin(Cout2),.S(S[15:12]),.Cout(Cout3));
    CLA_4Bit cla4(.X(A[19:16]),.Y(B[19:16]),.Cin(Cout3),.S(S[19:16]),.Cout(Cout4));
    CLA_4Bit cla5(.X(A[23:20]),.Y(B[23:20]),.Cin(Cout4),.S(S[23:20]),.Cout(Cout5));
    CLA_4Bit cla6(.X(A[27:24]),.Y(B[27:24]),.Cin(Cout5),.S(S[27:24]),.Cout(Cout6));
    CLA_4Bit cla7(.X(A[31:28]),.Y(B[31:28]),.Cin(Cout6),.S(S[31:28]),.Cout(Cout));

    
endmodule
