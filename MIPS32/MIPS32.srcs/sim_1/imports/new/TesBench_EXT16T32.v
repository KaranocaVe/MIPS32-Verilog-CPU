`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:38:27
// Design Name: 
// Module Name: TesBench_EXT16T32
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


module TesBench_EXT16T32;
    reg [15:0] X;
    reg Se;
    wire [31:0] Y;

    EXT16T32 uut (
        .X(X),
        .Se(Se),
        .Y(Y)
    );

    initial begin
        // Test 1: Zero extension
        X = 16'h1234;
        Se = 1'b0;
        #10;
        
        // Test 2: Sign extension (positive number)
        X = 16'h1234;
        Se = 1'b1;
        #10;
        
        // Test 3: Sign extension (negative number)
        X = 16'hF234;
        Se = 1'b1;
        #10;
        
        // Test 4: Zero extension (negative number)
        X = 16'hF234;
        Se = 1'b0;
        #10;

        $stop;
    end
endmodule
