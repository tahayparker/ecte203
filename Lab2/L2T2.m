Fs = 40; % sampling rate = 40 Hz
Ts = 1/Fs; % sampling period
F = 5; % frequency of continuous-time signal

t_d = 0:Ts:1; % sampling points 0, Ts, 2Ts,..., 1
n_d = round(t_d/Ts); % integer index, used for plotting

x_d = cos(2*pi*F*t_d); % discrete-signal x_d

t_a = 0:0.001:0.5; % arbitrary t values
x_r = reconstruct_signal(n_d, x_d, t_a); % reconstructed signal
plot(t_a, x_r, 'r-', 'LineWidth', 1.5); % plot reconstructed signal