clc
clear all;
close all
folders = [""];
%initialPath ="D:\KV_MMS\voices_repo\children";
initialPath ="D:\KV_MMS\voices_repo\mozilla8\female\fifties";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));
result(1);
[y,Fs] = audioread(result(1), "double");  
Fs
sound(y, Fs);
[f,a] = furier(y,Fs);

[f,a] = lowPassFilter(f,a,1000);
[newF, newA] = freqScaling(f,a,0.5, 1000);

time = size(y);
time = time(1,1)/Fs
smallStep = 1/time
subplot(2,1,1);
plot(f,a);
title("old");
title("Prije frekvencijskog skaliranja");
xlabel("Frekvenija [Hz]");
ylabel("Amplituda");
subplot(2,1,2);
plot(newF, newA);

oldPower = signalPower(a,f,0,-1);
newPower = signalPower(newA, newF,0,-1);
%[newA, newF] = powerScaling(newA, newF, 1000);
newPower = signalPower(newA, newF,0,-1);
plot(newF, newA);
title("Poslije frekvencijskog skaliranja");
xlabel("Frekvenija [Hz]");
ylabel("Amplituda");

%crtanje grafova za dokument

zav_freq = 20;
f1 = zeros(0,0);
a1 = zeros(0,0);
f2 = zeros(0,0);
a2 = zeros(0,0);

for z=1:1000
    if(f(z)<zav_freq)
        f1 = [f1;f(z)];
        a1 = [a1; a(z)];
    else 
        break;
    end
end

for z=1:1000
    if(newF(z)<zav_freq)
        f2 = [f2; newF(z)];
        a2 = [a2 ;newA(z)];
    else 
        break;
    end
end
figure
subplot(2,1,1);
plot(f1,a1);
title("Prije frekvencijskog skaliranja");
xlabel("Frekvenija [Hz]");
ylabel("Amplituda");
subplot(2,1,2);
plot(f2,a2);
title("Poslije frekvencijskog skaliranja");
xlabel("Frekvenija [Hz]");
ylabel("Amplituda");
