module RobotControl(input clk, input [15:0] distance, output reg [1:0] direction);
    reg [1:0] state;
    parameter FORWARD = 2'b01, LEFT = 2'b10, RIGHT = 2'b11, STOP = 2'b00;

    always @(posedge clk) begin
        case (state)
            STOP: if (distance > 30) state <= FORWARD;
            FORWARD: if (distance < 30) state <= LEFT;
            LEFT: if (distance > 30) state <= FORWARD;
            default: state <= STOP;
        endcase
        direction <= state;
    end
endmodule
