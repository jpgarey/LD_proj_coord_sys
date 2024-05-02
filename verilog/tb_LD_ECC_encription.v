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


module tb_LD_ECC_encription;

  // Parameters
  parameter N = 3;
  parameter d = 4;
  parameter r = 3;

  // Signals
    reg clk;
    reg reset;
    reg [N-1:0] x_Plaintext;
    reg [N-1:0] y_Plaintext;
    reg [N-1:0] z_Plaintext;
    wire  [N-1:0] x_Plaintext_out;
    wire  [N-1:0] y_Plaintext_out;
    wire  [N-1:0] z_Plaintext_out;
    wire process_done;
  // Instantiate the module under test
  LD_ECC_encription #(
        .N(N),
        .ds(d),
        .r(r)
    )
    dut (
    .clk(clk),
    .reset(reset),
    .x_Plaintext(x_Plaintext),
    .y_Plaintext(y_Plaintext),
    .z_Plaintext(z_Plaintext),
    .x_Plaintext_out(x_Plaintext_out),
    .y_Plaintext_out(y_Plaintext_out),
    .z_Plaintext_out(z_Plaintext_out),
    .process_done(process_done)
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
    // plain text is P = ((X+1) , (X+1))
    x_Plaintext = 3'b011;
    y_Plaintext = 3'b011;
    z_Plaintext = 3'b001;


    #4000000;
    // Add more test cases if needed

    $finish;
  end

endmodule
