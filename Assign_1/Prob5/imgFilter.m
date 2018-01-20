function f  = imgFilter(im,M)
    figure; imshow(im);
    pause(2);
    
    for i=1:size(im,3)
        r1(:,:,i) = conv2(im(:,:,i),M,'same');
    end
    figure; imshow(r1);
    pause(3);
    
    for i=1:size(im,3)
        r2(:,:,i) = conv2(im(:,:,i),M','same');
    end
    figure; imshow(r2);
    pause(3);
    
    for i=1:size(im,3)
        r3(:,:,i) = im(:,:,i) + uint8(r1(:,:,1)) + uint8(r2(:,:,1));
    end
    figure; imshow(r3);
    pause(3);
    close all;
end