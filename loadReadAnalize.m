function [results, commonF] = loadReadAnalize(path, folders, ext, N, freqStep, minF, maxF)
%(path, folders, ext, N, freqStep, minF, maxF)
    outputSize = 0;
    cmnExist = 0;

    cd citanje/
    files = readFilePaths(path, folders, ext);
    files = files(randperm(numel(files)));
    cd ../
    "ocitao";
    results = zeros(0,(maxF - minF)/freqStep);
    cd obrada\
    sizee = size(files);
    sizee = sizee(1,1);
    if(sizee<N*2)
        samples = sizee;
        "Dostupno je samo " + samples + " uzoraka."
    else
        samples = N*2;
    end
    files = files(1:samples, 1);
    
    for i=1:samples
        if(mod(i,100) == 0)
            outputSize/N
        end
        [y,Fs] = audioread(files(i), "double");
        sizeY = size(y);
        sizeY = sizeY(1,1);
        if sizeY/Fs < (1/freqStep)
            continue
        end
        
        [f,a] = furier(y,Fs);
        [f,a] = pojasni_propust(f, a, minF, maxF);
        [f,a] = freqScaling(f,a, freqStep, maxF);
        [f,a] = powerScaling(f, a, 1);
        
        if cmnExist == 0
            cmnExist = 1;
            commonF = f;
        end
        if isequal(commonF, f)
            results = [results a];
            outputSize = outputSize + 1;
            if(outputSize >= N)
                break
            end
        else
            "pogrešna matrica na i = " + i
        end
    end

    cd ../
end