T = 0.01; % sampling period. Sampling freq. = 1/T = 100 Hz.
nt = 0:T:0.5; % create samples of the time variable
x1 = 10*cos(20*pi*nt); % create a 10 Hz signal
t = 0:0.001:0.5; % this is an approximation of the continuous time
y1 = 10*cos(20*pi*t); % this represents the continuous-time signal
subplot(211);
stem(nt,x1, 'filled');
title('Signal x1(n), samples of the signal y1(t)');
xlabel('Time, t');
subplot(212);
stem(nt, x1, 'filled');
hold on;
plot(t, y1, 'r');
title('Signals x1(n) (blue) and y1(t) (red)');
xlabel('Time, t');
hold off;


%% Part a
L = length(x1);
fprintf("The length of x1 is %i\n", L);

%% Part b
n = 0:L-1;
stem(n, x1)

%% Part c
N = 10;
fprintf("The period is %.2f s\n", N);

%% Part d
f = N/(1/T);
fprintf("The normalized frequency is %.2f Hz", f)

%% Part e
