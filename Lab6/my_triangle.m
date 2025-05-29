function x = my_triangle(t)
T0 = 0.04; % period
ts = mod(t, T0); % shift t to the interval [0, T]

% Initialise output vector
x = zeros(size(t));

% Compute output for values of t between [0, 0.02)
indexes_1 = find((ts >=0) & (ts < 0.02));
x(indexes_1) = 50 * ts(indexes_1);

% Compute output for values of t between [0.02, 0.04]
indexes_2 = find((ts >= 0.02) & (ts <= 0.04));
x(indexes_2) = 2 - 50 * ts(indexes_2);