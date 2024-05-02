`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 02:07:48 PM
// Design Name: 
// Module Name: LD_ECC_encription
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


module LD_ECC_encription(
    input wire clk,
    input wire reset,
    input [N-1:0] x_Plaintext,
    input [N-1:0] y_Plaintext,
    input [N-1:0] z_Plaintext,
    output  [N-1:0] x_Plaintext_out,
    output  [N-1:0] y_Plaintext_out,
    output  [N-1:0] z_Plaintext_out,
    output process_done
    );

      // Parameters
    parameter N = 3;
    parameter d = 4;
    parameter r = 3;

    wire [N-1:0] x_C1,y_C1,z_C1,x_C2,y_C2,z_C2;
    reg reset_decrypt;

    Encryption #(
        .N(N),
        .ds(d),
        .r(r)
    )Encrypt (
    .clk(clk),
    .reset(reset),
    .x_Plaintext(x_Plaintext),
    .y_Plaintext(y_Plaintext),
    .z_Plaintext(z_Plaintext),
    .e1_X0(e1_X0),
    .e1_Y0(e1_Y0),
    .e1_Z0(e1_Z0),
    .x_C1(x_C1),
    .y_C1(y_C1),
    .z_C1(z_C1),
    .x_C2(x_C2),
    .y_C2(y_C2),
    .z_C2(z_C2),
    .Encryption_complete(Encryption_complete)
  );

    Decryption #(
        .N(N),
        .ds(d),
        .r(r) 
  ) Decrypt (
    .clk(clk),
    .reset(reset_decrypt),
    .x_C1(x_C1),
    .y_C1(y_C1),
    .z_C1(z_C1),
    .x_C2(x_C2),
    .y_C2(y_C2),
    .z_C2(z_C2),
    .x_Plaintext(x_Plaintext_out),
    .y_Plaintext(y_Plaintext_out),
    .z_Plaintext(z_Plaintext_out),
    .Decryption_ready(process_done)
  );

  always @(posedge clk or posedge reset or posedge reset_decrypt) begin
    
        // Activate reset_r_e2 based on ready_e2 signal
        if (Encryption_complete) begin
            reset_decrypt <= 1;
        end else begin
            reset_decrypt <= 0;
            end
        
    end

endmodule
