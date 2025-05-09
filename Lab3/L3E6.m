A = [1 -1.6 1];
B = [1 -0.25];
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
zplane(B,A);

if all(r < (1 - eps))  % Stability check
    disp('The system is stable.');
else
    disp('The system is unstable.');
end