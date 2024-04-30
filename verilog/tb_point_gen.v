`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 05:01:36 PM
// Design Name: 
// Module Name: tb_point_gen
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

module tb_point_gen;

    parameter N = 3; // Number of bits
    
    // Inputs
    reg [N-1:0] X0,Y0,Z0,xadd_a,yadd_a,zadd_a,xadd_b,yadd_b,zadd_b,xdbl_i,ydbl_i,zdbl_i,X1,Y1,Z1;
    
    // Outputs
    wire [N-1:0] xadd_o,yadd_o,zadd_o,xdbl_o,ydbl_o,zdbl_o;
    integer verilog_output, i;

    
    // Instantiate the module under test
    pointAddition dut_add (
        .X0(xadd_a),
        .Y0(yadd_a),
        .Z0(zadd_a),
        .X1(xadd_b),
        .Y1(yadd_b),
        .Z1(zadd_b),
        .X2(xadd_o),
        .Y2(yadd_o),
        .Z2(zadd_o)
    );
	 
	 // Instantiate the module under test
    PointDouble dut_dbl (
        .X1(xdbl_i),
        .Y1(ydbl_i),
        .Z1(zdbl_i),
        .X2(xdbl_o),
        .Y2(ydbl_o),
        .Z2(zdbl_o)
    );

    initial  begin
        verilog_output = $fopen("C:/Users/Jared Garey/Desktop/ECE6920_HwSecurity/LD_proj_coord_sys/point_gen.txt", "w");
        if (verilog_output == 0) begin
            $display("Error: Failed to open file.");
            $finish;
        end

        X0 = 3'b101;
        Y0 = 3'b001;
        Z0 = 3'b001;
		  
        X0 = 3'b110;
        Y0 = 3'b001;
        Z0 = 3'b001;
        #10;
		  $fwrite(verilog_output, "Starting Point (X0,Y0,Z0)=(%b,%b,%b)\n",X0,Y0,Z0);

		  for (i = 1; i < 15; i = i + 1) begin
				
		      if (i == 1) begin // Point double
					xdbl_i = X0;
					ydbl_i = Y0;
					zdbl_i = Z0;
					#10;
					X1 = xdbl_o; // register output
					Y1 = ydbl_o;
					Z1 = zdbl_o;
					#10;
			   end else begin    // Point add
					xadd_a = X1;
					yadd_a = Y1;
					zadd_a = Z1;
					xadd_b = X0;
					yadd_b = Y0;
					zadd_b = Z0;
					#10;
					X1 = xadd_o; // register output
					Y1 = yadd_o;
					Z1 = zadd_o;
					#10;
			   end
				#10;
				$fwrite(verilog_output, "P(%d)=(X,Y,Z)=(%b,%b,%b)\n",i,X1,Y1,Z1);
		  end
		  
        $fclose(verilog_output);
    end

endmodule
