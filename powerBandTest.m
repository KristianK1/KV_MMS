clear all
close all
clc


N = 2000;
powers = [0.08 0.01 0.012 0.014 0.016 0.018 0.02 0.22 0.024 0.026 0.028 0.03 0.032];


path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\laki"; %PC Kristian

%path = "C:\KV_MMS_voices_repo\mozilla_stuff"; %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\children_max"; %Lenovo Kristian

foldersIgnore = ["female"];

[Mv,f] = loadReadAnalize(pathMozilla, ["female"], ".mp3", N, 0.5,61,400);
[Fv,f] = loadReadAnalize(pathMozilla, ["male"], ".mp3", N, 0.5,61,400);
[CMv,f] = loadReadAnalize(pathChildren, ["female"], ".mp3", N, 0.5,61,400);
[CFv,f] = loadReadAnalize(pathChildren, ["male"], ".mp3", N, 0.5,61,400);

nM = size(Mv);
nM = nM(1,2);

nF = size(Fv);
nF = nF(1,2);

nCM = size(CMv);
nCM = nCM(1,2);

nCF = size(CFv);
nCF = nCF(1,2);

nPowers = size(powers);
nPowers = nPowers(1,2);

freqVectorSize = size(f);
freqVectorSize = freqVectorSize(1,1);



cd obrada\

for i = 1:nPowers

    Mrez = zeros(freqVectorSize,1);
    Frez = zeros(freqVectorSize,1);
    CMrez = zeros(freqVectorSize,1);
    CFrez = zeros(freqVectorSize,1);

    "M"
    for j=1:nM
        Mrez = Mrez + FindLowPowerBand(f,Mv(:,j), powers(i));
    end
    
    "F"
    for j=1:nF
        Frez = Frez + FindLowPowerBand(f,Fv(:,j), powers(i));    
    end


    "CM"
    for j=1:nCM
        CMrez= CMrez + FindLowPowerBand(f,CMv(:,j), powers(i));
    end


    "CF"
    for j=1:nCF
        CFrez = CFrez + FindLowPowerBand(f,CFv(:,j), powers(i));    
    end

    Mrez = Mrez/nM;
    Frez = Frez/nF;
    CMrez = CMrez/nCM;
    CFrez = CFrez/nCF;
    
    figure
    plot(f, [Mrez, Frez, CMrez, CFrez])
    title("Power is " + powers(i))

end

cd ..





