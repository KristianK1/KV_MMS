clear all
close all
clc


N = 2000;
powers = [0.08 0.01 0.012 0.014 0.016 0.018 0.02 0.22 0.024 0.026 0.028 0.03 0.032];


pathMozilla ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
pathChildren ="D:\KV_MMS_voices_repo\laki\"; %PC Kristian

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

    rezM = zeros(freqVectorSize,1);
    rezF = zeros(freqVectorSize,1);
    rezCM = zeros(freqVectorSize,1);
    rezCF = zeros(freqVectorSize,1);

    "M"
    for j=1:nM
        rezM = rezM + FindLowPowerBand(f,Mv(:,j), powers(i));
    end
    
    "F"
    for j=1:nF
        rezF = rezF + FindLowPowerBand(f,Fv(:,j), powers(i));    
    end


    "CM"
    for j=1:nCM
        rezCM= rezCM + FindLowPowerBand(f,CMv(:,j), powers(i));
    end


    "CF"
    for j=1:nCF
        rezCF = rezCF + FindLowPowerBand(f,CFv(:,j), powers(i));    
    end

    rezM = rezM/nM;
    rezF = rezF/nF;
    rezCM = rezCM/nCM;
    rezCF = rezCF/nCF;
    
    figure
    plot(f, [rezM, rezF, rezCM, rezCF])
    title("Power is " + powers(i))

end

cd ..





