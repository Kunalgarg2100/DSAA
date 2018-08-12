% function [Timefreq] = q3(x,Fs, window, overlap)
clear all;
close all;
load laughter;
A = myspectrogram(y, 250,100);
B = spectrogram(y, 250, 100);
figure, imshow(B);

A = myspectrogram(y, 700,300);
B = spectrogram(y, 700, 300);
figure, imshow(B);

clear all;
load train;
A = myspectrogram(y, 250,200);
B = spectrogram(y, 250, 200);
figure, imshow(B);

A = myspectrogram(y, 100,90);
B = spectrogram(y, 100, 90);
figure, imshow(B);
