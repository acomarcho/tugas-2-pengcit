function filteredImage = HBF(inputImage, A)
    arguments
        inputImage;
        A = 2;
    end

    % Convert image to double precision for calculations
    inputImage = im2double(inputImage);

    [M, N, ~] = size(inputImage);
    P = M * 2;
    Q = N * 2;

    paddedImage = padarray(inputImage, [M,N], 0, 'post');

    % Perform Fourier Transform
    F = fft2(paddedImage);

    % Create the high-boost filter in the frequency domain
    Hlp = createBLPFFilter(P,Q);
    H = A * ones(P, Q);
    H = H - Hlp;

    % Apply the high-boost filter in the frequency domain
    filteredImageF = H.*F;

    % Perform Inverse Fourier Transform
    filteredImageI = abs(ifft2(filteredImageF));

    % Normalize the output image to the range [0, 255]
    filteredImage = uint8(filteredImageI(1:M, 1:N,:) * 255);
end