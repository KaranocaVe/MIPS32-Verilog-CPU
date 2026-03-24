`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 22:47:57
// Design Name: 
// Module Name: MUX_4X32
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


module MUX_4X32(
    input [31:0] Data0,
    input [31:0] Data1,
    input [31:0] Data2,
    input [31:0] Data3,
    input [1:0] Select,
    output [31:0] Y
);

    assign Y = (Select == 2'b00) ? Data0 :
               (Select == 2'b01) ? Data1 :
               (Select == 2'b10) ? Data2 :
               (Select == 2'b11) ? Data3 :
               32'b0;

endmodule