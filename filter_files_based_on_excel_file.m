clc
clear all

excel_folderPath = "D:\KV_MMS\validated_fitlered_age_gender_first_50000.xlsx";
excel_folderPath = "D:\cv-corpus-8.0-2022-01-19-en\cv-corpus-8.0-2022-01-19\en\validated.tsv";
files_currentPath = "D:\Downloads\en\en\clips";
files_destinationPath = "D:\KV_MMS\voices_repo\test_filtering";

if ~isfile(excel_folderPath)
    ME = MException("MATLAB:test", "Navedena datoteka ne postoji");
    throw(ME);
end

genders = ["male", "female"];
ageGroup = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];
folders = {genders; ageGroup};
folderNames = combineFolderNames(folders);

makeDirectories(files_destinationPath, folderNames);

excel_data = tdfread(excel_folderPath, "\t");

N = size(excel_data)
N = N(1,1);

for i=2:N
    pause(1);
    if(mod(i,100000)==0)
        i/N*100;
    end
    try
        ageGroup = "";
        gender = "";
        excel_data_now = excel_data(i,:);
        file_name = excel_data_now.(2) + ".mp3";

        for ii=1:9
            if(strcmp(ages(ii), excel_data_now.(6)))
                ageGroup = ages(ii);
            end
        end

        for ii=1:2
            if(strcmp(genders(ii), excel_data_now.(7)))
                gender = genders(ii);
            end
        end
        if(strcmp("", gender) || strcmp("", ageGroup))
            continue;
        end

        s = files_currentPath + "\" + file_name;
        d = files_destinationPath + "\" + gender + "\" + ageGroup;
        copyfile(s,d);

    catch error
        "fejlo sam na liniji " + i
    end
    %rethrow(error);
end


%}