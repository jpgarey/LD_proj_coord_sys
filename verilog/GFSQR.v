`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 12:19:38 PM
// Design Name: 
// Module Name: GFSQR
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


module GFSQR(
    input [2:0] A,
    output [2:0] SQR
    );

    GFMult JFM(.A(A),.B(A),.Z(SQR));
endmodule
