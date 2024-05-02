`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 12:12:06 PM
// Design Name: 
// Module Name: tb_Encryption
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
module Encryption_tb;

  // Parameters
  parameter N = 3;
  parameter d = 4;
  parameter r = 3;

  // Signals
  reg clk;
  reg reset;
  reg [N-1:0] e1_X0;
  reg [N-1:0] e1_Y0;
  reg [N-1:0] e1_Z0;
  reg [N-1:0] x_Plaintext;
  reg [N-1:0]  y_Plaintext;
  reg [N-1:0]  z_Plaintext;
  wire [N-1:0] x_C1,y_C1,z_C1;
  wire [N-1:0] x_C2,y_C2,z_C2;
  wire Encryption_complete;
  // Instantiate the module under test
  Encryption #(
        .N(N),
        .ds(d),
        .r(r)
    )dut (
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

  // Clock generation
  always #5 clk = ~clk;

  // Reset generation
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
  end

  // Stimulus
  initial begin
    // Provide input values here
    e1_X0 = 3'b110;
    e1_Y0 = 3'b001;
    e1_Z0 = 3'b001;
    // plain text is P = ((X2+X), 1)
    x_Plaintext = 3'b011;
    y_Plaintext = 3'b011;
    z_Plaintext = 3'b001;


    #1000;
    // Add more test cases if needed

    $finish;
  end

endmodule
