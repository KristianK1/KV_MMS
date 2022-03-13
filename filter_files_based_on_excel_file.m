clc
try
    temp = excel_data(1,1);
catch error
    "re-reading excel data"
    excel_data = readtable("validated_fitlered_age_gender_first_50000.xlsx");
end
N=50000;
ages = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];
genders = ["male", "female"];


cd C:\KV_MMS\voices_repo\mozilla_stuff;
for i = 1:2
    mkdir(genders(i))
    cd (genders(i))
    for j=1:9
        mkdir (ages(j));
    end
    cd ..
end

for i=1:N
    if(mod(i,1000)==0)
        i
    end
    try
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

        s = "D:\Downloads\en\en\clips\" + file_name;
        d = "C:\KV_MMS\voices_repo\mozilla_stuff\" + gender + "\" + ageGroup;
        copyfile(s,d);

    catch error
        "fejlo sam na liniji " + i
    end
    %rethrow(error);
end
%cd D:\Downloads\en\en\clips;
%cd C:\KV_MMS\voices_repo\mozilla_stuff;
cd C:\KV_MMS;