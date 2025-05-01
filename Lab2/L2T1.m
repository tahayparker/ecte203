%% Part A: Calculate Signal Frequency, Nyquist Frequency and Nyquist Period
% Signal x(t) = 2 cos(21πt)

% Given parameters
angular_frequency = 21 * pi; % rad/s

% Calculate signal frequency
signal_frequency = angular_frequency / (2 * pi);

% Calculate Nyquist frequency
nyquist_frequency = 2 * signal_frequency;

% Calculate Nyquist period (maximum sampling period allowed)
nyquist_period = 1 / nyquist_frequency;

% Display results
fprintf('PART A: FREQUENCY ANALYSIS\n');
fprintf('Signal: x(t) = 2 cos(21πt)\n');
fprintf('----------------------------------\n');
fprintf('Signal frequency (f0): %.2f Hz\n', signal_frequency);
fprintf('Nyquist frequency: %.2f Hz\n', nyquist_frequency);
fprintf('Nyquist period: %.4f seconds\n', nyquist_period);
fprintf('----------------------------------\n\n');

%% Sampling Analysis at Different Frequencies (Fs = 10, 5, 20 Hz)

% Signal parameters
f0 = 10.5;       % Signal frequency in Hz
amplitude = 2;   % Signal amplitude

% Define sampling frequencies to analyze
Fs_values = [10, 5, 20]; % Hz

% Time vectors for plotting
t_duration = 5;  % Display 1 second of the signal
t_continuous = 0:0.001:t_duration;  % High resolution for continuous signal display

% Generate continuous signal
x_continuous = amplitude * cos(2*pi*f0*t_continuous);

% Calculate Nyquist frequency
nyquist_frequency = 2 * f0;

% Create a single figure with subplots for all sampling rates
figure();

% Loop through each sampling rate
for i = 1:length(Fs_values)
    Fs = Fs_values(i);
    Ts = 1/Fs;       % Sampling period in seconds

    % Generate sampled signal
    t_sampled = 0:Ts:t_duration;        % Sampling points
    x_sampled = amplitude * cos(2*pi*f0*t_sampled);        % Sampled signal

    % Create subplot for this sampling rate
    subplot(3, 1, i);

    % Plot continuous and sampled signals
    plot(t_continuous, x_continuous, 'b-', 'LineWidth', 1.5);
    hold on;
    stem(t_sampled, x_sampled, 'r-o', 'filled', 'LineWidth', 1.5);
    grid on;

    % Adding labels and title
    xlabel('Time (s)', 'FontSize', 12);
    ylabel('Amplitude', 'FontSize', 12);
    title(['Case ' num2str(i) ': Sampling at Fs = ', num2str(Fs), ' Hz'], 'FontSize', 12);


    % Calculate normalized frequency and angular frequency
    normalized_freq = f0/Fs;
    normalized_angular_freq = 2*pi*normalized_freq;

    % Display results in command window
    fprintf('CASE %d: SAMPLING ANALYSIS - Fs = %d Hz\n', i, Fs);
    fprintf('----------------------------------\n');
    fprintf('Sampling frequency (Fs): %.2f Hz\n', Fs);
    fprintf('Signal frequency (f0): %.2f Hz\n', f0);
    fprintf('Normalized frequency (Fd): %.4f cycles/sample\n', normalized_freq);
    fprintf('Normalized angular frequency (wd): %.4f rad/sample\n', normalized_angular_freq);
    fprintf('Normalized angular frequency (wd): %.2f π rad/sample\n', normalized_angular_freq/pi);
    fprintf('----------------------------------\n\n');
end

% Add overall title to the figure
sgtitle('Sampling of x(t) = 2cos(21πt) at Different Sampling Rates', 'FontSize', 16);
