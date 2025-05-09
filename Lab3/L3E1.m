nx = 0:10; % sample index for x
x = 0.5 .^ nx;
nh = -2:2; % sample index for h
h = (nh >= -2) - (nh >= 3);
y = conv(x, h); % length of y is equal to (length of x) + (length of h) - 1
N = length(x) + length(h) -1;
ny = -2:12; % sample index for y
subplot(3,1,1);
stem(nx, x, 'filled'), xlabel('n'), ylabel('x(n) ');
title('x(n)');
subplot(3,1,2);
stem(nh, h, 'filled'), xlabel('n'), ylabel('h(n) ');
title('h(n)');
subplot(3,1,3);
stem(ny, y, 'filled'), xlabel('n'), ylabel('y(n) ');
title('y(n) = x(n) * h(n)');

disp("Length of y(n): " + length(y)); % display the length of y(n)
disp("Range over which y(n) is non-zero: " + min(ny) + " to " + max(ny)); % display the range over which y(n) is non-zero
disp("Value at y(n=0): " + y(1)); % display the value at y(n=0)
disp("Value at y(n=10): " + y(11)); % display the value at y(n=10)
