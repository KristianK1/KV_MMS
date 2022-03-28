clc
clear all
foldersM = ["female","teens"];
foldersF = ["male","teens"];

initialPath ="D:\KV_MMS\voices_repo\mozilla8";

initialPathChi ="D:\KV_MMS\voices_repo\children";
resultC = readFilePaths(initialPathChi, [""], "wav");

resultF = readFilePaths(initialPath, foldersF, "mp3");
resultF = resultF(randperm(numel(resultF)));

resultM = readFilePaths(initialPath, foldersM, "mp3");
resultM = resultM(randperm(numel(resultM)));


wantedSamples = 100;

sizee = size(resultC);
N_C_samples = sizee(1,1);

sizee = size(resultM);
sizee = sizee(1,1);

sizee2 = size(resultM);
sizee2 = sizee2(1,1);

if sizee>wantedSamples
    samples = wantedSamples;
else
    samples = sizee;
end

if sizee2<samples
    samples = sizee2;
end


totalResult = {};

i = 0;

powers = [0.02, 0.04, 0.06,0.1, 0.2, 0.8, 0.9, 0.92, 0.94, 0.96, 0.98];
nIterations = size(powers);
nInterations = nIterations(1,2);

maxF = 500;
freqStep = 5;

for j=1:nInterations
    Nsamples = 0;
    i=0;
    powers(j)

    avgC = zeros(maxF/freqStep, 1);
    avgF = zeros(maxF/freqStep, 1);
    avgM = zeros(maxF/freqStep, 1);
    "C"
    while(Nsamples<N_C_samples)
        i = i + 1;
        [y,Fs] = audioread(resultC(i), "double");

        Nsamples = Nsamples + 1;
        [f,a] = furier(y,Fs);
        [f,a] = lowPassFilter(f,a,500);
        [f,a] = highPassFilter(f,a,50);
        
        [newF, newA] = freqScaling(f,a,freqStep, maxF);
        [newF, newA] = powerScaling(newF,newA,1);
        %avg=averageFreq(newF, newA);
        avgg=FindLowPowerBand(newF, newA, powers(1, j));
        avgC = avgC + avgg;
    end

    Nsamples = 0;
    i=0;
    "F"
    while (Nsamples < wantedSamples)
        i = i + 1;
        [y,Fs] = audioread(resultF(i), "double");
        time = size(y);
        time = time(1,1)/Fs;
        %sound(y,Fs);
        %pause(time + 1);
        if(time<=3)
            %osim za children
            if(Nsamples<=wantedSamples)
                %"nastavljeno"
                continue;
            end
        end
        Nsamples = Nsamples + 1;
        [f,a] = furier(y,Fs);
        [f,a] = lowPassFilter(f,a,500);
        [f,a] = highPassFilter(f,a,50);
        
        [newF, newA] = freqScaling(f,a,freqStep, maxF);
        [newF, newA] = powerScaling(newF,newA,1);
        %avg=averageFreq(newF, newA);
        avgg=FindLowPowerBand(newF, newA, powers(1, j));
        avgF = avgF + avgg;
    end

    Nsamples = 0;
    i=0;
    "M"
     while (Nsamples < wantedSamples)
        i = i + 1;
        [y,Fs] = audioread(resultM(i), "double");
        time = size(y);
        time = time(1,1)/Fs;
        %sound(y,Fs);
        %pause(time + 1);
        if(time<=3)
            %osim za children
            if(Nsamples<=wantedSamples)
                %"nastavljeno"
                continue;
            end
        end
        Nsamples = Nsamples + 1;
        [f,a] = furier(y,Fs);
        [f,a] = lowPassFilter(f,a,500);
        [f,a] = highPassFilter(f,a,50);
        
        [newF, newA] = freqScaling(f,a,5, 500);
        [newF, newA] = powerScaling(newF,newA,1);
        %avg=averageFreq(newF, newA);
        avgg=FindLowPowerBand(newF, newA, powers(1, j));
        avgM = avgM + avgg;
    end

    totalIterationResult = {powers(1,j) , avgF, avgM};
    totalResult = [totalResult; totalIterationResult];
    figure
    temp = [avgF, avgM, avgC];
    plot(newF, temp);

    
    title("power is  " + powers(1, j));
end
