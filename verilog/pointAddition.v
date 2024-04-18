`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 03:39:14 PM
// Design Name: 
// Module Name: pointAddition
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


module pointAddition(
    input [2:0] X0,
    input [2:0] Y0,
    input [2:0] Z0,
    input [2:0] X1,
    input [2:0] Y1,
    input [2:0] Z1,
    output [2:0] X2,
    output [2:0] Y2,
    output [2:0] Z2
    );

    wire[2:0] A0,A1,B0,B1,C,D,E,F,G,H,I,J;
    wire[2:0] z0_2,z1_2,e_2,a_e_2,f_a_e_2;
    wire[2:0] d_2,c_2,c_2_H,d2_b0_E,d2_b0,d2_a0,H_I,Z2_J;

    //*********************A0***********************
    GFSQR GFSQR1(.A(Z0),.SQR(z0_2));
    GFMult GFMult1(.A(Y1),.B(z0_2),.Z(A0));

    //*********************A1***********************
    GFSQR GFSQR2(.A(Z1),.SQR(z1_2));
    GFMult GFMult2(.A(Y0),.B(z1_2),.Z(A1));

    //*********************B0***********************
    GFMult GFMult3(.A(X1),.B(Z0),.Z(B0));

    //*********************B1***********************
    GFMult GFMult4(.A(X0),.B(Z1),.Z(B1));
    
    //*********************C***********************
    GFADD GFADD1(.A(A0),.B(A1),.Z(C));

    //*********************D***********************
    GFADD GFADD2(.A(B0),.B(B1),.Z(D));
    
    //*********************E***********************
    GFMult GFMult5(.A(Z0),.B(Z1),.Z(E));

    //*********************F***********************
    GFMult GFMult6(.A(D),.B(E),.Z(F));

    //*********************Z2***********************
    GFSQR GFSQR3(.A(F),.SQR(Z2));

    //*********************G***********************
    GFSQR GFSQR4(.A(E),.SQR(e_2));
    GFMult GFMult7(.A(3'b100),.B(e_2),.Z(a_e_2));
    GFADD GFADD3(.A(F),.B(a_e_2),.Z(f_a_e_2));
    GFSQR GFSQR5(.A(D),.SQR(d_2));
    GFMult GFMult8(.A(d_2),.B(f_a_e_2),.Z(G));

    //*********************H***********************
    GFMult GFMult9(.A(C),.B(F),.Z(H));

    //*********************X2**********************
    GFSQR GFSQR6(.A(C),.SQR(c_2));
    GFADD GFADD4(.A(c_2),.B(H),.Z(c_2_H));
    GFADD GFADD5(.A(c_2_H),.B(G),.Z(X2));

     //*********************I********************** 
    GFMult GFMult10(.A(d_2),.B(B0),.Z(d2_b0));
    GFMult GFMult11(.A(d2_b0),.B(E),.Z(d2_b0_E));
    GFADD GFADD6(.A(d2_b0_E),.B(X2),.Z(I));

    //*********************J**********************
    GFMult GFMult12(.A(d_2),.B(A0),.Z(d2_a0));
    GFADD GFADD7(.A(d2_a0),.B(X2),.Z(J));

    //*********************Y2**********************
    GFMult GFMult13(.A(H),.B(I),.Z(H_I));
    GFMult GFMult14(.A(Z2),.B(J),.Z(Z2_J));
    GFADD GFADD8(.A(H_I),.B(Z2_J),.Z(Y2));




    


    












endmodule
