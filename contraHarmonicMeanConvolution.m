function resultImage = contraHarmonicMeanConvolution(image)
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

    % Set Q, the filter order
    Q = 2;

    % Perform convolution
    for i = 1:M
        for j = 1:N
            % Initialize elements
            numerator = 0;
            denumerator = 0;

            for k = 1:O
                for l = 1:P
                    % Check if within boundaries of image
                    row = i + k - kernelCenterRow;
                    col = j + l - kernelCenterCol;

                    if row >= 1 && row <= M && col >= 1 && col <= N
                        numerator = numerator + image(row, col) ^ (Q + 1);
                        denumerator = denumerator + image(row, col) ^ Q;
                    end
                end
            end

            % Find mean (Q is the order)
            resultImage(i, j) = numerator / denumerator;
        end
    end
end