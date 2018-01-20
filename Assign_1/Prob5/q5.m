clear all;
close all;
M = [1, 2, 1;0, 0 ,0;-1 ,-2 ,-1];

im = imread('sample_inp.png');
for i=1:size(im,3)
    out(:,:,i) = conv2(im(:,:,i),M,'same');
end
figure; imshow(out);   
pause(3);
imgFilter(imread('blur.jpg'),M);
imgFilter(imread('coloured.jpg'),M);
imgFilter(imread('onion.png'),M);
imgFilter(imread('matlab.jpg'),M);
clear all;
close all;
