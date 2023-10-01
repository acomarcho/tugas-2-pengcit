function resultImage = midpointConvolution(image)
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
            min = image(i, j);
            max = image(i, j);

            for k = 1:O
                for l = 1:P
                    % Check if within boundaries of image
                    row = i + k - kernelCenterRow;
                    col = j + l - kernelCenterCol;

                    if row >= 1 && row <= M && col >= 1 && col <= N
                        if image(row, col) < min
                            min = image(row, col);
                        end

                        if image(row, col) > max
                            max = image(row, col);
                        end
                    end
                end
            end

            % Find midpoint
            resultImage(i, j) = (max + min) / 2;
        end
    end
end