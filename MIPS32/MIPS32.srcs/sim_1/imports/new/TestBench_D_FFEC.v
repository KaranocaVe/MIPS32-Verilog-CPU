`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:53:26
// Design Name: 
// Module Name: TestBench_D_FFEC
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


module TestBench_D_FFEC;
    reg D, Clk, En, Clrn;
    wire Q, Qn;

    D_FFEC uut (
        .D(D),
        .Clk(Clk),
        .En(En),
        .Clrn(Clrn),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // Clock with period of 10 time units
    end

    initial begin
        // Initialize inputs
        D = 0;
        En = 0;
        Clrn = 0;
        #10;
        
        // Test 1: Clear active
        Clrn = 1; En = 0; D = 1;
        #10;
        
        // Test 2: Enable is 0, no data load
        En = 0; D = 1;
        #10;
        
        // Test 3: Enable is 1, load data
        En = 1; D = 1;
        #10;
        
        // Test 4: Load new data
        D = 0;
        #10;
        
        // Test 5: Clear is active, reset outputs
        Clrn = 0;
        #10;
        
        $finish;
    end
endmodule
