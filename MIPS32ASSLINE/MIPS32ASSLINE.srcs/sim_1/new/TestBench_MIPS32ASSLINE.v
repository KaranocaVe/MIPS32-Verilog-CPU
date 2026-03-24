`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/18 09:58:39
// Design Name: 
// Module Name: TestBench_MIPS32ASSLINE
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


module TestBench_MIPS32ASSLINE;

    // 定义时钟和复位信号
    reg Clk, Clrn;
    


    // 实例化封装后的CPU模块
    PiplineCPU cpu_inst (.Clk(Clk), .Clrn(Clrn));

    // 时钟周期，时钟翻转周期为10ns
    always #5 Clk = ~Clk;

    initial begin
        // 初始化信号
        Clk = 0;
        Clrn = 0;
        #10 Clrn = 1; // 解除复位

        // 运行一段时间后停止仿真
        #215 $finish;
    end

    // 监视信号，打印CPU内部状态和输出
    // initial begin
    //     $monitor("Time=%0d, Iaddr=%h, Daddr=%h, Dwrite=%h, Wmem=%b", 
    //               $time, Iaddr, Daddr, Dwrite, Wmem);
    // end

    // 访问CPU的内部模块接口
    // 使用“force”和“release”语句可以强制驱动内部信号值以进行特定测试
    // initial begin
    //     #15 force cpu_inst.Imem_inst = 32'hXXXXXXXX; // 你可以在这里设置特定的指令值
    //     #20 release cpu_inst.Imem_inst;
    // end

endmodule
