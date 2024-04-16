`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2024 10:24:44 PM
// Design Name: 
// Module Name: MontMult
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


module MontMult(
    input [2:0] A,
    input [2:0] B,
    output [2:0] G
    );
    wire [2:0] R2;
    assign R2 = 3'b110;
    wire [2:0] A_R,B_R,A_B_R;
    MR_block MR_1(.A(A),.B(R2),.G(A_R));
    MR_block MR_2(.A(R2),.B(B),.G(B_R));
    MR_block MR_3(.A(A_R),.B(B_R),.G(A_B_R));
    MR_block MR_4(.A(A_B_R),.B(3'b001),.G(G));

endmodule
