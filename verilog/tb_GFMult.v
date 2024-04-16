`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 11:15:41 AM
// Design Name: 
// Module Name: tb_GFMult
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


module tb_GFMult;

// Parameters
    parameter N = 3; // Number of bits
    
    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;
    
    // Outputs
    reg [N-1:0] Z_expected;
    wire [N-1:0] Z_actual;
    integer verilog_output;
    
    // Instantiate the module under test
    GFMult dut (
        .A(A),
        .B(B),
        .Z(Z_actual)
    );

    initial begin
        verilog_output = $fopen("C:/Users/18019/Documents/UofU/SPRING2024/HWSecurity/HW/hw2/verilog/MRMult/MRMult.srcs/sources_1/new/GFMultOut.txt", "w");
        Z_expected = 3'b101;
        A = 3'b010;
        B = 3'b100;
        #5;
        $display("A=%b , B=%b: Z=%b",A, B,Z_actual);
        $fwrite(verilog_output, "A=%b , B=%b: Z=%b \n",A, B,Z_actual);
        if(Z_actual != Z_expected)begin
        $display("ERROR: expected Output: Z=%b Actual Output: Z=%b",Z_expected, Z_actual);
        end
        #10;
        Z_expected <= 3'b001; //alpha7
        A = 3'b101; // alpha^4 
        B = 3'b111; // alpha ^ 3
        #5;
        $fwrite(verilog_output, "A=%b , B=%b: Z=%b\n",A, B,Z_actual);
        if(Z_actual != Z_expected) begin 
        $display("ERROR: expected Output: Z=%b Actual Output: Z=%b",Z_expected, Z_actual);
        end


        $fclose(verilog_output);
    end

endmodule
