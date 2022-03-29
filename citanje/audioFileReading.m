function a = audioFileReading(filePaths, len)
    sizee = size(filePaths);
    sizee = sizee(1,1)
    a = {};
    for i=1:sizee
        [y,Fs] = audioread(filePaths(i), "double");
        sizeY = size(y);
        sizeY = sizeY(1,2);
        if sizeY/Fs > len
            a = [a;y];
        end
    end

end