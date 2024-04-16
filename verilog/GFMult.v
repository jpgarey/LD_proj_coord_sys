`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 11:13:38 AM
// Design Name: 
// Module Name: GFMult
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


module GFMult(
    input [2:0] A,
    input [2:0] B,
    output [2:0] Z
    );

    MontMult MM(.A(A),.B(B),.G(Z));
endmodule
