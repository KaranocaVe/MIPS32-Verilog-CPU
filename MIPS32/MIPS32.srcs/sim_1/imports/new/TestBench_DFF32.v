`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 00:14:24
// Design Name: 
// Module Name: TestBench_DFF32
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


module TestBench_DFF32;

reg [31:0] data;

reg en;

reg clk;

reg clrn;

wire [31:0] q;

DFF32 uut (
    .Data(data),
    .En(en),
    .Clk(clk),
    .Clrn(clrn),
    .Q(q)
);

initial begin
    data=32'h12345678;
    en=1;
    clk=0;
    clrn=0;
    #10;
    clk=1;
    #10;
    clk=0;
    clrn=1;
    en=0;
    #10;
    clk=1;
    clrn=0;
    #10;
    clk=0;
    #10;
    clrn=1;
    $finish;
    end

endmodule

