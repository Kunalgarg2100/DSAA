% Nearest Neighbour function which takes two parameters: Image Matrix and scale [rows columns] %
% scale(1) -> how much the row size be increased %
% scale(2) -> how much the column size be increased %

function RESIZE_NearestNeighbour = nearestNeighbour(ImageMatrix, scale) 
    
    % Size of original Image
    [row,column,~] = size(ImageMatrix);  
    
    % Size of resized Image
    newSize = scale .* [row,column];

    % Compute each index of new Image in terms of indices of Old Image
    rowInd = int64(min(round((1:newSize(1)) ./ scale(1)+1), row));
    colInd = int64(min(round((1:newSize(2)) ./ scale(2)+1), column));
    
    % We now access the corresponding indices from Old Image to get New Image:
    newImage = ImageMatrix(rowInd,colInd,:);
    figure;
    imshow(newImage);
end
