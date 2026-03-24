`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 21:12:18
// Design Name: 
// Module Name: TestBench_SHIFTER_32Bit
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


module TestBench_SHIFTER_32Bit;
    reg [31:0] X;
    reg [4:0] Sa;
    reg Arith;
    reg Right;
    wire [31:0] Sh;

    SHIFTER_32Bit uut (
        .X(X),
        .Sa(Sa),
        .Arith(Arith),
        .Right(Right),
        .Sh(Sh)
    );

    initial begin
        X = 32'b10101010101010101010101010101010;
        Sa = 5'b00010;
        Arith = 1'b0;
        Right = 1'b0;
        #10;
        
        Right = 1'b1;
        #10;
        
        Arith = 1'b1;
        #10;

        Sa = 5'b00100;
        #10;
        Right = 1'b0;
        Sa = 5'b11111;
        #10;

        $stop;
    end
endmodule
