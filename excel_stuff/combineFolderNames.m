function folderNames = combineFolderNames(folders)
    sizee = size(folders);
    NofIterations = sizee(1,1);
    currentLevel = folders(1);
    currentLevel = currentLevel{1,1};

    Nfolders = size(currentLevel);
    Nfolders = Nfolders(1,2);

    folderNames = strings([0,1]);
    for i=1:Nfolders
        currentFolderName = currentLevel(1, i);
        if(NofIterations>1)
            "hello";
            folderNames = [folderNames; currentFolderName + "\" + combineFolderNames( folders(2:NofIterations, 1))];
        else
            folderNames = [folderNames; currentFolderName];
        end
    end
end