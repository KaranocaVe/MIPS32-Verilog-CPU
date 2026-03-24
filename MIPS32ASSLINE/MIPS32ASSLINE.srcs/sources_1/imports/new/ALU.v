`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/16 19:40:26
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] X,Y,
    input [1:0] Aluc,
    output [31:0] R,
    output Z_
    );

    wire [31:0] d_as,d_and,d_or,d_and_or;

    ADDSUB_32 as32(.A(X),.B(Y),.Sub(Aluc[0]),.S(d_as),.Cout());
    assign d_and=X&Y;
    assign d_or=X|Y;
    MUX_2X32 select1(.Data0(d_and),.Data1(d_or),.Select(Aluc[0]),.Y(d_and_or));
    MUX_2X32 select2(.Data0(d_as),.Data1(d_and_or),.Select(Aluc[1]),.Y(R));

    assign Z_=~|R;
endmodule
