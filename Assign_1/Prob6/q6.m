    clear all; close all;
    small_img = im2double(rgb2gray(imread('F1.jpg')));
    A = im2double(rgb2gray(imread('Faces.jpg')));
    % size of Bigger Image
    [mat1, mat2] = size(A);

    % size of normalize convulation matrix
    res = zeros(mat1 + size(small_img,1) -1, mat2 + size(small_img,2) - 1);

    res(size(small_img,1):size(res,1),size(small_img,2):size(res,2)) = A(:,:);

    % matrix with size of A
    mat = ones(mat1,mat2);
    for i=1:mat1
        for j=1:mat2
            mat(i,j) = 0;
            var = 0;
            for k=1:size(small_img,1)
                for l=1:size(small_img,2)

                    % computing product of overlapped elements
                    mat(i,j) = mat(i,j) + (small_img(k,l) * res(i+k-1,j+l-1));

                    % calculating the sum of squares of overlapped elements
                    var = var + (res(i+k-1,j+l-1))^2;
                end
            end
            mat(i,j) = mat(i,j)/sqrt(var);
        end
    end

    [ypeak, xpeak] = find(mat==max(mat(:)));
    yoffSet = ypeak-size(small_img,1);
    xoffSet = xpeak-size(small_img,2);
    hAx  = axes;
    imshow(A,'Parent', hAx);
    imrect(hAx, [xoffSet+1, yoffSet+1, size(small_img,2), size(small_img,1)]);
    pause(4);
    close all;
    clear all;
