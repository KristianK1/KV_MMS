clc
clear all
initialPath ="D:\KV_MMS\voices_repo\mozilla8_repeat";

genders = ["male", "female"];
ageGroups = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];

destination = "D:\KV_MMS\voices_repo\mozilla8_loaded";

folders = {genders; ageGroups};
folderNames = combineFolderNames(folders);

makeDirectories(destination, folderNames);

for i=1:2
    for j=1:9
        path = initialPath +"\" + genders(i) + "\" + ageGroups(j);
        dirs = dir(path);
        sizee = size(dirs);
        sizee = sizee(1,1);
        results = {};
        for k=1:sizee
            
            if endsWith(dirs(k).name,".mp3")
                if(mod(k,100)==0)
                    percentage = k/sizee*100
                end
                name = path + "\" + dirs(k).name;
                [y,Fs] = audioread(name, "double");
                time = size(y);
                time = time(1,1);
                time = time/Fs;
                
                fur = fft(y);
                result = {time, Fs, fur};
                results = [results; result];
                
            end

            if(mod(k, 100)==0 && k~=0)
                filename = destination + "\"+ genders(i) + "\" +ageGroups(j) + "\" + "mp3_to_variables" + "_" + k +".mat";
                save(filename, "results");
                results = {};
            elseif k==sizee
                filename = destination + "\"+ genders(i) + "\" +ageGroups(j) + "\" + "mp3_to_variables" + "_" + k +".mat";
                save(filename, "results");
                results = {};
            end
        end
        
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