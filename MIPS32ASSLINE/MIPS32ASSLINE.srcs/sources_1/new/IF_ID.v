`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/08 15:24:35
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input We,Clrn,Clk,
    input [31:0] IF_PC4,IF_IR,IF_jpc,
    output [31:0] ID_PC4,ID_IR,ID_jpc
);

    reg [31:0] PC4,IR,jpc;

    always @(posedge Clk) begin
        if(~Clrn) begin
            PC4<=32'b0;
            IR<=32'b0;
            jpc<=32'b0;
        end
        else begin
            if(We) begin
                PC4<=IF_PC4;
                IR<=IF_IR;
                jpc<=IF_jpc;
            end
        end
    end

    assign ID_PC4=PC4;
    assign ID_IR=IR;
    assign ID_jpc=jpc;

endmodule
