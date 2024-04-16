`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 12:23:31 PM
// Design Name: 
// Module Name: GFADD
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


module GFADD(
    input [2:0] A,
    input [2:0] B,
    output [2:0] Z
    );
    assign Z = A ^ B;
endmodule
