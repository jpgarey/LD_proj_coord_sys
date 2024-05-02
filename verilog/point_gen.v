`timescale 1ns / 1ps
module point_gen (
    input wire clk,
    input wire reset,
    input [N-1:0] X0,
    input [N-1:0] Y0,
    input [N-1:0] Z0,
    output reg [N-1:0] X1,
    output reg [N-1:0] Y1,
    output reg [N-1:0] Z1,
    output reg ready
);

    parameter N = 3; // Number of bits
    parameter number_points = 1;
    // Internal registers
    reg [N-1:0] xadd_a,yadd_a,zadd_a,xadd_b,yadd_b,zadd_b,xdbl_i,ydbl_i,zdbl_i;
    wire [N-1:0] xadd_o,yadd_o,zadd_o,xdbl_o,ydbl_o,zdbl_o;
    reg [3:0] state;
    reg [5:0] count;

    // Instantiate the pointAddition and PointDouble modules
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
	 
    PointDouble dut_dbl (
        .X1(xdbl_i),
        .Y1(ydbl_i),
        .Z1(zdbl_i),
        .X2(xdbl_o),
        .Y2(ydbl_o),
        .Z2(zdbl_o)
    );

    // State definitions
    localparam [3:0]
        STATE_INIT = 4'b0000,
        STATE_DOUBLE = 4'b0001,
        STATE_SAVE_ADD = 4'b00100,
        STATE_ADD = 4'b0010,
        STATE_DOUBLE_SET = 4'b00101,
        STATE_READY_POINT = 4'b00111,
        STATE_SAVE_POINT = 4'b01000,
        STATE_INCREMENT = 4'b0011;
        

    always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= STATE_DOUBLE_SET;
        X1 <= X0;
        Y1 <= Y0;
        Z1 <= Z0;
        count <= 1;
        ready <=0;
        
        // Reset xdbl_i to a known value
    end else begin
        if (number_points > 1) begin

            case (state)

                
                STATE_DOUBLE_SET: begin
                    // Trigger PointDouble module
                    X1 <= X0;
                    Y1 <= Y0;
                    Z1 <= Z0;
                    xdbl_i <= 3'b110;
                    ydbl_i <= 3'b001;
                    zdbl_i <= 3'b001;
                    if (count == number_points) begin
                        state <= STATE_DOUBLE_SET;
                    end
                    else begin 
                        count <= count + 1;
                        state <= STATE_DOUBLE;
                    end
                end


                STATE_DOUBLE: begin
                    // Trigger PointDouble module
                    X1 <= xdbl_o; // register output
                    Y1 <= ydbl_o;
                    Z1 <= zdbl_o;
                    
                    
                    if (count == number_points) begin
                        state <= STATE_DOUBLE_SET;
                    end
                    else begin 
                        state <= STATE_SAVE_ADD;
                    end
                end

            
                STATE_SAVE_ADD: begin
                    // Trigger PointAddition module
                    xadd_a <= xdbl_i;
                    yadd_a <= ydbl_i;
                    zadd_a <= zdbl_i;
                    if(Z1 == 0)begin
                        state <= STATE_DOUBLE_SET;
                    end
                    else begin 
                        xadd_b <= X1;
                        yadd_b <= Y1;
                        zadd_b <= Z1;
                        state <= STATE_ADD;
                    end
                end
                STATE_ADD: begin
                    X1 <= xadd_o;
                    Y1 <= yadd_o;
                    Z1 <= zadd_o;
                    state <= STATE_INCREMENT;
                end
                STATE_INCREMENT: begin
                    count <= count + 1;
                    if (count == number_points - 1) begin
                        state <= STATE_SAVE_POINT;
                    end else begin
                        state <= STATE_SAVE_ADD;
                    end
                end
                STATE_SAVE_POINT: begin
                    X1 <= X1;
                    Y1 <= Y1;
                    Z1 <= Z1;
                    ready <= 1;
                    state <= STATE_READY_POINT;
                end

                STATE_READY_POINT: begin
                    ready <= 0;
                    state <= STATE_READY_POINT;
                end

            endcase
        
        end
    end
end


endmodule