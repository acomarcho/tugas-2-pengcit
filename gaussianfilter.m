function gaussianfunc = gaussianfilter(stddev)
    arguments
        stddev = 1;
    end
    function result = gaussianf(imgSlice, kernel)
        m = imgSlice * kernel;
        [height, width] = size(kernel);
        indy = -floor(height/2):floor(height/2);
        indx = -floor(width/2):floor(width/2);
        [X, Y] = meshgrid(indx,indy);
        h = exp(-(X.^2 + Y.^2) / (2*stddev*stddev));
        h = h / sum(h(:));
        disp(h*m);
        result = sum(sum(h*m));
    end

    gaussianfunc = @gaussianf;
end