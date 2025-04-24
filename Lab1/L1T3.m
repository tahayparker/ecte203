% Define parameters
T = 0.01; % Sampling period in seconds
t = 0:T:0.25; % Time vector from 0 to 0.25 seconds
n = 0:length(t)-1; % Sample indices
x = 5 * cos(120 * pi * t + deg2rad(30)); % Signal samples

%% Part a
Fs = 1/T;
fprintf("The sampling rate Fs is %i Hz\n", Fs);

%% Part b
figure;
stem(n, x);
xlabel('Sample index n');
ylabel('Amplitude');
title('Discrete-time signal x[n]');
grid on;

% Calculate the period N from the discrete signal
f_original = 60; % Original frequency
f_alias = abs(f_original - Fs); % Alias frequency after sampling
N = Fs/f_alias; % Period in samples
fprintf("Period N is = %.1f samples\n", N);

%% Part c
f_original = 60; % Original frequency in Hz
if Fs < 2*f_original
    % Calculate alias frequency using the folding formula
    f_alias = abs(mod(f_original + Fs/2, Fs) - Fs/2);
    fprintf("Yes, there is aliasing as Fs (%i Hz) < 2*f (%i Hz)\n", Fs, 2*f_original);
    fprintf("The alias frequency is %.1f Hz\n", f_alias);
end