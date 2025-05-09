clear all % clears all the variables from the workspace
clf % clears the figure
load gatlin2 % loads an image from the file gatlin2 to matrix X
subplot(221), imagesc(X), colormap gray, title('Original Image, X');
h = ones(1,16)/16; % 1-D blurring filter: (1x16) row vector
Y = conv2(h,X); % 2-D convolution
sigma = 2;
Y = Y + sigma*randn(size(Y));
subplot(222), imagesc(Y);
title('Blurred Image, Y');
[N, M] = size(Y);
Xr = [ ]; % create an empty matrix in for the restored image.
for i = 1:N
    Xr = [Xr; deconv(Y(i,:), h)]; % Restore the image one row at a time.
end
subplot(223), imagesc(Xr), title('Restored image, Xr');
subplot(224), image(abs(Xr - X)), title('Restoration Error, |Xr - X|');