clear all
close all
clc

path = "D:\KV_MMS_voices_repo\children_snimljeno"; %PC Kristian
%path = "C:\KV_MMS_voices_repo\children_snimljeno"; %laptop Kristian

path = "D:\KV_MMS_voices_repo\DAMIR"; %PC Kristian

ext = ".mp3";
N = 100;
freqStep = 0.5;
minF = 62;
maxF = 400;


cd citanje/
files = readFilePaths(path, [""], ext);
cd ../


sizee = size(files);
sizee = sizee(1,1);
if(sizee<N)
    samples = sizee;
    "Dostupno je samo " + samples + " uzoraka."
else
    samples = N;
end


files = files(1:samples, 1);


cd obrada\

for i=1:samples
    [y,Fs] = audioread(files(i), "double");

    y = y(:,1);

    sizeY = size(y);
    sizeY = sizeY(1,1);
    if sizeY/Fs < (1/freqStep)
        "prekratko: " + files(i)
        continue
    end
    try
        [f,a] = furier(y,Fs);
        [f,a] = pojasni_propust(f, a, minF, maxF);
        [f,a] = freqScaling(f,a, freqStep, maxF);
        [f,a] = powerScaling(f, a, 1);
    catch e
        continue
    end

    figure('units','normalized','outerposition',[0 0 1 1])
    plot(f,a);
    xlabel("Frekvencija [Hz]");
    ylabel("Amplituda");
    title(files(i));
    grid

    sound(y,Fs);
    pause(sizeY/Fs + 1);
    close all
end

cd ../