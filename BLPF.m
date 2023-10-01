function resultImage = BLPF(inputImage)
    % Create an image twice the size, pad with zeros
    [M, N] = size(inputImage);
    P = 2 * M;
    Q = 2 * N;
   
    inputImage = im2double(inputImage);
    resultImage = zeros(P, Q);
    for i = 1:P
        for j = 1:Q
            if i <= M && j <= N
                resultImage(i, j) = inputImage(i, j);
            else
                resultImage(i, j) = 0;
            end
        end
    end

    % Transform into frequency space
    fourierImage = fft2(double(resultImage));

    % Create LPF butterworth filter
    H = createBLPFFilter(P, Q);

    % Apply transformation
    fourierImage = fourierImage.*H;

    % Transform back to spatial space
    resultImage = real(ifft2(fourierImage));
    resultImage = resultImage(1:M, 1:N);
end