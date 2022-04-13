clc
clearvars -except femaleAvg
folders = ["male"];
%initialPath ="D:\KV_MMS\voices_repo\children";
%initialPath ="D:\KV_MMS\voices_repo\mozilla8";
initialPath ="C:\KV_MMS_voices_repo\mozilla_stuff";

result = readFilePaths(initialPath, folders, "mp3");
"readPaths"
result = result(randperm(numel(result)));
Nsamples = 0;
avgs = zeros(100, 1);
sizee = size(result);
sizee = sizee(1,1);

wantedSamples = 1000;
if sizee>wantedSamples
    samples = wantedSamples;
else
    samples = sizee;
end
samples
i = 0;
while (Nsamples < wantedSamples)
    i = i + 1;
    if(mod(i,100)==0)
        i
    end
    [y,Fs] = audioread(result(i), "double");
    time = size(y);
    time = time(1,1)/Fs;
    %sound(y,Fs);
    %pause(time + 1);
    if(time<=2)
        if(Nsamples<=wantedSamples)
            "nastavljeno"
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
    avg=FindLowPowerBand(newF, newA, 0.02);
    avgs = avgs + avg;
   
end


%listaQ = lista .* lista;
%listaQ = transpose(sum(transpose(listaQ)));
%listaQ = listaQ./Nsamples;
%listaQ = listaQ .^0.5;
figure
plot(newF, avgs);

%title("osim " + folders(1,1) + " and "  +folders(1,2));
