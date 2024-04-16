`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Authors: Jared Garey & Cristian Tapiero 
// 
// Create Date: 04/16/2024
// Design Name: 
// Module Name: PointDouble
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


module PointDouble(
    input [2:0] X1,
    input [2:0] Y1,
    input [2:0] Z1,
    output [2:0] X2,
    output [2:0] Y2,
    output [2:0] Z2
    );

    wire [2:0] z1_2,z1_4,b_z1_4;
    wire[2:0] x1_2,x1_4;
    wire[2:0] y1_2,b_z1_4_Z2,y1_2_b_z1_4,a_Z2;
    wire[2:0] a_Z2_y1_2_b_z1_4,X2_a_Z2_y1_2_b_z1_4;
    // wire [2:0] x1_4_A;

    //******************** Z2 **********************
    //calculating Z1^2
    GFSQR GFSQR1(.A(Z1),.SQR(z1_2));
    //calculating X1^2
    GFSQR GFSQR2(.A(X1),.SQR(x1_2));
    //multiply Z2 = Z1^2 * X1^2 
    GFMult GFMultx(.A(z1_2),.B(x1_2),.Z(Z2));

    //******************** X2 **********************
    //calculating x1^4
    GFSQR GFSQR3(.A(x1_2),.SQR(x1_4));
    //calculating Z1^4
    GFSQR GFSQR4(.A(z1_2),.SQR(z1_4));
    //calculating b*z1^4, b = 1
    GFMult GFMult1(.A(3'b001),.B(z1_4),.Z(b_z1_4));
    //adding X2 = b*z1^4 + x1_4 ******** X2
    GFADD GFADD2(.A(b_z1_4),.B(x1_4),.Z(X2));

    //******************** Y2 **********************
    //Multiplying b*z1^4 * Z2
    GFMult GFMult2(.A(b_z1_4),.B(Z2),.Z(b_z1_4_Z2));
    //calculating y1^2
    GFSQR GFSQR5(.A(Y1),.SQR(y1_2));
    // adding y1_2 + b*z1^4 
    GFADD GFADD3(.A(b_z1_4),.B(y1_2),.Z(y1_2_b_z1_4));
    // multiplying a*Z2, a = X^2 in GF so 3b'100 
    GFMult GFMult3(.A(3'b100),.B(Z2),.Z(a_Z2));
    // adding  a*Z2  +  y1_2 + b*z1^4
    GFADD GFADD4(.A(a_Z2),.B(y1_2_b_z1_4),.Z(a_Z2_y1_2_b_z1_4));
    // multiplying a_Z2_y1_2_b_z1_4 * X2
    GFMult GFMult4(.A(a_Z2_y1_2_b_z1_4),.B(X2),.Z(X2_a_Z2_y1_2_b_z1_4));
    // Adding a_Z2_y1_2_b_z1_4 * X2 + b*z1^4 * Z2 
    GFADD GFADD5(.A(b_z1_4_Z2),.B(X2_a_Z2_y1_2_b_z1_4),.Z(Y2));







    










   

endmodule
