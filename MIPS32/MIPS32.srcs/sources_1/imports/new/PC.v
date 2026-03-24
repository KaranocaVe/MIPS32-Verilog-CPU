`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 10:45:19
// Design Name: 
// Module Name: PC
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


module PC(
    input Clk,Reset,
    input [31:0] R,
    output [31:0] Address
    );

    D_FFEC32 dff0(.D(R),.Clk(Clk),.Clrn(~Reset),.Q(Address),.En(1'b1));

endmodule
