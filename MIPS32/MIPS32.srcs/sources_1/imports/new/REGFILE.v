`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 13:18:40
// Design Name: 
// Module Name: REGFILE
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


module REGFILE(
    input [4:0] Ra,Rb,Wr,
    input [31:0] D,
    input We,Clk,Clrn,
    output [31:0] Qa,Qb
    );

    wire [31:0] DECOUT,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31;

    DEC_5T32E dec0(.In(Wr),.En(We),.Out(DECOUT));

    REG32 regheap(.Data(D),.En(DECOUT),.Clk(Clk),.Clrn(Clrn),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.Q8(Q8),.Q9(Q9),.Q10(Q10),.Q11(Q11),.Q12(Q12),.Q13(Q13),.Q14(Q14),.Q15(Q15),.Q16(Q16),.Q17(Q17),.Q18(Q18),.Q19(Q19),.Q20(Q20),.Q21(Q21),.Q22(Q22),.Q23(Q23),.Q24(Q24),.Q25(Q25),.Q26(Q26),.Q27(Q27),.Q28(Q28),.Q29(Q29),.Q30(Q30),.Q31(Q31));

    MUX_32X32 muxA(.Data0(Q0),.Data1(Q1),.Data2(Q2),.Data3(Q3),.Data4(Q4),.Data5(Q5),.Data6(Q6),.Data7(Q7),.Data8(Q8),.Data9(Q9),.Data10(Q10),.Data11(Q11),.Data12(Q12),.Data13(Q13),.Data14(Q14),.Data15(Q15),.Data16(Q16),.Data17(Q17),.Data18(Q18),.Data19(Q19),.Data20(Q20),.Data21(Q21),.Data22(Q22),.Data23(Q23),.Data24(Q24),.Data25(Q25),.Data26(Q26),.Data27(Q27),.Data28(Q28),.Data29(Q29),.Data30(Q30),.Data31(Q31),.Select(Ra),.Y(Qa));

    MUX_32X32 muxB(.Data0(Q0),.Data1(Q1),.Data2(Q2),.Data3(Q3),.Data4(Q4),.Data5(Q5),.Data6(Q6),.Data7(Q7),.Data8(Q8),.Data9(Q9),.Data10(Q10),.Data11(Q11),.Data12(Q12),.Data13(Q13),.Data14(Q14),.Data15(Q15),.Data16(Q16),.Data17(Q17),.Data18(Q18),.Data19(Q19),.Data20(Q20),.Data21(Q21),.Data22(Q22),.Data23(Q23),.Data24(Q24),.Data25(Q25),.Data26(Q26),.Data27(Q27),.Data28(Q28),.Data29(Q29),.Data30(Q30),.Data31(Q31),.Select(Rb),.Y(Qb));

endmodule