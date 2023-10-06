function result = deblur(blurredImage, sigma)
    estimatedPSF = fspecial('gaussian', [10, 10], sigma);
    result = deconvlucy(blurredImage, estimatedPSF, 15);
end