`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 23:37:55
// Design Name: 
// Module Name: TestBench_MUX_2X32
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


module TestBench_MUX_2X32;

    reg [31:0] data0;
    reg [31:0] data1;
    reg sel;
    wire [31:0] y;

    MUX_2X32 uut (
        .Data0(data0),
        .Data1(data1),
        .Select(sel),
        .Y(y)
    );

    initial begin
        data0 = 32'h12345678;
        data1 = 32'h9ABCDEF0;
        sel = 0;
        #10;
        sel = 1;
        #10;
        data0 = 32'hFFFFFFFF;
        data1 = 32'h00000000;
        sel = 0;
        #10;
        sel = 1;
        #10;

        $finish;
    end

endmodule
