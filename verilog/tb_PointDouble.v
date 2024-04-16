`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 01:44:22 PM
// Design Name: 
// Module Name: tb_PointDouble
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


module tb_PointDouble;

// Parameters
    parameter N = 3; // Number of bits
    
    // Inputs
    reg [N-1:0] X1,Y1,Z1;
    
    // Outputs
    wire [N-1:0] X2,Y2,Z2;
    integer verilog_output;

    
    // Instantiate the module under test
    PointDouble dut (
        .X1(X1),
        .Y1(Y1),
        .Z1(Z1),
        .X2(X2),
        .Y2(Y2),
        .Z2(Z2)
    );

    initial  begin
        verilog_output = $fopen("C:/Users/18019/Documents/UofU/SPRING2024/HWSecurity/HW/Project/pointDoubleOutLD.txt", "w");
        if (verilog_output == 0) begin
            $display("Error: Failed to open file.");
            $finish;
        end
        X1 = 3'b010;
        Y1 = 3'b001;
        Z1 = 3'b001; 
        #10;
        $fwrite(verilog_output, "X1 = %b, Y1 = %b Z1 = %b\n",X1,Y1,Z1);
        $fwrite(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);
        $monitor(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);


        #10;
        X1 = 3'b111;
        Y1 = 3'b011;
        Z1 = 3'b001; 
        #20;
        $fwrite(verilog_output, "X1 = %b, Y1 = %b Z1 = %b\n",X1,Y1,Z1);
        $fwrite(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);
        $monitor(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);


        $fclose(verilog_output);
    end

    
endmodule
