`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 22:51:36
// Design Name: 
// Module Name: MUX_2X32
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


module MUX_2X32(
    input [31:0] Data0,
    input [31:0] Data1,
    input Select,
    output [31:0] Y
);

    assign Y = (Select == 1'b0) ? Data0 : Data1;

endmodule



