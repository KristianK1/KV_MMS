function files = readFilePaths(initialPath, foldersToExclude, extention)
    if(initialPath == 1)
        cd "voices_repo\testData";
    end
    %files = string([50000,1]);
    resultSize = 0;
    dirs = dir;
    tempSize = size(dirs);
    N = tempSize(1,1);
    for i=1:N
        if(dirs(i).isdir == true)
            tempSize = size(foldersToExclude);
            NfoldersEx = tempSize(1,1);
            excludeThis = 0;
            for j=1:NfoldersEx
                if strcmp(dirs(i).name, foldersToExclude(j))
                    excludeThis = 1;
                end
            end
            if(excludeThis == 0)
                cd(dirs(i));
                    filesFromFolder = readFilePaths(0, foldersToExclude, extention);
                    files = [files; filesFromFolder]
                cd ..
            end
        elseif endsWith(dirs(i).name, extention) == true
            resultSize = resultSize + 1;
            files(resultSize) = dirs(i).name;
        else
            "some useless file"
            dirs(i).name
        end

    end

end