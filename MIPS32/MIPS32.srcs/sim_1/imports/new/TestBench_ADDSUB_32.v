`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 19:29:56
// Design Name: 
// Module Name: TestBench_ADDSUB_32
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


module TestBench_ADDSUB_32();
    reg [31:0] A;
    reg [31:0] B;
    reg Sub;
    wire [31:0] S;
    wire Cout;

    ADDSUB_32 uut (
        .A(A),
        .B(B),
        .Sub(Sub),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        A = 0;
        B = 0;
        Sub = 0;

        $monitor("Time=%0t A=%h B=%h Sub=%b S=%h Cout=%b", $time, A, B, Sub, S, Cout);

        #10 A = 32'h00000005; B = 32'h00000003; Sub = 0; // Addition
        #10 A = 32'h00000005; B = 32'h00000003; Sub = 1; // Subtraction
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; Sub = 0; // Addition with carry
        #10 A = 32'hFFFFFFFF; B = 32'h00000001; Sub = 1; // Subtraction with borrow
        #10 A = 32'h12345678; B = 32'h87654321; Sub = 0; // Addition with random values
        #10 A = 32'h12345678; B = 32'h87654321; Sub = 1; // Subtraction with random values

        #10 $finish;
    end

endmodule
