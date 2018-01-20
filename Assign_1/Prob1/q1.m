% 300 * 300 Curve Image %
f1 = imread('curves.jpg');
figure; imshow(f1);
pause(3);
RESIZENN(f1, [2,2])
pause(3);
RESIZEBL(f1, [2,2])
pause(3);
RESIZENN(f1, [3,3])
pause(3);
RESIZEBL(f1, [3,3])
pause(3);
close all;

% Black and White Image %
f2 = imread('blackandwhite.jpg');
figure; imshow(f2);
pause(3);
RESIZENN(f2, [2,2])
pause(3);
RESIZEBL(f2, [2,2])
pause(3);
RESIZENN(f2, [4,4])
pause(3);
RESIZEBL(f2, [4,4])
pause(3);
close all;

% Colored Image %
f3 = imread('onion.png');
figure; imshow(f3);
RESIZENN(f3, [2,2]);
pause(3);
RESIZEBL(f3, [2,2]);
pause(3);
RESIZENN(f3, [5,5])
pause(3);
RESIZEBL(f3, [5,5])
pause(3);
close all;