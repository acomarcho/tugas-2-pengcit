function result = dotsum(imgSlice, kernel) 
    result = sum(sum(imgSlice * kernel));
end