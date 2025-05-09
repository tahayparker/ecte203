nx = 3:8; % index for x
x = ones(size(nx));
nh = 0:10; % index for h
h = 0.7 .^ nh;
y = conv(x, h); % length of y is equal to (length of x) + (length of h) - 1
N = length(x) + length(h) -1;
ny = 3:18; % index for y
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
