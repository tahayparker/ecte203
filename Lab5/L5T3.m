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

% Generate noise in chunks since x is too large and causes MATLAB to become unresponsive
chunk_size = 1e5;
z = zeros(size(x), 'like', x);  % Preallocate with same shape

for i = 1:chunk_size:length(x)
    idx = i:min(i+chunk_size-1, length(x));
    x_chunk = x(idx);                      % Extract chunk
    x_chunk = x_chunk(:);                 % Force column vector
    w = sqrt(0.36) * randn(length(x_chunk), 1, 'like', x);  % Column vector noise
    w = w - mean(w);
    z(idx) = x_chunk + w;
end

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
rx = linspace(0, 4, 34000);
figure;
plot(rx, r);
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
% Generate noise in chunks since x is too large and causes MATLAB to become unresponsive
chunk_size = 1e5;
m = zeros(size(r), 'like', r);  % Preallocate with same shape

for i = 1:chunk_size:length(r)
    idx = i:min(i+chunk_size-1, length(r));
    r_chunk = r(idx);                      % Extract chunk
    r_chunk = r_chunk(:);                 % Force column vector
    w = sqrt(0.36) * randn(length(r_chunk), 1, 'like', r);  % Column vector noise
    w = w - mean(w);
    m(idx) = r_chunk + w;
end

sound(m, Fs); % Play noisy second signal

figure;
plot(rx, m);
title('Signal m(n) = r(n) + w(n)');
xlabel('n'); ylabel('m(n)');
f = gcf; exportgraphics(f,'L5T3-f-d1.png','Resolution',300)

[rmv, lrmv] = xcorr(m, v); % Cross-correlation with noisy second signal
figure;
stem(lrmv, rmv);
title('Cross-correlation r_{mv}(l)');
xlabel('lag (l)'); ylabel('r_{mv}(l)');
f = gcf; exportgraphics(f,'L5T3-f-d2.png','Resolution',300)