t = -2:0.01:2;
x1 = 10*cos(20*pi*t);        % Cosine component
x2 = exp(-3*(t+1));          % Exponential component
u1 = (t >= -1);              % u(t+1), advanced unit step
x = x1 .* x2 .* u1;          % Point-wise multiplication of all components

% Plot individual components
subplot(211), plot(t, x1, t, x2, t, u1);
title("Components: 10cos(20\pit), exp(-3(t+1)), and u(t+1)");
xlabel("Time (t)");
ylabel("Amplitude");
legend('10cos(20\pit)', 'exp(-3(t+1))', '10u(t+1)');

% Plot final signal
subplot(212), plot(t, x);
title("Signal: 10cos(20\pit)·exp(-3(t+1))·u(t+1)");
xlabel("Time (t)");
ylabel("Amplitude");