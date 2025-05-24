%% Part a - Audio Playback
load lab5a % Load signals s, x and sampling frequency Fs
sound(s, Fs); % Play reference signal
pause(2);
sound(x, Fs); % Play received signal

%% Part b - Signal Visualization
figure;
plot(tx, x);
title('Signal x(n)');
xlabel('n'); ylabel('x(n)');
f = gcf; exportgraphics(f,'L5T3-b.png','Resolution',300)

%% Part c - Cross-correlation Analysis
[rxs, lrxs] = xcorr(x, s); % Cross-correlation for signal detection
figure;
stem(lrxs, rxs);
title('Cross-correlation r_{xs}(l)');
xlabel('lag (l)'); ylabel('r_{xs}(l)');
f = gcf; exportgraphics(f,'L5T3-c.png','Resolution',300)

%% Part d - Noise Addition and Detection
w = sqrt(0.36) * randn(length(x)); % Additive white noise (σ = 0.6)
w = w - mean(w); % Zero-mean noise

z = x + w; % Add noise to signal
sound(z, Fs); % Play noisy signal

figure;
plot(tx, z);
title('Signal z(n) = x(n) + w(n)');
xlabel('n'); ylabel('z(n)');
f = gcf; exportgraphics(f,'L5T3-d1.png','Resolution',300)

[rzs, lrzs] = xcorr(z, s); % Cross-correlation with noisy signal
figure;
stem(lrzs, rzs);
title('Cross-correlation r_{zs}(l)');
xlabel('lag (l)'); ylabel('r_{zs}(l)');
f = gcf; exportgraphics(f,'L5T3-d2.png','Resolution',300)

%% Part f - Second Signal Analysis

%% Part f-a - Audio Playback
sound(v, Fs);
pause(2);
sound(r, Fs);

%% Part f-b - Signal Visualization
figure;
plot(tx, r);
title('Signal r(n)');
xlabel('n'); ylabel('r(n)');
f = gcf; exportgraphics(f,'L5T3-f-b.png','Resolution',300)

%% Part f-c - Cross-correlation Analysis
[rrv, lrrv] = xcorr(r, v); % Cross-correlation for second signal pair
figure;
stem(lrrv, rrv);
title('Cross-correlation r_{rv}(l)');
xlabel('lag (l)'); ylabel('r_{rv}(l)');
f = gcf; exportgraphics(f,'L5T3-f-c.png','Resolution',300)

%% Part f-d - Noise Addition and Detection
w = sqrt(0.36) * randn(length(r)); % Additive white noise
w = w - mean(w); % Zero-mean noise

m = r + w; % Add noise to second signal
sound(m, Fs); % Play noisy second signal

figure;
plot(tx, m);
title('Signal m(n) = r(n) + w(n)');
xlabel('n'); ylabel('m(n)');
f = gcf; exportgraphics(f,'L5T3-f-d1.png','Resolution',300)

[rmv, lrmv] = xcorr(m, v); % Cross-correlation with noisy second signal
figure;
stem(lrmv, rmv);
title('Cross-correlation r_{mv}(l)');
xlabel('lag (l)'); ylabel('r_{mv}(l)');
f = gcf; exportgraphics(f,'L5T3-f-d2.png','Resolution',300)