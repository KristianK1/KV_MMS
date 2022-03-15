clc
clear all;
folders = [""];
initialPath ="D:\KV_MMS\voices_repo\children";
initialPath ="D:\KV_MMS\voices_repo\mozilla_stuff";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));
result(1);
[y,Fs] = audioread(result(1), "double");  
Fs
sound(y, Fs);
[a, f] = furier(y,Fs);

[f,a] = lowPassFilter(f,a,1000);
[newF, newA] = freqScaling(f,a,0.5, 1000);

time = size(y);
time = time(1,1)/Fs
smallStep = 1/time
subplot(2,1,1);
plot(f,a);
title("old");
subplot(2,1,2);
plot(newF, newA);

title("new");
oldPower = signalPower(a,f,0,-1);
newPower = signalPower(newA, newF,0,-1);
[newA, newF] = powerScaling(newA, newF, 1000);
newPower = signalPower(newA, newF,0,-1);
plot(newF, newA);
