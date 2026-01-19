function SYS = apx_aircraft_ss(P)
% APX_AIRCRAFT_SS  Builds a simple fixed-wing autopilot plant (linear SS).
%
% States:  x = [phi p theta q psi h]'
% Inputs:  u = [da de]'  (aileron, elevator)
% Outputs: y = states

% --- Tunable "aircraft-like" parameters (plausible defaults) ---
V = 35;                 % m/s trim airspeed (trainer aircraft vibe)
g = P.g;

% Roll mode parameters
wn_phi   = 4.0;         % rad/s  (roll natural frequency)
zeta_phi = 0.6;         % damping ratio
Kphi     = 1.2;         % control effectiveness

% Pitch mode parameters
wn_th    = 3.0;         % rad/s (pitch natural frequency)
zeta_th  = 0.7;
Kth      = 1.0;

% State ordering
% x = [phi p theta q psi h]'
n = 6;
m = 2;

A = zeros(n,n);
B = zeros(n,m);

% ---- phi dot = p
A(1,2) = 1;

% ---- p dot = -2 zeta wn p - wn^2 phi + K wn^2 da
A(2,1) = -(wn_phi^2);
A(2,2) = -(2*zeta_phi*wn_phi);
B(2,1) = Kphi*(wn_phi^2);

% ---- theta dot = q
A(3,4) = 1;

% ---- q dot = -2 zeta wn q - wn^2 theta + K wn^2 de
A(4,3) = -(wn_th^2);
A(4,4) = -(2*zeta_th*wn_th);
B(4,2) = Kth*(wn_th^2);

% ---- psi dot = (g/V) * phi
A(5,1) = g / V;

% ---- h dot = V * theta
A(6,3) = V;

% Outputs = all states
C = eye(n);
D = zeros(n,m);

SYS.A = A; SYS.B = B; SYS.C = C; SYS.D = D;
SYS.Vtrim = V;
SYS.x0 = zeros(n,1);   % trim perturbations = 0
SYS.u0 = zeros(m,1);

% Useful labels for logging/plots
SYS.state_names  = ["phi","p","theta","q","psi","h"];
SYS.input_names  = ["da","de"];
SYS.output_names = SYS.state_names;

end