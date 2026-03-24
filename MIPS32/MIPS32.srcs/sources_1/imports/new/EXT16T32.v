`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:34:47
// Design Name: 
// Module Name: EXT16T32
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


module EXT16T32(
    input [15:0] X,
    input Se,
    output [31:0] Y
    );

    wire [15:0] ZeroFill=0 ;
    wire [15:0] SignFill = X[15] ? {16{1'b1}} : {16{1'b0}};

    assign Y=Se?{SignFill,X}:{ZeroFill,X};
endmodule
