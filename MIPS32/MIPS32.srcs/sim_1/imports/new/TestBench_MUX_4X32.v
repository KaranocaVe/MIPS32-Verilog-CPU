`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 23:37:55
// Design Name: 
// Module Name: TestBench_MUX_4X32
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


module TestBench_MUX_4X32;

    reg [31:0] data0;
    reg [31:0] data1;
    reg [31:0] data2;
    reg [31:0] data3;
    reg [1:0] sel;
    wire [31:0] y;

    MUX_4X32 uut (
        .Data0(data0),
        .Data1(data1),
        .Data2(data2),
        .Data3(data3),
        .Select(sel),
        .Y(y)
    );

    initial begin
        data0 = 32'h12345678;
        data1 = 32'h9ABCDEF0;
        data2 = 32'h00000000;
        data3 = 32'hFFFFFFFF;
        sel = 2'b00;
        #10;
        sel = 2'b01;
        #10;
        sel = 2'b10;
        #10;
        sel = 2'b11;
        #10;
        $finish;
    end


endmodule