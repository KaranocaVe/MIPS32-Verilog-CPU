`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 10:50:02
// Design Name: 
// Module Name: TestBench_PC
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


module TestBench_PC;
    // Inputs
    reg Clk;
    reg Reset;
    reg [31:0] R;

    // Outputs
    wire [31:0] Address;

    // Instantiate the PC module
    PC uut (
        .Clk(Clk),
        .Reset(Reset),
        .R(R),
        .Address(Address)
    );

    // Clock generation: 50MHz clock, period is 20ns
    always #10 Clk = ~Clk;

    initial begin
        Clk = 0;
        Reset = 0;
        R = 0;

        Reset = 1;
        #20;
        Reset = 0;

        if (Address != 0) begin
            $display("Test Case 1 Failed: Expected Address = 0, but got %d", Address);
        end else begin
            $display("Test Case 1 Passed");
        end

        R = 32'hA5A5A5A5;
        #20;

        if (Address != 32'hA5A5A5A5) begin
            $display("Test Case 2 Failed: Expected Address = 32'hA5A5A5A5, but got %h", Address);
        end else begin
            $display("Test Case 2 Passed");
        end

        R = 32'h5A5A5A5A;
        #20;

        if (Address != 32'h5A5A5A5A) begin
            $display("Test Case 3 Failed: Expected Address = 32'h5A5A5A5A, but got %h", Address);
        end else begin
            $display("Test Case 3 Passed");
        end

        Reset = 1;
        #20;
        Reset = 0;

        if (Address != 0) begin
            $display("Test Case 4 Failed: Expected Address = 0, but got %h", Address);
        end else begin
            $display("Test Case 4 Passed");
        end

        $finish;
    end

endmodule