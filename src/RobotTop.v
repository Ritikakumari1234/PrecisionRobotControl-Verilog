module RobotTop(input clk, input trigger, input echo, output left_pwm, output right_pwm);
    wire [15:0] distance;
    wire [1:0] direction;

    // Instantiate sensor, FSM, and motor control modules
    Sensor sensor(clk, trigger, echo, distance);
    RobotControl control(clk, distance, direction);
    MotorControl motor(clk, direction, left_pwm, right_pwm);
endmodule
