nx = 0:10; % sample index for x
x = 0.5 .^ nx;
nh = -2:2; % sample index for h
h = (nh >= -2) - (nh >= 3);
y = conv(x, h); % length of y is equal to (length of x) + (length of h) - 1
N = length(x) + length(h) -1;
ny = -2:12; % sample index for y

[xr, r] = deconv(y, h); % convert x to decimal

diff = abs(x - xr); % calculate the difference between x and xr

subplot(3,1,1);
stem(nx, x, 'filled'), xlabel('n'), ylabel('x(n) ');
title('x(n)');

subplot(3,1,2);
stem(nx, xr, 'filled'), xlabel('n'), ylabel('y(n) ');
title('xr(n)');

subplot(3,1,3);
stem(nx, diff, 'filled'), xlabel('n'), ylabel('y(n) ');
title('xr(n)');


disp('Difference between x and xr:');
disp(diff); % display the difference