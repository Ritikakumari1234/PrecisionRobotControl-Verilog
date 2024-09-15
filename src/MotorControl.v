module MotorControl(input clk, input [1:0] direction, output reg left_pwm, output reg right_pwm);
    reg [7:0] pwm_counter;

    always @(posedge clk) begin
        pwm_counter <= pwm_counter + 1;

        case (direction)
            2'b00: begin
                left_pwm <= 0;
                right_pwm <= 0;
            end
            2'b01: begin
                left_pwm <= (pwm_counter < 128);  // Forward movement
                right_pwm <= (pwm_counter < 128);
            end
            2'b10: begin
                left_pwm <= 0;  // Turn left, stop left motor
                right_pwm <= (pwm_counter < 128);
            end
            2'b11: begin
                left_pwm <= (pwm_counter < 128);  // Turn right, stop right motor
                right_pwm <= 0;
            end
        endcase
    end
endmodule
