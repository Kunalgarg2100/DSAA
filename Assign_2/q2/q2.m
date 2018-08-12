clear all;
close all;

% Getting X, Fs
aud = load('q2.mat');
X = aud.X;
Fs = aud.Fs;

% Doing Fourier Transform
Y = fftshift(fft(X));
l = length(Y);
P1 = abs(Y);
f =  (-l/2:l/2 -1);
figure;
plot(f,P1);
title('Fourier transform of original signal');

% Figure out the X values for filtering from the plot
f1 = 885;
f2 = 1325;
r = 10;

% Making band pass filter
rectangle = zeros(l,1);
rectangle(l/2 + f1 -r:l/2 + f1 +r) = 1;
rectangle(l/2 + f2 -r:l/2 + f2 +r) = 1;
rectangle(l/2 - f1 -r:l/2 - f1 +r) = 1;
rectangle(l/2 - f2 -r:l/2 - f2 +r) = 1;

% Multiplying the fft of original signal by filter
Y1 = Y.*rectangle;
P2 = abs(Y1);
figure;
plot(f,P2);
title('Fourier transform of filtered signal');

% Performing Ifft of filtered signal
y_rect = ifft(ifftshift(Y1));
sound(y_rect,Fs);