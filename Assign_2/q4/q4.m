close all;
clear all;

% Read the Image
imageA = imread('images/Img1a.png');
fft_red = fftshift(fft2(imageA(:,:,1)));
fft_green = fftshift(fft2(imageA(:,:,2)));
fft_blue = fftshift(fft2(imageA(:,:,3)));
fftA = cat(3, fft_red, fft_green, fft_blue);
% Show the FFT image
figure, imagesc(uint8(abs(fftA))), colormap gray;
title('Image 1A FFT2-Magnitude');


imageB = imread('images/Img1b.png');
fft_red = fftshift(fft2(imageB(:,:,1)));
fft_green = fftshift(fft2(imageB(:,:,2)));
fft_blue = fftshift(fft2(imageB(:,:,3)));
fftB = cat(3, fft_red, fft_green, fft_blue);
figure, imagesc(uint8(abs(fftB))), colormap gray;
title('Image 1B FFT2-Magnitude');

imageC = imread('images/Img2a.png');
fft_red = fftshift(fft2(imageC(:,:,1)));
fft_green = fftshift(fft2(imageC(:,:,2)));
fft_blue = fftshift(fft2(imageC(:,:,3)));
fftC = cat(3, fft_red, fft_green, fft_blue);
% mat2gray converts matrix to intensity image.
figure, imagesc(mat2gray(abs(fftC))), colormap gray;
title('Image 2A FFT2-Magnitude');
figure, imagesc(mat2gray(log(abs(fftC)+1))), colormap gray;
title('Image 2A log(FFT2-Magnitude)');

imageD = imread('images/Img2b.png');
fft_red = fftshift(fft2(imageD(:,:,1)));
fft_green = fftshift(fft2(imageD(:,:,2)));
fft_blue = fftshift(fft2(imageD(:,:,3)));
fftD = cat(3, fft_red, fft_green, fft_blue);
figure, imagesc(mat2gray(abs(fftD))), colormap gray
title('Image 2B FFT2-Magnitude');
figure, imagesc(mat2gray(log(abs(fftD)+1))), colormap gray
title('Image 2B log(FFT2-Magnitude)');

% Denoise the Img3 %
clear all;
close all;
DenoiseImg('images/Img3.png');