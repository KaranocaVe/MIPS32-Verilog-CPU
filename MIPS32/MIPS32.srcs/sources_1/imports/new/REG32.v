`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 00:01:05
// Design Name: 
// Module Name: REG32
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


module REG32(
    input [31:0] Data,
    input [31:0] En,
    input Clk,
    input Clrn,
    output [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31
    );

    assign Q0 = 0;

    D_FFEC32 DFF1(.D(Data), .En(En[1]), .Clk(Clk), .Clrn(Clrn), .Q(Q1));
    D_FFEC32 DFF2(.D(Data), .En(En[2]), .Clk(Clk), .Clrn(Clrn), .Q(Q2));
    D_FFEC32 DFF3(.D(Data), .En(En[3]), .Clk(Clk), .Clrn(Clrn), .Q(Q3));
    D_FFEC32 DFF4(.D(Data), .En(En[4]), .Clk(Clk), .Clrn(Clrn), .Q(Q4));
    D_FFEC32 DFF5(.D(Data), .En(En[5]), .Clk(Clk), .Clrn(Clrn), .Q(Q5));
    D_FFEC32 DFF6(.D(Data), .En(En[6]), .Clk(Clk), .Clrn(Clrn), .Q(Q6));
    D_FFEC32 DFF7(.D(Data), .En(En[7]), .Clk(Clk), .Clrn(Clrn), .Q(Q7));
    D_FFEC32 DFF8(.D(Data), .En(En[8]), .Clk(Clk), .Clrn(Clrn), .Q(Q8));
    D_FFEC32 DFF9(.D(Data), .En(En[9]), .Clk(Clk), .Clrn(Clrn), .Q(Q9));
    D_FFEC32 DFF10(.D(Data), .En(En[10]), .Clk(Clk), .Clrn(Clrn), .Q(Q10));
    D_FFEC32 DFF11(.D(Data), .En(En[11]), .Clk(Clk), .Clrn(Clrn), .Q(Q11));
    D_FFEC32 DFF12(.D(Data), .En(En[12]), .Clk(Clk), .Clrn(Clrn), .Q(Q12));
    D_FFEC32 DFF13(.D(Data), .En(En[13]), .Clk(Clk), .Clrn(Clrn), .Q(Q13));
    D_FFEC32 DFF14(.D(Data), .En(En[14]), .Clk(Clk), .Clrn(Clrn), .Q(Q14));
    D_FFEC32 DFF15(.D(Data), .En(En[15]), .Clk(Clk), .Clrn(Clrn), .Q(Q15));
    D_FFEC32 DFF16(.D(Data), .En(En[16]), .Clk(Clk), .Clrn(Clrn), .Q(Q16));
    D_FFEC32 DFF17(.D(Data), .En(En[17]), .Clk(Clk), .Clrn(Clrn), .Q(Q17));
    D_FFEC32 DFF18(.D(Data), .En(En[18]), .Clk(Clk), .Clrn(Clrn), .Q(Q18));
    D_FFEC32 DFF19(.D(Data), .En(En[19]), .Clk(Clk), .Clrn(Clrn), .Q(Q19));
    D_FFEC32 DFF20(.D(Data), .En(En[20]), .Clk(Clk), .Clrn(Clrn), .Q(Q20));
    D_FFEC32 DFF21(.D(Data), .En(En[21]), .Clk(Clk), .Clrn(Clrn), .Q(Q21));
    D_FFEC32 DFF22(.D(Data), .En(En[22]), .Clk(Clk), .Clrn(Clrn), .Q(Q22));
    D_FFEC32 DFF23(.D(Data), .En(En[23]), .Clk(Clk), .Clrn(Clrn), .Q(Q23));
    D_FFEC32 DFF24(.D(Data), .En(En[24]), .Clk(Clk), .Clrn(Clrn), .Q(Q24));
    D_FFEC32 DFF25(.D(Data), .En(En[25]), .Clk(Clk), .Clrn(Clrn), .Q(Q25));
    D_FFEC32 DFF26(.D(Data), .En(En[26]), .Clk(Clk), .Clrn(Clrn), .Q(Q26));
    D_FFEC32 DFF27(.D(Data), .En(En[27]), .Clk(Clk), .Clrn(Clrn), .Q(Q27));
    D_FFEC32 DFF28(.D(Data), .En(En[28]), .Clk(Clk), .Clrn(Clrn), .Q(Q28));
    D_FFEC32 DFF29(.D(Data), .En(En[29]), .Clk(Clk), .Clrn(Clrn), .Q(Q29));
    D_FFEC32 DFF30(.D(Data), .En(En[30]), .Clk(Clk), .Clrn(Clrn), .Q(Q30));
    D_FFEC32 DFF31(.D(Data), .En(En[31]), .Clk(Clk), .Clrn(Clrn), .Q(Q31));

endmodule
