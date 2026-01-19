function apx_load_plant()
P = evalin('base','P');
SYS = apx_aircraft_ss(P);
assignin('base','SYS',SYS);
disp("✅ Plant loaded into workspace as SYS (A,B,C,D).");
end