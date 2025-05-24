%% Part a - Impulse Response
a = [1, -1.2, 0.85]; % Denominator coefficients
b = [1]; % Numerator coefficients
nh = 0:30;
h = impz(b, a, length(nh)); % Calculate system impulse response
figure;
stem(nh, h);
axis([0 30 -1 2]);
title('Impulse Response h(n)');
xlabel('n'); ylabel('h(n)');
f = gcf; exportgraphics(f,'L5T1-a.png','Resolution',300)

%% Part b - System Output with White Noise
w = randn(1, 101);
w = w - mean(w); % Zero-mean white noise
y = filter(b, a, w); % Filter white noise through system
ny = 0:100;
figure;
plot(ny, y);
title('Output y(n) with White Noise Input');
xlabel('n'); ylabel('y(n)');
f = gcf; exportgraphics(f,'L5T1-b.png','Resolution',300)

%% Part c - Cross-correlation Analysis
[ryw, lryw] = xcorr(y, w, 'biased'); % Input-output cross-correlation
figure;
stem(lryw, ryw);
axis([0 30 -1 2]);
title('Input-Output Cross-correlation r_{yw}(l)');
xlabel('lag (l)'); ylabel('r_{yw}(l)');
f = gcf; exportgraphics(f,'L5T1-c1.png','Resolution',300)

% Compare h(n) with r_yw(l) for positive lags
idx_zero = find(lryw == 0);
max_lag = length(h) - 1;
lag_range = idx_zero : idx_zero + max_lag;

figure;
stem(nh, h, 'b', 'DisplayName', 'h(n)');
hold on;

if lag_range(end) <= length(ryw)
    stem(lryw(lag_range), ryw(lag_range), 'r--', 'DisplayName', 'r_{yw}(l)');
end

legend;
title('Comparison of h(n) and r_{yw}(l)');
xlabel('n or lag (l)');
ylabel('h(n) or r_{yw}(l)');
axis([0 30 -1 2]);
f = gcf; exportgraphics(f,'L5T1-c2.png','Resolution',300)

%% Part d - Input Autocorrelation
[rw, lrw] = xcorr(w, 'biased'); % White noise autocorrelation
figure;
stem(lrw, rw);
title('Autocorrelation r_{ww}(l)');
xlabel('lag (l)'); ylabel('r_{ww}(l)');
f = gcf; exportgraphics(f,'L5T1-d.png','Resolution',300)

%% Part e - Repeat 100 times
all_ryw = zeros(100, 31); % Storage for 100 runs

% Generate 100 cross-correlation runs
for i = 1:100
    w = randn(1, 100);
    w = w - mean(w);
    y = filter(b, a, w);
    [ryw_loop, lryw_loop] = xcorr(y, w, 'biased');
    start_idx = find(lryw_loop == 0);
    end_idx = find(lryw_loop == 30);
    rywfinal = ryw_loop(start_idx:end_idx); % Extract lags 0-30
    all_ryw(i, :) = rywfinal;
end

% Average first 50 realizations and compare with h(n)
avg_ryw_50 = mean(all_ryw(1:50, :), 1);
figure;
plot(0:max_lag, h, 'b', 'LineWidth', 1.5, 'DisplayName', 'h(n)');
hold on;
plot(0:max_lag, avg_ryw_50, 'g', 'LineWidth', 1.5, 'DisplayName', 'Average of r_{yw}(l)');
hold off;

xlabel('Time Index');
ylabel('Impulse response');
title('Average of 50 trials');
legend
grid on;
f = gcf; exportgraphics(f,'L5T1-e.png','Resolution',300)