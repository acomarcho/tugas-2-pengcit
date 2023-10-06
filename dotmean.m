function result = dotmean(imgSlice, kernel)
    result = mean(mean(kernel.*imgSlice));
end