T0 = 0.04; % period
w0 = 2*pi/T0; % angular frequency

a = zeros(1,41);
for k = -20:20
    fun = @(t) my_triangle(t) .* exp(-j * k * w0 * t); % function integrate
    a(k + 21) = quadl(fun, 0, T0)/T0; % perform numerical integration
end
k = -20:20;
figure;
subplot(211);
stem(k, abs(a),'.');
title('Magnitude of Fourier Coefficients');
subplot(212);
stem(k, angle(a),'.');
title('Phase of Fourier Coefficients');
f = gcf; exportgraphics(f,'L6T1a.png','Resolution',300)

t = 0:0.01:2; % values of t
y = zeros(size(t)); % initialize y to 0, y is a vector same size as t
for k = -20:20
    fun = @(t) my_triangle(t) .* exp(-j * k * w0 * t); % function integrate
    ak = quadl(fun, 0, T0)/T0; % perform numerical integration
    y = y + (ak .* exp(j * w0 * t)); % reconstruct signal using Fourier coefficients
end

figure;
subplot(211);
plot(t, y); % plot reconstructed signals
title('Reconstructed Signal');
subplot(212);
plot(t, my_triangle(t)); % plot original triangle signal
title('Original Signal');
f = gcf; exportgraphics(f,'L6T1b.png','Resolution',300)