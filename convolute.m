function resultImage = convolute(inputImage, kernel, kernelfunc)
    % Default arguments
    arguments
        inputImage
        kernel
        kernelfunc = @dotsum;
    end
    
    % Turn image into double
    inputImage = im2double(inputImage);

    % Get size of input image and kernel
    [imageHeight, imageWidth, channel] = size(inputImage);
    [kernelHeight, kernelWidth] = size(kernel);

    heightShift = floor(kernelHeight/2) + 1;
    widthShift = floor(kernelWidth/2) + 1;

    % Initialize resultImage
    resultImage = zeros(imageHeight, imageWidth, channel);
    
    % Pad Image
    paddedImage = padarray(inputImage, [heightShift - 1, widthShift - 1], 0, "both");

    % Perform convolution
    for i = 1:imageHeight
        for j = 1:imageWidth
            imgSlice = paddedImage(i:i+kernelHeight - 1,j:j+kernelWidth - 1,:);
            resultImage(i, j, :) = kernelfunc(imgSlice, kernel);
        end
    end
    resultImage = uint8(resultImage(1:imageHeight, 1:imageWidth,:) * 255);
end