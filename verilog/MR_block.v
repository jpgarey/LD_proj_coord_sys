`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2024 09:29:19 PM
// Design Name: 
// Module Name: MRMult
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


module MR_block(
    input [2:0] A,
    input [2:0] B,
    output [2:0] G
    );

    reg [3:0] G_temp;
    wire [3:0] P_x;
    assign P_x = 4'b1101; //A3 + A2 + 1
    
    always @* begin
    //unrolling loop from 0 to k-1 = 2
    // i = 0
    G_temp = 0;
    G_temp =  G_temp ^ ({3{A[0]}} & B);
    G_temp = G_temp ^ ({4{G_temp[0]}} & P_x);
    G_temp = G_temp >> 1;

    // i = 1
    G_temp =  G_temp ^ ({3{A[1]}} & B);
    G_temp = G_temp ^ ({4{G_temp[0]}} & P_x);
    G_temp = G_temp >> 1;

    // i = 2
    G_temp =  G_temp ^ ({3{A[2]}} & B);
    G_temp = G_temp ^ ({4{G_temp[0]}} & P_x);
    G_temp = G_temp >> 1;
end

assign G = G_temp[2:0];


endmodule
