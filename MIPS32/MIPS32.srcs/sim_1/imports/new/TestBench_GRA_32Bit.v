`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 15:58:50
// Design Name: 
// Module Name: TestBench_GRA_32Bit
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


module TestBench_GRA_32Bit();
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;
    
    wire [31:0] S;
    wire Cout;
    
    GRA_32Bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );
    
    initial begin
        A = 0;
        B = 0;
        Cin = 0;
        
        $monitor("Time=%0t A=%h B=%h Cin=%b S=%h Cout=%b", $time, A, B, Cin, S, Cout);
        
        #10 A = 32'h00000001; B = 32'h00000001; Cin = 0; // Case 1: 1 + 1
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; // Case 2: 最大值 + 1
        #10 A = 32'h12345678; B = 32'h87654321; Cin = 0; // Case 3: 一些随机值
        #10 A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; Cin = 1; // Case 4: 全1，加上1的进位
        
        #10 A = 32'h80000000; B = 32'h80000000; Cin = 0; // Case 5: 边界测试
        #10 A = 32'h7FFFFFFF; B = 32'h7FFFFFFF; Cin = 1; // Case 6: 另一边界测试

        #10 $finish;
    end
    
endmodule
