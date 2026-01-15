function apx_init()
% APX_INIT  Initializes workspace for Simulink model

P = apx_params();
assignin('base','P',P);

% Default scenario setpoints
SP.alt_cmd = 200;              % m
SP.hdg_cmd = deg2rad(90);      % rad
SP.wp = [0 0; 1000 0];         % simple waypoint line
assignin('base','SP',SP);

disp("AeroPilotX initialized: P and SP loaded into base workspace.");
end