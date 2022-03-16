function makeDirectories(destination, folders)
    %destination -> "D:\KV_MMS" - for example
    %folders -> horizontal array of folderPaths that need to be made ->
    %["dir1", "dir2", "dir1\dir2\dir3"] 
    sizee = size(folders);
    sizee = sizee(1,1);
    for i=1:sizee
        directoryPath = destination + "\" + folders(i,1);
        if ~exist(directoryPath, 'dir')
            mkdir(directoryPath);
        end
    end
end