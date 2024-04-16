`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2024 11:15:24 PM
// Design Name: 
// Module Name: tb_MontMult
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


module tb_MontMult;

    // Parameters
    parameter N = 3; // Number of bits
    
    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;
    
    // Outputs
    reg [N-1:0] Z_expected;
    wire [N-1:0] Z_actual;
    
    // Instantiate the module under test
    MontMult dut (
        .A(A),
        .B(B),
        .G(Z_actual)
    );
    
    // Generate all possible combinations of inputs
    integer i,j,k,verilog_output;
    
   // Define a lookup table for polynomial results
   reg [2:0] result [63:0];
       
       initial begin
        //0        
        result[0] = 3'b000;
        //0 
        result[1] = 3'b000;
        //0 
        result[2] = 3'b000;
        //0 
        result[3] = 3'b000;
        //0 
        result[4] = 3'b000;
        //0 
        result[5] = 3'b000;
        //0 
        result[6] = 3'b000;
        //0 
        result[7] = 3'b000;
        //0 
        result[8] = 3'b000;
        //1 
        result[9] = 3'b001;
        //(A) 
        result[10] = 3'b010;
        //(A+1) 
        result[11] = 3'b011;
        //(A2) 
        result[12] = 3'b100;
        //(A2+1) 
        result[13] = 3'b101;
        //(A2+A) 
        result[14] = 3'b110;
        //(A2+A+1) 
        result[15] = 3'b111;
        //0 
        result[16] = 3'b000;
        //(A) 
        result[17] = 3'b010;
        //(A2) 
        result[18] = 3'b100;
        //(A2+A) 
        result[19] = 3'b110;
        //(A2+1) 
        result[20] = 3'b101;
        //(A2+A+1) 
        result[21] = 3'b111;
        //1 
        result[22] = 3'b001;
        //(A+1) 
        result[23] = 3'b011;
        //0 
        result[24] = 3'b000;
        //(A+1) 
        result[25] = 3'b011;
        //(A2+A) 
        result[26] = 3'b110;
        //(A2+1) 
        result[27] = 3'b101;
        //(1) 
        result[28] = 3'b001;
        //(A) 
        result[29] = 3'b010;
        //(A2+A+1) 
        result[30] = 3'b111;
        //A2 
        result[31] = 3'b100;
        //0 
        result[32] = 3'b000;
        //(A2) 
        result[33] = 3'b100;
        //(A2+1) 
        result[34] = 3'b101;
        //(1) 
        result[35] = 3'b001;
        //(A2+A+1) 
        result[36] = 3'b111;
        //(A+1) 
        result[37] = 3'b011;
        //(A) 
        result[38] = 3'b010;
        //(A2+A) 
        result[39] = 3'b110;
        //0 
        result[40] = 3'b000;
        //(A2+1) 
        result[41] = 3'b101;
        //(A2+A+1) 
        result[42] = 3'b111;
        //(A) 
        result[43] = 3'b010;
        //(A+1) 
        result[44] = 3'b011;
        //(A2+A) 
        result[45] = 3'b110;
        //(A2) 
        result[46] = 3'b100;
        //1 
        result[47] = 3'b001;
        //0 
        result[48] = 3'b000;
        //(A2+A) 
        result[49] = 3'b110;
        //1 
        result[50] = 3'b001;
        //(A2+A+1) 
        result[51] = 3'b111;
        //(A) 
        result[52] = 3'b010;
        //(A2) 
        result[53] = 3'b100;
        //(A+1) 
        result[54] = 3'b011;
        //(A2+1) 
        result[55] = 3'b101;
        //0 
        result[56] = 3'b000;
        //(A2+A+1) 
        result[57] = 3'b111;
        //(A+1) 
        result[58] = 3'b011;
        //A2 
        result[59] = 3'b100;
        //(A2+A) 
        result[60] = 3'b110;
        //1 
        result[61] = 3'b001;
        //(A2+1) 
        result[62] = 3'b101;
        //(A) 
        result[63] = 3'b010;

end
    

    initial begin
        // Exhaustive testing
        verilog_output = $fopen("C:/Users/18019/Documents/UofU/SPRING2024/HWSecurity/HW/hw2/verilog/MRMult/MRMult.srcs/sources_1/new/MontMult_output.txt", "w");
        k = 0;
        for (i = 0; i < 2**N; i = i + 1) begin
            for (j = 0; j < 2**N; j = j + 1) begin
                // Assign input values
                A = i;
                B = j;
                
                Z_expected = result[k];
                $display(k);
                // Wait some time for the output to stabilize
                #10;
                // Display actual
                $display("Input: A=%b, B=%b, Expected output:%b ,Actual Output: Z=%b", A, B,Z_expected, Z_actual);
                $fwrite(verilog_output,"Input: A=%b, B=%b, Expected output:%b ,Actual Output: Z=%b \n", A, B,Z_expected, Z_actual);
                $display("%b",Z_expected);
                // Check if the actual output matches the expected output
                if (Z_actual !== Z_expected) begin
                    $display("ERROR: expected Output: Z=%b Actual Output: Z=%b",Z_expected, Z_actual);
                //     // You can add further actions here; like stopping the simulation or logging the failure
                // end
                
            end
            k = k + 1;
        end
        
        // End the simulation after all tests are completed
    
    end

    $fclose(verilog_output);

    end


endmodule
