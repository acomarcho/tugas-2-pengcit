function denoisedImage = bandReject(im, D0, w)
    % Assuming im is 8 bit
    [M,N,~] = size(im);
    imp = padarray(im, [M,N],0,"post");
    [P,Q,~] = size(imp);
    imd = im2double(imp);

    fftImd = fftshift(fft2(imd));
    fftImdDisp = log(1+abs(fftImd))/16;
    
    u = 0:(P-1);
    v = 0:(Q-1);

    % Create mesh grid
    idx = find(u > P/2);
    u(idx) = P - u(idx);
    idy = find(v > Q/2);
    v(idy) = Q - v(idy);
    u = P/2 - u;
    v = Q/2 - v;
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);

    % Calculate H
    H = double(D <= (D0 - 1/2*w)) | double(D >= (D0 + 1/2*w));

    fftImdDisp = H.*fftImdDisp;
    fftImd = H.*fftImd;

    imshow(im);
    figure;imshow(fftImdDisp);
    denoisedImage = abs(ifft2(fftshift(fftImd)));
    denoisedImage = denoisedImage(1:M,1:N);
    figure;imshow(denoisedImage);
end