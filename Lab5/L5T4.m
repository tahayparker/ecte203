A = [1 -1.2 0.85];
B = [1 0 0];

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

zplane(B,A);
[H,w] = freqz(B,A,100);
magH = abs(H);
phaH = angle(H);
subplot(2,1,1);
plot(w/pi,magH);
grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response');
subplot(2,1,2);
plot(w/pi,phaH/pi);
grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response');