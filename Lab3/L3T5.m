% Load image X and filter h1
load lab3b;  % X and h1

% Blur image: convolve rows
[n_rows, n_cols] = size(X);
row_blurred = zeros(n_rows, n_cols + length(h1) - 1);
for i = 1:n_rows
    row_blurred(i, :) = conv(X(i, :), h1);
end

% Blur image: convolve columns
[n_rows2, n_cols2] = size(row_blurred);
blurred = zeros(n_rows2 + length(h1) - 1, n_cols2);
for j = 1:n_cols2
    blurred(:, j) = conv(row_blurred(:, j), h1);
end

% Deconvolution: columns then rows
[n_rows3, n_cols3] = size(blurred);
deconv_col = zeros(n_rows3 - length(h1) + 1, n_cols3);
for j = 1:n_cols3
    deconv_col(:, j) = deconv(blurred(:, j), h1);
end

[n_rows4, n_cols4] = size(deconv_col);
restored_cr = zeros(n_rows4, n_cols4 - length(h1) + 1);
for i = 1:n_rows4
    restored_cr(i, :) = deconv(deconv_col(i, :), h1);
end

% Deconvolution: rows then columns
deconv_row = zeros(n_rows3, n_cols3 - length(h1) + 1);
for i = 1:n_rows3
    deconv_row(i, :) = deconv(blurred(i, :), h1);
end

[n_rows5, n_cols5] = size(deconv_row);
restored_rc = zeros(n_rows5 - length(h1) + 1, n_cols5);
for j = 1:n_cols5
    restored_rc(:, j) = deconv(deconv_row(:, j), h1);
end

% Display original, blurred, and both restored images
figure;
subplot(2,2,1);
imagesc(X);
title('Original Image');

subplot(2,2,2);
imagesc(blurred);
title('Blurred Image');

subplot(2,2,3);
imagesc(restored_cr);
title('Restored (Column → Row)');

subplot(2,2,4);
imagesc(restored_rc);
title('Restored (Row → Column)');
