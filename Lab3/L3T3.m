A = [1 0.5 -0.5 -0.25]; % coefficients of y[n] + 0.5y[n-1] - 0.75y[n-2] - 0.25y[n-3]
B = [1]; % coefficients of x[n]
n = 0:50; % index of the 51 samples of h(n) computed above
x = 20 * sin(0.4 * pi * n); % input signal

s1 = impz(B, A, 51); % impulse response of the system
s2 = stepz(B, A, 51); % step response of the system
s3 = filter(B, A, x); % response to input x[n]

%plotting the step responses computed using different methods
subplot(311)
stem(n, s1, 'filled');
title('Impulse response to input x(n)');
xlabel('n'), ylabel('s(n)');

subplot(312)
stem(n, s2, 'filled');
title('Step response to input x(n)');
xlabel('n'), ylabel('s(n)');

subplot(313)
stem(n, s3, 'filled');
title('Response to input x(n)');
xlabel('n'), ylabel('s(n)');


disp("Steady state value of the step response: " + s2(end)); % display the steady state value of the step response


p = roots(A);
z = roots(B);
r = abs(p);

disp('Poles of the system:');
disp(p); % display the poles of the system
disp('Zeros of the system:');
disp(z); % display the zeros of the system

disp('Magnitude of poles:');
disp(r); % display the magnitude of poles

max(r);
figure(2);
zplane(B,A);

if all(r < (1 - eps))  % Stability check
    disp('The system is stable.');
else
    disp('The system is unstable.');
end