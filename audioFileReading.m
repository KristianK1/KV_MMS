function a = audioFileReading(filePaths)
    sizee = size(filePaths);
    sizee = sizee(1,1)
    a = {};
    for i=1:sizee
        if(mod(i,500)==0)
            i/sizee
        end
        [y,~] = audioread(filePaths(i), "double");
        
        a = [a;y];
    end

end