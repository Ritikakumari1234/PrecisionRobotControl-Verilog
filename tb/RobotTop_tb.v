module RobotTop_tb;
    reg clk, trigger, echo;
    wire left_pwm, right_pwm;

    // Instantiate the top module
    RobotTop uut(
        .clk(clk),
        .trigger(trigger),
        .echo(echo),
        .left_pwm(left_pwm),
        .right_pwm(right_pwm)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        // Initialize
        trigger = 0;
        echo = 0;

        // Trigger sensor and simulate echo with varying distance
        #10 trigger = 1;  // Trigger ultrasonic sensor
        #20 echo = 1;     // Simulate echo pulse

        #50 echo = 0;     // Echo ends (distance is large, robot moves forward)
        #100 echo = 1;    // Obstacle closer, robot should turn
        #150 echo = 0;

        // Continue simulation
        #300 $finish;     // End simulation after 300 time units
    end

    // Dump waveform for analysis
    initial begin
        $dumpfile("robot_control.vcd");
        $dumpvars(0, RobotTop_tb);
    end
endmodule
