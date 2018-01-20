% Reference :- Page 59 of 
% https://ia802707.us.archive.org/23/items/Lectures_on_Image_Processing/EECE_4353_15_Resampling.pdf
% https://stackoverflow.com/a/26143655/7478017
% BilinearInterpolation function which takes two parameters: Image Matrix and scale [rows columns] %
function RESIZE_BilinearInterpolation = bilinearInterpolation(ImageMatrix, scale)

    % Size of original Image
    [row, column, channel] = size(ImageMatrix);  
    
    % Size of scaled Image
    newSize = scale .* [row, column];

    % Scaling factor       
    scale_factor = [row, column] ./ [newSize(1), newSize(2)];
	
    % [X,Y] = meshgrid(x,y) returns 2-D grid coordinates based on the coordinates contained in vectors x and y. 
    % X is a matrix where each row is a copy of x, and Y is a matrix where each column is a copy of y. 
    % The grid represented by the coordinates X and Y has length(y) rows and length(x) columns.
    [cf, rf] = meshgrid(1 : newSize(2), 1 : newSize(1));

    % (rf,cf) are the frcational location in the input image from which
    % to sample the pixel (r,c)
    rf = rf * scale_factor(1);
    cf = cf * scale_factor(2);

    % Integral part of (rf,cf)
    r = floor(rf);
    c = floor(cf);
    
    % Any value out of range that can't be mapped
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > row - 1) = row - 1;
    c(c > column - 1) = column - 1;

    % (delta_R, delta_C) are the fractional part of row and column locations (rf,cf) 
    delta_R = rf - r;
    delta_C = cf - c;

    % linearInd = sub2ind(matrixSize, rowSub, colSub) returns the linear index equivalents 
    % to the row and column subscripts rowSub and colSub for a matrix of size matrixSize.
    % Get column major indices for each point we wish to access
    top_lft = sub2ind([row, column], r, c);
    top_rgt = sub2ind([row, column], r+1,c);
    btm_lft = sub2ind([row, column], r, c+1);
    btm_rgt = sub2ind([row, column], r+1, c+1);       
    
    % Create output image that is the same class as input and of new size
    out = zeros(newSize(1), newSize(2), channel);
    out = cast(out, class(ImageMatrix));

    % loop through each channel to preserve the color of image
    for idx = 1 : channel
        original = double(ImageMatrix(:,:,idx));
        % Calculating the value of each pixel
        temp = original(top_lft).*(1 - delta_R).*(1 - delta_C) + ...
                       original(top_rgt).*(delta_R).*(1 - delta_C) + ...
                       original(btm_lft).*(1 - delta_R).*(delta_C) + ...
                       original(btm_rgt).*(delta_R).*(delta_C);
        out(:,:,idx) = cast(temp, class(ImageMatrix));
    end
    figure;
    imshow(out);
end
