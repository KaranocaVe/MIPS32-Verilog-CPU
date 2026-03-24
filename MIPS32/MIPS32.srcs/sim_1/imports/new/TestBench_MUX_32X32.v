`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 23:37:55
// Design Name: 
// Module Name: TestBench_MUX_32X32
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


module TestBench_MUX_32X32;

    reg [31:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31;

    reg [4:0] sel;

    wire [31:0] y;

    MUX_32X32 uut(
        .Data0(data0),.Data1(data1),.Data2(data2),.Data3(data3),.Data4(data4),.Data5(data5),.Data6(data6),.Data7(data7),.Data8(data8),.Data9(data9),.Data10(data10),.Data11(data11),.Data12(data12),.Data13(data13),.Data14(data14),.Data15(data15),.Data16(data16),.Data17(data17),.Data18(data18),.Data19(data19),.Data20(data20),.Data21(data21),.Data22(data22),.Data23(data23),.Data24(data24),.Data25(data25),.Data26(data26),.Data27(data27),.Data28(data28),.Data29(data29),.Data30(data30),.Data31(data31),
        .Select(sel),
        .Y(y)
    );

    initial begin
        data0=32'h1;
        data1=32'h2;
        data2=32'h3;
        data3=32'h4;
        data4=32'h5;
        data5=32'h6;
        data6=32'h7;
        data7=32'h8;
        data8=32'h9;
        data9=32'hA;
        data10=32'hB;
        data11=32'hC;
        data12=32'hD;
        data13=32'hE;
        data14=32'hF;
        data15=32'h10;
        data16=32'h11;
        data17=32'h12;
        data18=32'h13;
        data19=32'h14;
        data20=32'h15;
        data21=32'h16;
        data22=32'h17;
        data23=32'h18;
        data24=32'h19;
        data25=32'h1A;
        data26=32'h1B;
        data27=32'h1C;
        data28=32'h1D;
        data29=32'h1E;
        data30=32'h1F;
        data31=32'h20;
        sel=5'b00000;
        #10;
        sel=5'b00001;
        #10;
        sel=5'b00010;
        #10;
        sel=5'b00011;
        #10;
        sel=5'b00100;
        #10;
        sel=5'b00101;
        #10;
        sel=5'b00110;
        #10;
        sel=5'b00111;
        #10;
        sel=5'b01000;
        #10;
        sel=5'b01001;
        #10;
        sel=5'b01010;
        #10;
        sel=5'b01011;
        #10;
        sel=5'b01100;
        #10;
        sel=5'b01101;
        #10;
        sel=5'b01110;
        #10;
        sel=5'b01111;
        #10;
        sel=5'b10000;
        #10;
        sel=5'b10001;
        #10;
        sel=5'b10010;
        #10;
        sel=5'b10011;
        #10;
        sel=5'b10100;
        #10;
        sel=5'b10101;
        #10;
        sel=5'b10110;
        #10;
        sel=5'b10111;
        #10;
        sel=5'b11000;
        #10;
        sel=5'b11001;
        #10;
        sel=5'b11010;
        #10;
        sel=5'b11011;
        #10;
        sel=5'b11100;
        #10;
        sel=5'b11101;
        #10;
        sel=5'b11110;
        #10;
        sel=5'b11111;
        #10;
        $finish;
    end

endmodule
