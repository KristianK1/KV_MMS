clc
clearvars -except excel_data

%excel_folderPath = "D:\KV_MMS\validated_fitlered_age_gender_first_50000.xlsx";
excel_folderPath = "D:\cv-corpus-8.0-2022-01-19-en\cv-corpus-8.0-2022-01-19\en\validated.tsv";

files_currentPath = "D:\cv-corpus-8.0-2022-01-19-en\cv-corpus-8.0-2022-01-19\en\clips";
files_destinationPath = "D:\KV_MMS\voices_repo\mozilla8";

if ~isfile(excel_folderPath)
    ME = MException("MATLAB:test", "Navedena datoteka ne postoji");
    throw(ME);
end

genders = ["male", "female"];
ageGroups = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];
folders = {genders; ageGroups};
folderNames = combineFolderNames(folders);

makeDirectories(files_destinationPath, folderNames);
try
    excel_data(1,1)
catch
    "ponovo hvatam podatke iz excela"
    excel_data = tdfread(excel_folderPath, "\t");
end

N = size(excel_data.path)
N = N(1,1);
"ucitano"




for i=1:N
    
    if(mod(i,10000)==0)
        i/N*100
    end
    try


        file_name = excel_data.path(i,:);
        file_name = file_name(find(~isspace(file_name)));
        
        
        age = excel_data.age(i,:);
        age = age(find(~isspace(age)));

        gender = excel_data.gender(i,:);
        gender = gender(find(~isspace(gender)));

        if strcmp("", gender) || strcmp("", age)
            continue;
        end

        for ii=1:9
            if strcmp(ageGroups(ii), age)
                ageGroupWrite = ageGroups(ii);
                break;
            end
        end

        for ii=1:2
            if strcmp(genders(ii), gender)
                genderWrite = genders(ii);
                break
            end
        end

        if strcmp("", genderWrite) || strcmp("", ageGroupWrite)
            continue;
        end

        
        s = files_currentPath + "\" + file_name;
        d = files_destinationPath + "\" + genderWrite + "\" + ageGroupWrite;
        copyfile(s,d);
        %pause(2);
    catch error
        "fejlo sam na liniji " + i
        rethrow(error);
    end
end
"end"
