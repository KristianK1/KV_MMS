clc
clear all
close all
folders = ["female","teens"];
cd ..
cd citanje/

%initialPath ="C:\KV_MMS\voices_repo\mozilla8";
initialPath ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian

result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));

[y,Fs] = audioread(result(1), "double");

cd ..
cd obrada/
[f,a] = furier(y,Fs);

%[f1,a1] = lowPassFilter(f,a,1000);
%[f2,a2] = highPassFilter(f1,a1,50);
[f2,a2] = pojasni_propust(f,a,50,1000);

figure
plot(f,a);
title("prije filtriranja");
xlabel("frekvencija [Hz]")
ylabel("amplituda")
grid
figure
plot(f2,a2);
title("poslije filtriranja");
xlabel("frekvencija [Hz]")
ylabel("amplituda")
grid
%figure
%plot(f2,a2);
