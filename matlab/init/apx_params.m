function P = apx_params()
% APX_PARAMS  Central parameter struct for AeroPilotX

P.g = 9.80665;

% Sample time
P.Ts = 0.01;              % controller sample time (s)

% Actuator limits (example)
P.act.elevator.max = deg2rad(25);
P.act.elevator.rate = deg2rad(60);  % rad/s

P.act.aileron.max = deg2rad(20);
P.act.aileron.rate = deg2rad(80);

P.act.rudder.max = deg2rad(25);
P.act.rudder.rate = deg2rad(80);

% Sensor noise (example)
P.sens.gyro_sigma = deg2rad(0.2);     % rad/s
P.sens.accel_sigma = 0.05;            % m/s^2
P.sens.alt_sigma = 0.8;               % m
P.sens.hdg_sigma = deg2rad(1.0);       % rad

% Failsafe thresholds
P.fs.max_sat_time = 1.5;     % seconds
P.fs.min_airspeed = 18;      % m/s (example)
P.fs.sensor_hold_time = 0.5; % seconds of continuous good data to exit failsafe

% Outer loop limits
P.cmd.max_bank = deg2rad(25);
P.cmd.max_pitch = deg2rad(15);

end