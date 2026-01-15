function u_out = apx_actuator_model(u_cmd, u_prev, rate_lim, Ts)
% Rate limiter (slew)
du = u_cmd - u_prev;
du_max = rate_lim * Ts;
du_limited = min(max(du, -du_max), du_max);
u_out = u_prev + du_limited;
end