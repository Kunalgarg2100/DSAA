function [result] = DenoiseImg(fileName)
noise_image = imread(fileName);

% Plotting fft of the orignal image
fft_red = fftshift(fft2(noise_image(:,:,1)));
fft_green = fftshift(fft2(noise_image(:,:,2)));
fft_blue = fftshift(fft2(noise_image(:,:,3)));
fft_noise_image = cat(3, fft_red, fft_green, fft_blue);
figure, imagesc(mat2gray(log(abs(fft_noise_image))+1)), colormap gray
title('FFT of original Image');

row = size(noise_image, 1);
col = size(noise_image, 2);
% Making filter with ones everywhere
filter = double(ones(row,col));

% Applying filter on rows at interval of 50
b1 = 50;
for i=b1:b1:row-2
    filter(i-1:i+1,:) = 0.0;
end

% Applying filter along columns at interval of 10
b2 = 10;
for i=b2:b2:col-2
    filter(:,i-1:i+1) = 0.0;
end

% Applying filter at the centre
filter(:,130:132) = 1.0;
filter(1:97,130:132) = 0.0;
filter(103:end,130:132) = 0.0;
filter(100,1:120) = 0.0;
filter(100,135:end) = 0.0;

% Plotting fft of the filtered image
filtered_red = fft_red.*filter;
filtered_green = fft_green.*filter;
filtered_blue = fft_blue.*filter;
filtered_noise_image = cat(3, filtered_red, filtered_green, filtered_blue);
figure; imagesc(mat2gray(log(abs(filtered_noise_image)+1))) , colormap gray;
title('FFT of filtered Image');

% Taking the inverse fourier transform to take reconstructed signal back into time domain.
red = (abs(ifft2(ifftshift(filtered_red))));
green = (abs(ifft2(ifftshift(filtered_green))));
blue = (abs(ifft2(ifftshift(filtered_blue))));
result = cat(3, uint8(red), uint8(green), uint8(blue));
figure;
imshow(result);
title('Denoised Image');
end