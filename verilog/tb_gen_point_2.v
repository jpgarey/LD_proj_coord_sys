module tb_point_gen_2;

    parameter N = 3; // Number of bits
    parameter number_points = 14;

    // Inputs
    reg clk;
    reg reset;
    reg [N-1:0] X0;
    reg [N-1:0] Y0;
    reg [N-1:0] Z0;
    // Outputs
    wire [N-1:0] X1;
    wire [N-1:0] Y1;
    wire [N-1:0] Z1;
    
    // Instantiate the module under test with parameters
    point_gen #(
        .N(N),
        .number_points(number_points)
    ) dut (
        .clk(clk),
        .reset(reset),
        .X0(X0),
        .Y0(Y0),
        .Z0(Z0),
        .X1(X1),
        .Y1(Y1),
        .Z1(Z1)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        X0 = 3'b110;
        Y0 = 3'b001;
        Z0 = 3'b001;
        
        // Wait for a few clock cycles
        #10;
        
        // De-assert reset
        reset = 0;
        
        // Generate clock with 50% duty cycle
        forever begin
            #5;
            clk = ~clk;
        end
    end

    initial begin
        // Monitor the outputs
        $display("Time\tX1\tY1\tZ1");
        $monitor("%0t\t%b\t%b\t%b", $time, X1, Y1, Z1);
        // Adjusted the simulation time based on the number of points
        #((number_points + 1) * 35);
        
        $finish;
    end

endmodule
