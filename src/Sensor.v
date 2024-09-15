module Sensor(input clk, input trigger, input echo, output reg [15:0] distance);
    reg [15:0] timer;

    always @(posedge clk) begin
        if (trigger) begin
            timer <= 0;  // Start timer
        end
        if (echo) begin
            timer <= timer + 1;  // Measure time while echo is high
        end
        distance <= timer * 58; // Convert to distance in cm
    end
endmodule
