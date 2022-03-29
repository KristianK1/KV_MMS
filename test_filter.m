clc
clear all
folders = ["female","teens"];


initialPath ="D:\KV_MMS\voices_repo\mozilla8";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));

[y,Fs] = audioread(result(1), "double");

[f,a] = furier(y,Fs);

[f1,a1] = lowPassFilter(f,a,1000);
[f2,a2] = highPassFilter(f1,a1,50);

figure
plot(f,a);


figure
plot(f1,a1);


figure
plot(f2,a2);
