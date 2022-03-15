clc
clear all;
folders = ["male","teens"];
%initialPath ="D:\KV_MMS\voices_repo\children";
initialPath ="D:\KV_MMS\voices_repo\mozilla_stuff";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));
Nsamples = 0;
lista = zeros(2000, 0);
figure
sizee = size(result);
sizee = sizee(1,1)
if sizee>1000 
    samples = 400;
else
    samples = sizee;
end
samples
for i=1:samples
    i
    [y,Fs] = audioread(result(i), "double");
    time = size(y);
    time = time(1,1)/Fs;
    if(time<2) 
        continue
    end
    Nsamples = Nsamples + 1;
    [a, f] = furier(y,Fs);
    [f,a] = lowPassFilter(f,a,1000);
    [newF, newA] = freqScaling(f,a,0.5, 1000);
    lista = [lista newA];
    %pause(1);
    if mod(i,round(samples/4))==0 && i~=0 
        listaQ = transpose(sum(transpose(lista)));
        listaQ = listaQ./Nsamples;
        listaQ = listaQ .* listaQ;
        subplot(2,2,round(i/(samples/4)));
        plot(newF, listaQ);
    end
end
% multimedijski sustavi