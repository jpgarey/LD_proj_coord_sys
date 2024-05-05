`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 11:54:54 AM
// Design Name: 
// Module Name: Encryption
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


module Encryption(
    input wire clk,
    input wire reset,
    input [N-1:0] x_Plaintext,
    input [N-1:0] y_Plaintext,
    input [N-1:0] z_Plaintext,
    input [N-1:0] e1_X0,
    input [N-1:0] e1_Y0,
    input [N-1:0] e1_Z0,
    output  [N-1:0] x_C1,
    output  [N-1:0] y_C1,
    output  [N-1:0] z_C1,
    output  [N-1:0] x_C2,
    output  [N-1:0] y_C2,
    output  [N-1:0] z_C2,
    output reg Encryption_complete

    );

    parameter N = 3; // Number of bits
    parameter d = 4;
    parameter r = 3;
    wire [N-1:0] e2_X1,e2_Y1,e2_Z1,r_e2_X1,r_e2_Y1,r_e2_Z1;
    wire ready_e2,ready_c1,ready_r_e2;
    reg reset_r_e2;
    

    point_gen #(
        .N(N),
        .number_points(d)
    ) e2 (
        .clk(clk),
        .reset(reset),
        .X0(e1_X0),
        .Y0(e1_Y0),
        .Z0(e1_Z0),
        .X1(e2_X1),
        .Y1(e2_Y1),
        .Z1(e2_Z1),
        .ready(ready_e2)
    );

    point_gen #(
        .N(N),
        .number_points(r)
    ) c1 (
        .clk(clk),
        .reset(reset),
        .X0(e1_X0),
        .Y0(e1_Y0),
        .Z0(e1_Z0),
        .X1(x_C1),
        .Y1(y_C1),
        .Z1(z_C1),
        .ready(ready_c1)
    );

    //point_gen #( // TODO: replace with ponit double and point add stuff.
    //    .N(N),
    //    .number_points(d*r)
    //) r_e2 (
    //    .clk(clk),
    //    .reset(reset_r_e2),
    //    .X0(e2_X1),
    //    .Y0(e2_Y1),
    //    .Z0(e2_Z1),
    //    .X1(r_e2_X1),
    //    .Y1(r_e2_Y1),
    //    .Z1(r_e2_Z1),
    //    .ready(ready_r_e2)
    //);

    pointAddition c2 (
        .X0(x_Plaintext),
        .Y0(y_Plaintext),
        .Z0(z_Plaintext),
        .X1(r_e2_X1),
        .Y1(r_e2_Y1),
        .Z1(r_e2_Z1),
        .X2(x_C2),
        .Y2(y_C2),
        .Z2(z_C2)
    );

    always @(posedge clk or posedge reset or posedge reset_r_e2) begin
    
        // Activate reset_r_e2 based on ready_e2 signal
        if (ready_e2) begin
            reset_r_e2 <= 1;
        end else begin
            reset_r_e2 <= 0;
            end
        if (ready_r_e2) begin
            Encryption_complete <= 1;
        end else begin
            Encryption_complete <= 0;
            
        end
    end





endmodule
