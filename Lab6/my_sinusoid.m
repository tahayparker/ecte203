function x = my_sinusoid(t)
T0 = 0.02; % period
ts = mod(t, T0); % shift t to the interval [0, T]

% Initialise output vector
x = zeros(size(t));

indexes_1 = find((ts >=0) & (ts < 0.01));
x(indexes_1) = 240 * cos(2 * pi * ts(indexes_1) + 0.25 * pi);

indexes_2 = find((ts >= 0.01) & (ts <= 0.02));
x(indexes_2) = 0;