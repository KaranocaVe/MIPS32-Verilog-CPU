`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 22:06:30
// Design Name: 
// Module Name: TestBench_REG32
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


module TestBench_REG32;
    reg [31:0] Data;
    reg [31:0] En;
    reg Clk;
    reg Clrn;
    wire [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;

    REG32 uut (
        .Data(Data),
        .En(En),
        .Clk(Clk),
        .Clrn(Clrn),
        .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .Q5(Q5), .Q6(Q6), .Q7(Q7), .Q8(Q8), .Q9(Q9),
        .Q10(Q10), .Q11(Q11), .Q12(Q12), .Q13(Q13), .Q14(Q14), .Q15(Q15), .Q16(Q16), .Q17(Q17), 
        .Q18(Q18), .Q19(Q19), .Q20(Q20), .Q21(Q21), .Q22(Q22), .Q23(Q23), .Q24(Q24), .Q25(Q25),
        .Q26(Q26), .Q27(Q27), .Q28(Q28), .Q29(Q29), .Q30(Q30), .Q31(Q31)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // Clock with period of 10 time units
    end

    initial begin
        // Initialize inputs
        Data = 32'h00000000;
        En = 32'h00000000;
        Clrn = 0;
        #10;
        
        // Test 1: Clear registers
        Clrn = 1;
        #10;
        
        // Test 2: Write data with enable on
        Data = 32'hA5A5A5A5;
        En = 32'hFFFFFFFF;
        #10;
        
        // Test 3: Write different data with selective enable
        Data = 32'h5A5A5A5A;
        En = 32'h0000FFFF;
        #10;
        
        // Test 4: Write new data, but disable all
        Data = 32'hFFFFFFFF;
        En = 32'hFFFFFFFF;
        #10;

        $finish;
    end
endmodule
