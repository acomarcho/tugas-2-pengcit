function result = dotmean(imgSlice, kernel)
    result = mean(mean(imgSlice * kernel));
end