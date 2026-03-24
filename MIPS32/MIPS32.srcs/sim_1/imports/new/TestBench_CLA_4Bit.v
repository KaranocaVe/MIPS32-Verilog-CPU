`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 15:42:04
// Design Name: 
// Module Name: TestBench_CLA_4Bit
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


module TestBench_CLA_4Bit;

    // Inputs to the CLA_4Bit module
    reg [3:0] X;
    reg [3:0] Y;
    reg Cin;

    // Outputs from the CLA_4Bit module
    wire [3:0] S;
    wire Cout;

    // Instantiate the CLA_4Bit module
    CLA_4Bit uut (
        .X(X),
        .Y(Y),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Test cases
    initial begin
        // Initialize inputs
        X = 4'b0000;
        Y = 4'b0000;
        Cin = 0;

        // Wait for a short period and observe the results
        #10;
        
        // Test Case 1: 0 + 0 with Cin = 0
        X = 4'b0000; Y = 4'b0000; Cin = 0;
        #10;

        // Test Case 2: 1 + 1 with Cin = 0
        X = 4'b0001; Y = 4'b0001; Cin = 0;
        #10;


        // Test Case 3: 15 + 1 with Cin = 0
        X = 4'b1111; Y = 4'b0001; Cin = 0;
        #10;


        // Test Case 4: 7 + 8 with Cin = 1
        X = 4'b0111; Y = 4'b1000; Cin = 1;
        #10;

        // Test Case 5: 9 + 6 with Cin = 0
        X = 4'b1001; Y = 4'b0110; Cin = 0;
        #10;


        // End of test
        $finish;
    end

endmodule
