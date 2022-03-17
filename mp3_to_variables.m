clc
clear all
initialPath ="D:\KV_MMS\voices_repo\mozilla8";


genders = ["male", "female"];
ageGroups = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];
results = {};

destination = "D:\KV_MMS\voices_repo\mozilla8_loaded";

for i=1:2
    for j=1:9
        path = initialPath +"\" + genders(i) + "\" + ageGroups(j);
        dirs = dir(path);
        sizee = size(dirs);
        sizee = sizee(1,1);
        for k=1:sizee
            if endsWith(dirs(k).name,".mp3")
                if(mod(k,100)==0)
                    k/sizee
                end
                k
                name = path + "\" + dirs(k).name
                [y,Fs] = audioread(name, "double");
                time = size(y);
                time = time(1,1);
                time = time/Fs;
                sound(y,Fs);
                pause(time+1)
                
                fur = fft(y);
                result = {time, Fs, fur};
                results = [results; result];
                
            end

        end
        
        filename = mp3_to_variables + "_" + genders(i) + "_"+ ageGroups(j);
    end
end


%{
    dirs = dir(initialPath);
    tempSize = size(dirs);
    N = tempSize(1,1);
    files = strings([0,1]);
    for i=1:N
        if(dirs(i).isdir == true)
            tempSize = size(foldersToExclude);
            NfoldersEx = tempSize(1,2);
            excludeThis = 0;
            %dirs(i).name
            if strcmp(dirs(i).name, ".") || strcmp(dirs(i).name, "..")
                excludeThis = 1;
                %"remove " + dirs(i).name
            end
            for j=1:NfoldersEx
                if strcmp(dirs(i).name, foldersToExclude(j))
                    excludeThis = 1;
                    %"remove " + dirs(i).name
                end
                
            end
            if(excludeThis == 0)
                path = initialPath + "\" + dirs(i).name;
                filesFromFolder = readFilePaths(path, foldersToExclude, extention);
                files = [files; filesFromFolder];
            end
        elseif endsWith(dirs(i).name, extention) == true
            newFilePath = initialPath + "\" + dirs(i).name;
            files = [files; newFilePath];
        else
            "some useless file"
            dirs(i).name
        end

    end

end

%}