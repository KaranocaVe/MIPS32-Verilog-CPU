`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 10:17:35
// Design Name: 
// Module Name: TestBench_DATAMEM
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


module TestBench_DATAMEM;

    // Testbench 信号定义
    reg [31:0] Addr;
    reg [31:0] Din;
    reg Clk;
    reg We;
    wire [31:0] Dout;

    // 实例化被测试的 DATAMEM 模块
    DATAMEM uut (
        .Addr(Addr),
        .Din(Din),
        .Clk(Clk),
        .We(We),
        .Dout(Dout)
    );

    // 时钟信号产生器
    always #5 Clk = ~Clk;  // 每5个时间单位翻转一次，产生10单位的时钟周期

    // 初始化和测试过程
    initial begin
        // 初始化信号
        Clk = 0;
        We = 0;
        Addr = 0;
        Din = 0;

        // 写操作测试
        #10;
        We = 1;
        Addr = 32'h00000004; // 写入地址 4
        Din = 32'h12345678;  // 写入数据 0x12345678
        #10;

        We = 1;
        Addr = 32'h00000008; // 写入地址 8
        Din = 32'h87654321;  // 写入数据 0x87654321
        #10;

        // 读操作测试
        We = 0;
        Addr = 32'h00000004; // 读取地址 4
        #10;
        Addr = 32'h00000008; // 读取地址 8
        #10;

        // 读不存在的地址
        Addr = 32'h0000000C; // 读取地址 12，应该为 0x00000000，因为没有写入过
        #10;

        // 结束仿真
        $finish;
    end

endmodule