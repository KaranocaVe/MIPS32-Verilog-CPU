`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/16 19:49:42
// Design Name: 
// Module Name: TestBench_ALU
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


module TestBench_ALU;

    // Testbench 信号定义
    reg [31:0] X, Y;
    reg [1:0] Aluc;
    wire [31:0] R;
    wire Z_;

    // 实例化被测试的 ALU 模块
    ALU uut (
        .X(X),
        .Y(Y),
        .Aluc(Aluc),
        .R(R),
        .Z_(Z_)
    );

    // 初始化输入信号
    initial begin
        // 显示仿真输出
        $monitor("Time = %0t, X = %h, Y = %h, Aluc = %b, R = %h, Z = %b", 
                 $time, X, Y, Aluc, R, Z_);

        // 测试 1: 加法操作
        X = 32'h00000010; // X = 16
        Y = 32'h00000020; // Y = 32
        Aluc = 2'b00;     // 加法
        #10;

        // 测试 2: 减法操作
        X = 32'h00000030; // X = 48
        Y = 32'h00000030; // Y = 48
        Aluc = 2'b01;     // 减法
        #10;

        // 测试 3: 按位与操作
        X = 32'hFF00FF00; // X = 32 位数
        Y = 32'h0F0F0F0F; // Y = 32 位数
        Aluc = 2'b10;     // 按位与
        #10;

        // 测试 4: 按位或操作
        X = 32'h000000FF; // X = 255
        Y = 32'h0000FF00; // Y = 65280
        Aluc = 2'b11;     // 按位或
        #10;
        // 结束仿真
        $finish;
    end

endmodule
