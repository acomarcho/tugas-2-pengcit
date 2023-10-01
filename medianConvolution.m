function resultImage = medianConvolution(image)
    % Read image
    image = im2double(image);

    % Get image size
    [M, N] = size(image);

    % Initialize resultImage
    resultImage = zeros(M, N);

    % Set kernel size (O rows, P cols)
    O = 3;
    P = 3;

    % Calculate center
    kernelCenterRow = floor(O / 2) + 1;
    kernelCenterCol = floor(P / 2) + 1;

    % Perform convolution
    for i = 1:M
        for j = 1:N
            % Initialize elements
            elements = [];

            for k = 1:O
                for l = 1:P
                    % Check if within boundaries of image
                    row = i + k - kernelCenterRow;
                    col = j + l - kernelCenterCol;

                    if row >= 1 && row <= M && col >= 1 && col <= N
                        elements = [elements, image(row, col)];
                    end
                end
            end

            % Sort and find the median
            resultImage(i, j) = median(sort(elements));
        end
    end
end