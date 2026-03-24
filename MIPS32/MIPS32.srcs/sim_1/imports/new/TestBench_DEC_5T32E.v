`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 22:35:06
// Design Name: 
// Module Name: TestBench_DEC_5T32E
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


module TestBench_DEC_5T32E;
    reg [4:0] In;
    reg En;
    wire [31:0] Out;

    DEC_5T32E uut (
        .In(In),
        .En(En),
        .Out(Out)
    );

    initial begin
        // Initialize inputs
        In = 5'b00000;
        En = 1'b0;  // Start with enable low (disabled)
        #10;

        // Test 1: Enable is low, no output change expected
        In = 5'b00001;
        #10;
        
        // Test 2: Enable high, In = 1
        En = 1'b1;
        #10;
        
        // Test 3: In = 2 with enable high
        In = 5'b00010;
        #10;
        
        // Test 4: In = 15 with enable high
        In = 5'b01111;
        #10;

        // Test 5: In = 31 with enable high
        In = 5'b11111;
        #10;

        // Test 6: Enable low again, output should be zero
        En = 1'b0;
        #10;

        $stop;
    end
endmodule