`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 22:55:18
// Design Name: 
// Module Name: TestBench_REGFILE
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


module TestBench_REGFILE;
    reg [4:0] Ra, Rb, Wr;
    reg [31:0] D;
    reg We, Clk, Clrn;
    wire [31:0] Qa, Qb;

    // Instantiate the REGFILE module
    REGFILE uut (
        .Ra(Ra),
        .Rb(Rb),
        .Wr(Wr),
        .D(D),
        .We(We),
        .Clk(Clk),
        .Clrn(Clrn),
        .Qa(Qa),
        .Qb(Qb)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // Clock with 10-time-unit period
    end

    initial begin
        // Initialize signals
        Clrn = 0;
        We = 0;
        Ra = 5'b00000;
        Rb = 5'b00000;
        Wr = 5'b00000;
        D = 32'h00000000;
        #10;

        // Test 1: Reset release and write to register 0
        Clrn = 1;
        Wr = 5'b00000;
        D = 32'hA5A5A5A5;
        We = 1;
        #10;

        // Test 2: Read from register 0 into Qa and Rb
        Ra = 5'b00000;
        Rb = 5'b00000;
        We = 0;
        #10;

        // Test 3: Write to register 1 and read simultaneously
        Wr = 5'b00001;
        D = 32'h5A5A5A5A;
        We = 1;
        Ra = 5'b00001;
        Rb = 5'b00000;
        #10;

        // Test 4: Read from registers 1 and 0
        We = 0;
        Ra = 5'b00001;
        Rb = 5'b00000;
        #10;

        // Test 5: Write to register 31 and read
        Wr = 5'b11111;
        D = 32'hFFFFFFFF;
        We = 1;
        Ra = 5'b11111;
        Rb = 5'b00001;
        #10;

        // Test 6: Final read from registers 31 and 1
        We = 0;
        Ra = 5'b11111;
        Rb = 5'b00001;
        #10;

        $stop;
    end
endmodule