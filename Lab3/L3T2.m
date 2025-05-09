clear all % clears all the variables from the workspace
clf % clears the figure
load lab3a % loads an image from the file
subplot(211), imagesc(y), colormap gray,
title('Blurred Image, y');
h = [0.0392 0.0529 0.0634 0.0714 0.0771 0.0809 0.0832 0.0843 0.0843 0.0834 0.0683 0.0553 0.0442 0.0348 0.0269 0.0202 0.0145 0.0098 0.0059];
[N, M] = size(y);
Xr = [ ]; % create an empty matrix in for the restored image.
for i = 1:N
    Xr = [Xr; deconv(y(i,:), h)]; % Restore the image one row at a time.
end
subplot(212), imagesc(Xr), title('Restored image, Xr');
