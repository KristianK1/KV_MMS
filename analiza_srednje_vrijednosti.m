clc
clearvars -except result
%folders = ["male","teens"];
folders = [""];
initialPath ="D:\KV_MMS\voices_repo\children";
%initialPath ="D:\KV_MMS\voices_repo\mozilla8";
result = readFilePaths(initialPath, folders, "wav");
"readPaths"
result = result(randperm(numel(result)));
Nsamples = 0;
lista = zeros(2000, 0);
sizee = size(result);
sizee = sizee(1,1);

wantedSamples = 1000;
if sizee>wantedSamples
    samples = wantedSamples;
else
    samples = sizee;
end
samples
for i=1:samples
    
    [y,Fs] = audioread(result(i), "double");
    time = size(y);
    time = time(1,1)/Fs;
    if(time<=3)
        continue
    end
    Nsamples = Nsamples + 1;
    [f,a] = furier(y,Fs);
    [f,a] = lowPassFilter(f,a,1000);
    [f,a] = highPassFilter(f,a,50);
    
    [newF, newA] = freqScaling(f,a,0.5, 1000);
    [newF, newA] = powerScaling(newF,newA,1);
    lista = [lista newA];
end

listaQ = lista;% .* lista;
listaQ = transpose(sum(transpose(listaQ)));
listaQ = listaQ./Nsamples;
listaQ = listaQ .^0.5;
figure
plot(newF, listaQ);

title("osim " + folders(1,1) + " and "  +folders(1,2));

snagaProsjeka = signalPower(newF, listaQ, 0,-1)