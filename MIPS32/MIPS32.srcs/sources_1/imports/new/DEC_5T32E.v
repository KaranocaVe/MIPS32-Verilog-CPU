`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 22:29:58
// Design Name: 
// Module Name: DEC_5T32E
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


module DEC_5T32E(
    input [4:0] In,
    input En,
    output reg [31:0] Out
    );

    always @(*)begin
        if(En) begin
                Out=32'b0;
                Out[In]=1'b1;
        end else begin
            Out=32'b0;
            end
    end
endmodule