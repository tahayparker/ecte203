function x = my_pulse(t)
x = zeros(size(t)); % initialise x same size as t
Ts = 0.025; % this pulse needs information about Ts
% Find array indexes of t in (-0.5Ts, 0.5Ts]
idx = find( (t > -Ts) & (t <= Ts));
% Set output for those t
x(idx) = 1 - abs(t(idx)/Ts);
end