function [u_sat, sat_flag] = apx_saturation(u, umax)
u_sat = min(max(u, -umax), umax);
sat_flag = any(abs(u) > umax);
end