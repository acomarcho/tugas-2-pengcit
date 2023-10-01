function resultImage = alphaTrimmedMeanConvolution(image)
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

    % d is the constant where d/2 lowest and d/2 highest values get
    % removed
    d = 4;

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
                    else
                        elements = [elements, 0];
                    end
                end
            end

            % Sort, then remove d/2 lowest and d/2 highest values
            elements = sort(elements);
            elements = elements((d / 2 + 1):(numel(elements) - d / 2));
            % Pixel value is the mean.
            resultImage(i, j) = mean(elements);
        end
    end
end