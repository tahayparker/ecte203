% Define parameters
f0 = 100;                % Original signal frequency (Hz)
w0 = 2*pi*f0;            % Angular frequency (rad/s)
T = 0.2;                  % Signal duration (s)
fs1 = 2000;               % First sampling rate (Hz)
fs2 = 125;                % Second sampling rate (Hz)
fs3 = 105;                % Third sampling rate (Hz)

% Generate continuous-time signal
t = 0:0.0001:T;
x = sin(w0*t);

% Sample the signal at different rates
t1 = 0:1/fs1:T;           % Time points for sampling at 2000 Hz
t2 = 0:1/fs2:T;           % Time points for sampling at 125 Hz
t3 = 0:1/fs3:T;           % Time points for sampling at 105 Hz

x1 = sin(w0*t1);          % Sampled signal at 2000 Hz
x2 = sin(w0*t2);          % Sampled signal at 125 Hz
x3 = sin(w0*t3);          % Sampled signal at 105 Hz

% First subplot
subplot(3,1,1);
stem(t1, x1, 'r.');
title('Signal x(t) and its samples x1 (fs = 2000 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Second subplot
subplot(3,1,2);
stem(t2, x2, 'b.');
title('Signal x(t) and its samples x2 (fs = 125 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Third subplot
subplot(3,1,3);
stem(t3, x3, 'g.', 'MarkerSize', 8);
title('Signal x(t) and its samples x3 (fs = 105 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Compute normalized frequency and period
f_normalized_1 = fs1/f0;  % normalized frequency for x1
f_normalized_2 = fs2/f0;  % normalized frequency for x2
f_normalized_3 = fs3/f0;  % normalized frequency for x3

N_1 = 1/f_normalized_1*f0;  % period in samples for x1
N_2 = 1/f_normalized_2*f0;  % period in samples for x2
N_3 = 1/f_normalized_3*f0;  % period in samples for x3

% Display results
fprintf('For x1 (fs = 2000 Hz):\n');
fprintf('  Normalized frequency: %.2f samples/cycle\n', f_normalized_1);
fprintf('  Period: %.2f samples\n', N_1);

fprintf('For x2 (fs = 125 Hz):\n');
fprintf('  Normalized frequency: %.2f samples/cycle\n', f_normalized_2);
fprintf('  Period: %.2f samples\n', N_2);

fprintf('For x3 (fs = 105 Hz):\n');
fprintf('  Normalized frequency: %.2f samples/cycle\n', f_normalized_3);
fprintf('  Period: %.2f samples\n', N_3);

% Compute frequencies of reconstructed signals
fprintf('\nReconstruction frequencies:\n');
fprintf('  From x1: %.2f Hz\n', f0);
fprintf('  From x2: %.2f Hz\n', f0);
fprintf('  From x3: %.2f Hz\n', f0);

% Check for aliasing
if fs2 < 2*f0
    aliased_freq = abs(mod(f0 + fs2/2, fs2) - fs2/2);
    fprintf('\nAliasing occurs for x2\n');
    fprintf('  Aliased frequency: %.2f Hz\n', aliased_freq);
end

if fs3 < 2*f0
    aliased_freq = abs(mod(f0 + fs3/2, fs3) - fs3/2);
    fprintf('\nAliasing occurs for x3\n');
    fprintf('  Aliased frequency: %.2f Hz\n', aliased_freq);
end