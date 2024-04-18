`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 05:01:36 PM
// Design Name: 
// Module Name: tb_pointAddition
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


module tb_pointAddition;

    parameter N = 3; // Number of bits
    
    // Inputs
    reg [N-1:0] X0,Y0,Z0,X1,Y1,Z1;
    
    // Outputs
    wire [N-1:0] X2,Y2,Z2;
    integer verilog_output;

    
    // Instantiate the module under test
    pointAddition dut (
        .X0(X0),
        .Y0(Y0),
        .Z0(Z0),
        .X1(X1),
        .Y1(Y1),
        .Z1(Z1),
        .X2(X2),
        .Y2(Y2),
        .Z2(Z2)
    );

    initial  begin
        verilog_output = $fopen("C:/Users/18019/Documents/UofU/SPRING2024/HWSecurity/HW/Project/pointAdditionLD.txt", "w");
        if (verilog_output == 0) begin
            $display("Error: Failed to open file.");
            $finish;
        end

        // adding P + 2P = ((X2+X), 1) + ((X2+X+1), (X)) = ((X+1), 0) 3P
        X0 = 3'b110;
        Y0 = 3'b001;
        Z0 = 3'b001; 
        X1 = 3'b111;
        Y1 = 3'b010;
        Z1 = 3'b001; 
        #10;
        $fwrite(verilog_output, "X0 = %b, Y0 = %b Z0 = %b\n",X0,Y0,Z0);
        $fwrite(verilog_output, "X1 = %b, Y1 = %b Z1 = %b\n",X1,Y1,Z1);
        $fwrite(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);
        $monitor(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);

        #10; // ((X2+X+1), (X2+1)) + ((X2+X), 1) = ((X2+X), (X2+X+1))
        X0 = 3'b110;
        Y0 = 3'b001;
        Z0 = 3'b001; 
        X1 = 3'b111;
        Y1 = 3'b101;
        Z1 = 3'b001; 
        #10;
        $fwrite(verilog_output, "X0 = %b, Y0 = %b Z0 = %b\n",X0,Y0,Z0);
        $fwrite(verilog_output, "X1 = %b, Y1 = %b Z1 = %b\n",X1,Y1,Z1);
        $fwrite(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);
        $monitor(verilog_output, "X2 = %b, Y2 = %b Z2 = %b\n",X2,Y2,Z2);
        $fclose(verilog_output);
    end

endmodule
