A = imread('trees.tif');
Checkfft(A, 256);

B = imread('cameraman.tif');
Checkfft(B, 256);

C = imread('images/lena512.bmp');
Checkfft(C, 512);
