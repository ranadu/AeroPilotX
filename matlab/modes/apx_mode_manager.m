function [mode, reason] = apx_mode_manager(cmd, health, t, prev)
% cmd: struct of pilot commands/buttons
% health: struct with validity flags + sat timers
% prev: struct with previous mode + timers

% Modes as uint8 for Simulink friendliness
MANUAL   = uint8(0);
STAB     = uint8(1);
ALT      = uint8(2);
HDG      = uint8(3);
NAV      = uint8(4);
FAILSAFE = uint8(5);

mode = prev.mode;
reason = uint8(0);

% Priority: FAILSAFE always wins
if ~health.sensors_ok || health.act_sat_too_long || ~health.airspeed_ok
    mode = FAILSAFE;
    reason = uint8(10); % health trigger
    return;
end

% Engage/disengage
if ~cmd.ap_engage
    mode = MANUAL;
    reason = uint8(1);
    return;
end

% If AP engaged, at least stabilize
if mode == MANUAL
    mode = STAB;
    reason = uint8(2);
end

% Mode selection buttons
if cmd.nav_mode
    mode = NAV; reason = uint8(20);
elseif cmd.alt_hold
    mode = ALT; reason = uint8(21);
elseif cmd.hdg_hold
    mode = HDG; reason = uint8(22);
elseif cmd.stabilize
    mode = STAB; reason = uint8(23);
end

end