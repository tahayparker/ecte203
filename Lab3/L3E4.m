A = [1 1.25 0.75]; % coefficients of y[n] + 1.5y[n-1] + 0.75y[n-2]
B = [2 1]; % coefficients of 2 x[n] + x[n-1]
s1 = stepz(B, A, 51); % discrete-time step response
n = 0:50; % index of the 51 samples of h(n) computed above
%alternative: compute h(n) by filtering a step with the system
u = (n>=0); % unit step sequence u(n)
s2 = filter(B, A, u); % step response
%plotting the step responses computed using different methods
subplot(211), stem(n, s1, 'filled'), title('Step Response using stepz()');
xlabel('n'), ylabel('s1(n)');
subplot(212), stem(n, s2, 'filled'), title('Step Response using filter()');
xlabel('n'), ylabel('s2(n)');

disp("Last value of s(n): " + s1(end)); % display the last value of s(n)
disp("Value at s(n=20): " + s1(21)); % display the value at s(n=20)
