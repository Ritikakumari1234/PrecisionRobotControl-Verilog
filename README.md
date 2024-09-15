# PrecisionRobotControl-Verilog

  ## Overview
   This project simulates an autonomous robot control system designed in Verilog, which allows a 
   robot to avoid obstacles using a distance sensor. It uses an ultrasonic sensor module to detect 
   obstacles and then controls motors based on the detected distance through PWM signals. The 
   system operates with a finite state machine (FSM) that directs the robot's movements—moving 
   forward, turning, or stopping.
   
 ## Project Objectives
  1. Simulate a hardware-based robot control system using Verilog.
  2. Detect obstacles using a simulated ultrasonic sensor.
  3. Control motor behavior (move, stop, turn) based on sensor input using PWM.
  4. Verify the system through testbenches and waveform analysis using GTKWave.

## Project Design
The project is broken down into four main components:

   #### 1. Ultrasonic Sensor Module (Sensor.v)
   
  ###### Purpose : 
  Simulates an ultrasonic sensor to measure distance to an obstacle.
  ###### How It Works: 
  The sensor sends out a trigger pulse and waits for an echo to return.  The time between the trigger and echo signals corresponds to the 
  distance.
  ###### Usage:
  This module is used as the input for the FSM to decide the robot's movement.
I implemented a sensor module to simulate an ultrasonic sensor's behavior, calculating the time taken for an echo to return after a trigger is sent. This time is translated 
into distance, which the robot uses to decide if it should move or stop.
       
  #### 2. Motor Control Module (MotorControl.v)__
  ###### Purpose: 
  Generates PWM signals to control the motors.
  ###### How It Works:
  The module outputs left_pwm and right_pwm signals to simulate motor control. The PWM signal's duty cycle determines motor speed.
  ###### Functionality: 
  The robot can either move forward, turn left, or right based on the motor signals.
         
The motor control module generates PWM signals that simulate motor behavior. By adjusting the duty cycle, I control the speed and direction of the robot’s wheels.
         
  #### 3. Finite State Machine (RobotControl.v)
  ###### Purpose: 
  The FSM makes decisions on how the robot should behave based on the distance measured by the sensor.
  ###### States:
  MOVE_FORWARD: Robot moves forward when no obstacles are detected.
  TURN_LEFT / TURN_RIGHT: Robot turns when an obstacle is detected.
  STOP: Robot stops if the obstacle is too close.
  ###### FSM Logic: 
  The FSM transitions between these states based on the sensor input.
         
The FSM manages the robot’s movement. If the sensor detects an object at a certain distance, it shifts the control logic from moving forward to turning or stopping. This 
gives the robot an intelligent decision-making process.
       
    






