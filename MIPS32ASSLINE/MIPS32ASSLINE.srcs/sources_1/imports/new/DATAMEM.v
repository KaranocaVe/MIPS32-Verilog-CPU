`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/16 22:30:26
// Design Name: 
// Module Name: DATAMEM
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


module DATAMEM(
    input [31:0]Addr,Din,
    input Clk,We,
    output [31:0]Dout
    );

    reg [31:0]Ram[31:0];

    assign Dout=Ram[Addr[6:2]];
    always @(posedge Clk) begin
        if (We) begin
            Ram[Addr[6:2]]<=Din;
        end
    end
    integer i;
    initial begin
        for (i=0;i<32;i=i+1) begin
            Ram[i]=32'h00000000;
        end
    end
endmodule
