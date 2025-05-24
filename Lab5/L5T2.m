s = [1 -1 1 -1 -1 1]; % Known signal pattern
w = sqrt(0.36) * randn(1, 20); % Additive white noise (var = 0.36)
w = w - mean(w); % Zero-mean noise
x = [zeros(1, 10) s zeros(1, 4)] + w; % Signal delayed by 10 samples + noise

%% Part a - Noisy Signal Visualization
figure;
nx = 1:20;
stem(nx, x);
title('Signal x(n)');
xlabel('n'); ylabel('x(n)');
disp("It is not possible to estimate the delay of x(n) using only visual inspection.");
f = gcf; exportgraphics(f,'L5T2-a.png','Resolution',300)

%% Part b - Cross-correlation for Delay Detection
[rxs, lrxs] = xcorr(x, s); % Cross-correlation between received and known signal
figure;
stem(lrxs, rxs);
title('Cross-correlation r_{xs}(l)');
xlabel('lag (l)'); ylabel('r_{xs}(l)');
f = gcf; exportgraphics(f,'L5T2-b.png','Resolution',300)

%% Part c - Delay Estimation from Cross-correlation
[val, idx] = max(rxs); % Find peak correlation
estimated_delay = lrxs(idx);
disp("Estimated delay from cross-correlation: " + estimated_delay);

%% Part d - Matched Filter
h = fliplr(s); % Time-reversed signal = matched filter impulse response
disp("Impulse response h(n):");
disp(h);

%% Part e - Matched Filter Output
y = conv(x, h); % Convolution with matched filter
ny = 0:length(y)-1;
figure;
stem(ny, y);
title('Output y(n) of the matched filter');
xlabel('n'); ylabel('y(n)');
f = gcf; exportgraphics(f,'L5T2-e.png','Resolution',300)

%% Part f - Delay Estimation from Matched Filter
[~, idx] = max(y); % Find peak in matched filter output
del = idx - length(s); % Compensate for filter length
disp("Estimated delay from matched filter output: " + del);