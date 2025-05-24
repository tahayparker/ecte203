%% (a) System function, poles/zeros, stability
A = [1 -1 0.1];  % y terms coefficients
B = [1 0.3];     % x terms coefficients

disp("--------------------------------");
disp("Part (a):");

disp('H(z) = (1 + 0.3z^(-1)) / (1 - z^(-1) + 0.1z^(-2))')

p = roots(A);     % poles
z = roots(B);     % zeros

disp("Poles:"); disp(p);
disp("Zeros:"); disp(z);

pole_magnitudes = abs(p);
if all(pole_magnitudes < (1 - eps))
    disp('System is stable')
else
    disp('System is unstable')
end

figure(1);
zplane(B, A);
title('Pole-Zero Plot');
grid on;
disp("--------------------------------");

%% (b) Impulse and step response
n = 0:99;
h = impz(B, A, length(n));

figure(2);
subplot(211);
stem(n, h);
title('Impulse Response');
xlabel('n'); ylabel('h[n]');
grid on;

s = stepz(B, A, length(n));

subplot(212);
stem(n, s);
title('Step Response');
xlabel('n'); ylabel('s[n]');
grid on;

%% (c) Partial fraction expansion
[r, p, k] = residuez(B, A);

disp("--------------------------------");
disp("Part (c):");
disp('Residues:'); disp(r);
disp('Poles:'); disp(p);
disp('Direct terms:'); disp(k);

disp(['h[n] = ' num2str(r(1)) '(' num2str(p(1)) ')^n u[n] ' num2str(r(2)) '(' num2str(p(2)) ')^n u[n]'])
disp("--------------------------------");

%% (d) Magnitude and phase response
[H, w] = freqz(B, A);

figure(3);
subplot(2,1,1);
plot(w/pi, abs(H));
title('Magnitude Response');
xlabel('\omega/\pi'); ylabel('|H(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(w/pi, angle(H));
title('Phase Response');
xlabel('\omega/\pi'); ylabel('Phase (rad)');
grid on;

%% (e) Output for sinusoidal input
n = 0:200;
x = (sin(0.3 * pi * n + pi/ 4) + 2 * cos(0.1 * pi * n)) .* (n >= 0); % Input signal
y = filter(B, A, x); % Output signal

figure(4);
subplot(2,1,1);
stem(n, x);
title('Input Signal');
xlabel('n'); ylabel('x[n]');
grid on;

subplot(2,1,2);
stem(n, y);
title('Output Signal y[n]');
xlabel('n'); ylabel('y[n]');
grid on;

% Steady-state calculation
[r, p, k] = residuez(x, y);

disp("--------------------------------");
disp("Part (e):");
disp('Residues:'); disp(r);
disp('Poles:'); disp(p);
disp('Direct terms:'); disp(k);
disp(['y_ss[n] = ' num2str(r(1)) '(' num2str(p(1)) ')^n u[n] ' num2str(r(2)) '(' num2str(p(2)) ')^n u[n]'])
disp("--------------------------------");