`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/19 18:45:31
// Design Name: 
// Module Name: MUX_2X5
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


module MUX_2X5(
    input [4:0] Data0,
    input [4:0] Data1,
    input Select,
    output [4:0] Y
);

    assign Y = (Select == 1'b0) ? Data0 : Data1;

endmodule

