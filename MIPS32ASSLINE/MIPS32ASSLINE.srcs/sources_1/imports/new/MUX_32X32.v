`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 23:43:51
// Design Name: 
// Module Name: MUX_32X32
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


module MUX_32X32(
    input [31:0] Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31,
    input [4:0] Select,
    output [31:0] Y
    );

    assign Y = (Select == 5'b00000) ? Data0  :
               (Select == 5'b00001) ? Data1  :
               (Select == 5'b00010) ? Data2  :
               (Select == 5'b00011) ? Data3  :
               (Select == 5'b00100) ? Data4  :
               (Select == 5'b00101) ? Data5  :
               (Select == 5'b00110) ? Data6  :
               (Select == 5'b00111) ? Data7  :
               (Select == 5'b01000) ? Data8  :
               (Select == 5'b01001) ? Data9  :
               (Select == 5'b01010) ? Data10 :
               (Select == 5'b01011) ? Data11 :
               (Select == 5'b01100) ? Data12 :
               (Select == 5'b01101) ? Data13 :
               (Select == 5'b01110) ? Data14 :
               (Select == 5'b01111) ? Data15 :
               (Select == 5'b10000) ? Data16 :
               (Select == 5'b10001) ? Data17 :
               (Select == 5'b10010) ? Data18 :
               (Select == 5'b10011) ? Data19 :
               (Select == 5'b10100) ? Data20 :
               (Select == 5'b10101) ? Data21 :
               (Select == 5'b10110) ? Data22 :
               (Select == 5'b10111) ? Data23 :
               (Select == 5'b11000) ? Data24 :
               (Select == 5'b11001) ? Data25 :
               (Select == 5'b11010) ? Data26 :
               (Select == 5'b11011) ? Data27 :
               (Select == 5'b11100) ? Data28 :
               (Select == 5'b11101) ? Data29 :
               (Select == 5'b11110) ? Data30 :
               (Select == 5'b11111) ? Data31 :
               32'b0;

endmodule

