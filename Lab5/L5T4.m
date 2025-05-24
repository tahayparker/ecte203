%% Part a - Find poles and zeros
A = [1 -1.2 0.85];  % denominator coefficients
B = [1 0 0];        % numerator coefficients

p = roots(A);     % poles of the system
z = roots(B);     % zeros of the system

disp("Poles:"); disp(p);
disp("Zeros:"); disp(z);

%% Part b - Stability check
pole_magnitudes = abs(p);
if all(pole_magnitudes < (1 - eps))
    disp('System is stable')
else
    disp('System is unstable')
end

%% Part c - Frequency response plots
zplane(B,A);  % pole-zero plot
[H,w] = freqz(B,A,100);  % frequency response
magH = abs(H);           % magnitude response
phaH = angle(H);         % phase response

subplot(2,1,1);
plot(w/pi,magH);
grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response');

subplot(2,1,2);
plot(w/pi,phaH/pi);
grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response');

disp("This is a band-pass filter");
disp("The phase is not linear")

%% Part d - Peak frequency for different sampling rates
[max_mag, max_idx] = max(magH);
peak_freq_normalized = w(max_idx);  % peak frequency in rad/sample

% Convert normalized frequency to Hz for different sampling rates
Fs1 = 48000;  % 48 kHz
Fs2 = 1e6;    % 1 MHz

peak_freq_Hz_48k = (peak_freq_normalized / (2*pi)) * Fs1;
peak_freq_Hz_1M = (peak_freq_normalized / (2*pi)) * Fs2;

fprintf('Peak frequency (least attenuated):\n');
fprintf('For Fs = 48 kHz: %.1f Hz\n', peak_freq_Hz_48k);
fprintf('For Fs = 1 MHz: %.1f kHz\n', peak_freq_Hz_1M/1000);