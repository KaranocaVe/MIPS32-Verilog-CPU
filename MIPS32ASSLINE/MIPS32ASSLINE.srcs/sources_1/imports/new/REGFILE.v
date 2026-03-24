`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 13:18:40
// Design Name: 
// Module Name: REGFILE
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


module REGFILE(
    input [4:0] Ra, Rb, Wr,
    input [31:0] D,
    input We, Clk, Clrn,
    output [31:0] Qa, Qb
    );

    reg [31:0] R[31:0];

    integer i;
    always @(negedge Clk) begin
        if (~Clrn) begin
            // ¸´Î»ËùÓÐ¼Ä´æÆ÷
            for (i = 0; i < 32; i = i + 1) begin
                R[i] <= 32'b0;
            end
        end else if (We) begin
            R[Wr] <= D;
        end
    end

    assign Qa = R[Ra];
    assign Qb = R[Rb];

endmodule