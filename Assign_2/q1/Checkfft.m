function X = Checkfft(A , sz)

figure; imshow(A);
title('Original Image');

% Plotting the image using inbuilt fft2 function
A = imresize(A,[sz sz]);
B = fftshift(fft2(A));
figure, imagesc(mat2gray(log(abs(B)+1))), colormap gray;
title('Using Inbuilt FFT function');

FFT_row = zeros(size(A));
FFT_col = zeros(size(A));

%Perform FFT on each row
for i=1:size(A,1)
    FFT_row(i,:) = recursive_FFT(A(i,:));
end

%Perform FFT on each column
for i=1:size(A,2)
    FFT_col(:,i) = recursive_FFT(FFT_row(:,i).');
end

C = fftshift(FFT_col);
figure, imagesc(mat2gray(log(abs(C)+1))), colormap gray;
title('Using Recursive FFT function');
end
