clc
clear all
folders = ["female","teens"];


%initialPath ="C:\KV_MMS\voices_repo\mozilla8";
initialPath ="C:\KV_MMS\voices_repo\mozilla_stuff";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));

[y,Fs] = audioread(result(1), "double");

[f,a] = furier(y,Fs);

%[f1,a1] = lowPassFilter(f,a,1000);
%[f2,a2] = highPassFilter(f1,a1,50);
[f2,a2] = pojasni_propust(f,a,50,1000);

figure
plot(f,a);


figure
plot(f2,a2);


%figure
%plot(f2,a2);
