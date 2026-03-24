`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:07:42
// Design Name: 
// Module Name: SHIFTER_32Bit
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


module SHIFTER_32Bit(
    input [31:0] X,
    input [4:0] Sa,
    input Arith,
    input Right,
    output [31:0] Sh
    );

    wire [31:0] temp0,temp1,temp2,temp3;

    SHIFT_16Bit S16(.X(X),.Sa(Sa[4]),.Arith(Arith),.Right(Right),.Sh(temp0));
    SHIFT_8Bit S8(.X(temp0),.Sa(Sa[3]),.Arith(Arith),.Right(Right),.Sh(temp1));
    SHIFT_4Bit S4(.X(temp1),.Sa(Sa[2]),.Arith(Arith),.Right(Right),.Sh(temp2));
    SHIFT_2Bit S2(.X(temp2),.Sa(Sa[1]),.Arith(Arith),.Right(Right),.Sh(temp3));
    SHIFT_1Bit S1(.X(temp3),.Sa(Sa[0]),.Arith(Arith),.Right(Right),.Sh(Sh));

endmodule