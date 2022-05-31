clearvars -except values
close all
clc

if(~exist("values", "var"))
    "values nema"
    msgboxx = msgbox("Nemate varijablu sa podacima analize");
    pause(2)
    delete(msgboxx)
    [file,path] = uigetfile
    try
        load(path)
    catch
        msgboxx = msgbox("Nije učitana datoteka sa podacima analize - izlazim iz koda");
        pause(2)
        delete(msgboxx)
        return
    end

else
    "ima values"
end

try
    [file,path] = uigetfile("*.*");
catch e
    msgboxx = msgbox("Dogodila se greška prilikom otvaranja file-a");
    pause(2)
    delete(msgboxx)
end

"file"
file
path

if(file == 0)
    msgboxx = msgbox("Nije odabrana datoteka")
    pause(2)
    delete(msgboxx)
else
    probs = Odluka(append(path,file), values)
    [~,I22] = max(probs(4,:),[],'all','linear');
    I22
end






