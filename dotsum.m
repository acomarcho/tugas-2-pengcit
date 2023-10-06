function result = dotsum(imgSlice, kernel) 
    result = sum(sum(kernel.*imgSlice));
end