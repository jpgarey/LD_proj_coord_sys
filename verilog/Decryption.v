`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 11:11:19 AM
// Design Name: 
// Module Name: Decryption
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


module Decryption(
    input wire clk,
    input wire reset,
    input [N-1:0] x_C1,
    input [N-1:0] y_C1,
    input [N-1:0] z_C1,
    input [N-1:0] x_C2,
    input [N-1:0] y_C2,
    input [N-1:0] z_C2,
    output [N-1:0] x_Plaintext,
    output [N-1:0] y_Plaintext,
    output [N-1:0] z_Plaintext,
    output reg Decryption_ready
    );

    parameter N = 3; // Number of bits
    parameter d = 4;
    parameter r = 3;


    wire [N-1:0] d_C1_X1,d_C1_Y1,d_C1_Z1;
    wire ready_dC1;
    reg [N-1:0] inverse_X1,inverse_y1,inverse_Z1;
    
    //point_gen #( // TODO: replace with ponit double and point add stuff.
    //    .N(N),
    //    .number_points(d*r)
    //) d_C1 (
    //    .clk(clk),
    //    .reset(reset),
    //    .X0(x_C1),
    //    .Y0(y_C1),
    //    .Z0(z_C1),
    //    .X1(d_C1_X1),
    //    .Y1(d_C1_Y1),
    //    .Z1(d_C1_Z1),
    //    .ready(ready_dC1)
    //);

    pointAddition c2 (
        .X0(x_C2),
        .Y0(y_C2),
        .Z0(z_C2),
        .X1(inverse_X1),
        .Y1(inverse_y1),
        .Z1(inverse_Z1),
        .X2(x_Plaintext),
        .Y2(y_Plaintext),
        .Z2(z_Plaintext)
    );


    always @(posedge clk or posedge reset ) begin

        if(reset)begin
            inverse_X1 <= 0;
            inverse_y1 <= 0;
            inverse_Z1 <= 0;
            Decryption_ready <= 0;
        end else begin
            if(ready_dC1)begin
            inverse_X1 <= d_C1_X1;
            inverse_y1 = d_C1_X1 ^ d_C1_Y1;
            inverse_y1 = {inverse_y1[N-1:1],1'b0};
            inverse_Z1 <= d_C1_Z1;
            Decryption_ready <= 1;
        end
        
    end

    end
    






endmodule
