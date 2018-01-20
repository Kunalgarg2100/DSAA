close all;
clear all;
% Filter for detecting edges int the picture, the overall sum is zero %
M = [-1,-2,-1;0,0,0;1,2,1];

% Transpose of the filter %
Mt= transpose(M);
cam = double(imread('cameraman.tif'));
imshow(imread('cameraman.tif'));
pause(3);

%convolution Csame, which is a submatrix of Cfull with the same size as cam
cl = conv2(cam,M,'same');   % Convolution on M %
cl2 = conv2(cam,Mt,'same'); % Convolution on M' %

figure;
imshow(cl,'InitialMagnification','fit');
pause(3);
imshow(cl2,'InitialMagnification','fit');
pause(3);
close all;
clear all;
