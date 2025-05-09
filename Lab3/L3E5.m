A = [1 1.25 0.75]; % coefficients of y[n] + 1.5y[n-1] + 0.75y[n-2]
B = [2 1]; % coefficients of 2 x[n] + x[n-1]
n = 0:50; % index of the 51 samples of h(n) computed above
%alternative: compute h(n) by filtering a step with the system
x = 5 * sin(0.6 * pi * n); % input signal
s = filter(B, A, x); % response to input x[n]
%plotting the step responses computed using different methods
stem(n, s, 'filled');
title('Response to input x(n)');
xlabel('n'), ylabel('s(n)');

% Calculate the period of the response
N = 2 * pi / 0.6; % period of the input signal

disp("Period of the response: " + N); % display the period of the response
