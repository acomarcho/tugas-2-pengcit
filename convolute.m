function resultImage = convolute(inputImage, kernel)
    inputImage = im2double(inputImage);

    % Get size of input image and kernel
    [imageHeight, imageWidth] = size(inputImage);
    [kernelHeight, kernelWidth] = size(kernel);

    % Initialize resultImage
    resultImage = zeros(imageHeight, imageWidth);

    % Get center of kernel
    kernelCenterRow = floor(kernelHeight / 2) + 1;
    kernelCenterCol = floor(kernelWidth / 2) + 1;

    % Perform convolution
    for i = 1:imageHeight
        for j = 1:imageWidth
            % Initialize sum
            sum = 0;

            for k = 1:kernelHeight
                for l = 1:kernelWidth
                    % Check if within boundaries of image
                    row = i + k - kernelCenterRow;
                    col = j + l - kernelCenterCol;

                    if row >= 1 && row <= imageHeight && col >= 1 && col <= imageWidth
                        sum = sum + inputImage(row, col) * kernel(k, l);
                    end

                    % If outside of bounds, sum is not increased,
                    % this follows zero padding principle.
                end
            end

            % Update pixel value
            resultImage(i, j) = sum;
        end
    end
end