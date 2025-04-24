% Define the ranges for each signal
n1 = -5:5;                % Time index from -5 to 5 for signal x1
n2 = -5:5;                % Time index from -5 to 5 for signal x2
n3 = 0:15;                % Time index from 0 to 15 for signal x3
n4 = 0:15;                % Time index from 0 to 15 for signal x4

% Signal 1
x1 = 2.*(n1==-2) + 0.5.*(n1==-1) - (n1==0) + 1.5.*(n1==1) + (n1==2);

% Signal 2
x2 = 2.*(n2>=-2) - 2.*(n2>=3);

% Signal 3
x3 = 0.75.^(n3-4) .* (n3>=4);

% Signal 4
x4 = 0.8.^(n4-4) .* sin(0.3*pi*n4) .* (n4>=2);

% Subplot 1
subplot(411), stem(n1, x1, "filled");
title('Signal x_1(n) = 2\delta(n+2) + 0.5\delta(n+1) - \delta(n) + 1.5\delta(n-1) + \delta(n-2)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Subplot 2
subplot(412), stem(n2, x2, "filled");
title('Signal x_2(n) = 2u(n+2) - 2u(n-3)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Subplot 3
subplot(413), stem(n3, x3, "filled");
title('Signal x_3(n) = (0.75)^{n-4}u(n-4)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Subplot 4
subplot(414), stem(n4, x4, "filled");
title('Signal x_4(n) = (0.8)^{n-4}sin(0.3\pin)u(n-2)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Main title for the entire figure
sgtitle('Discrete-Time Signal Representations');