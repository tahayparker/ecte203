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
fprintf("The length of x1 is %d\n", L);

%% Part b
n = 0:L-1;
figure;
stem(n, x1, 'filled');
title('Signal x1(n) vs sample index n');
xlabel('Sample index n');
ylabel('Amplitude');

%% Part c
N = 10; % 10 samples per period
fprintf("The period is %d samples\n", N);

%% Part d
f = N/(1/T); % normalized frequency = analog frequency / sampling frequency
fprintf("The normalized frequency is %.2f Hz\n", f);

%% Part e
fprintf("The relationship is: f = F/Fs = 10/100 = 0.1\n");

%% Part f
fprintf("The relationship between period N and normalized frequency f is: N = 1/f\n");
fprintf("With f = 0.1, N = 1/0.1 = 10 samples, which matches our observation\n");
