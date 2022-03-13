function files = readFilePaths(initialPath, foldersToExclude, extention)

%funkcija vraca popis svih failova unutar "initialPath" foldera koji
%zavrsavaju na "extention" osim ako se nalazi unutar foldera koji je
%naveden u "foldersToExclude"

%povratni argument je "string array"
%kad se zavrsi funckija rezultat se "cita" na sljedeci nacin:

%result = readFilePaths(initialPath, folders, "mp3")

%sizeArray = size(result);
%sizeArray = sizeArray(1,1);
%for i=1:sizeArray
%    result(i)
%end


%prvi argument je tipa
% q = "D:\KV_MMS\voices_repo\testData_easyNames";

%drugi argument je tipa
%q = ["female", "teens", "ime_foldera"];
%pravilo je da ignorira SVE foldere s tim imenom, cak i ako je folder
%nalazi unutar "dopustenog" folfera

%treci argument je tipa
%q= "mp3" (ili ".mp3")
%pravilo je da "ubere" file ako zavrsava na taj string (endsWith funkcija)
    dirs = dir(initialPath);
    tempSize = size(dirs);
    N = tempSize(1,1);
    files = strings([0,1]);
    for i=1:N
        if(dirs(i).isdir == true)
            tempSize = size(foldersToExclude)
            NfoldersEx = tempSize(1,2);
            excludeThis = 0;
            dirs(i).name
            if strcmp(dirs(i).name, ".") || strcmp(dirs(i).name, "..")
                excludeThis = 1;
                "remove " + dirs(i).name
            end
            for j=1:NfoldersEx
                if strcmp(dirs(i).name, foldersToExclude(j))
                    excludeThis = 1;
                    "remove " + dirs(i).name
                end
                
            end
            if(excludeThis == 0)
                path = initialPath + "\" + dirs(i).name
                filesFromFolder = readFilePaths(path, foldersToExclude, extention);
                files = [files; filesFromFolder];
            end
        elseif endsWith(dirs(i).name, extention) == true
            files = [files; dirs(i).name];
        else
            "some useless file"
            dirs(i).name
        end

    end

end