[snd, Fs] = audioread('lab3w.wav');

load lab3b.mat

filtered_h2 = conv(snd, h2, 'same');
filtered_h3 = conv(snd, h3, 'same');

subplot(3,2,1);
plot(snd);
title('Original Sound');

subplot(3,2,2);
plot(filtered_h2);
title('Sound Filtered with h2');

subplot(3,2,3);
plot(filtered_h3);
title('Sound Filtered with h3');

subplot(3,2,4);
stem(h2);
title('Impulse Response h2');

subplot(3,2,5);
stem(h3);
title('Impulse Response h3');

subplot(3,2,6);
plot(10*h3);
title('Amplified h3 Impulse Response (10x)');


%% Listen to all signals

disp('Playing original sound...');
sound(snd, Fs);
pause(3);

disp('Playing sound filtered with h2...');
sound(filtered_h2, Fs);
pause(3);

disp('Playing sound filtered with h3...');
sound(filtered_h3, Fs);
pause(3);

disp('Playing impulse response h2...');
sound(10*h2, Fs);
pause(3);

disp('Playing amplified impulse response h3...');
sound(h3, Fs);