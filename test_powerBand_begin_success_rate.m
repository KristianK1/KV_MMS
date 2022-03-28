clc

clearvars -except resultsF

excludeGender = "female";
folders = [excludeGender,"teens"];
%initialPath ="D:\KV_MMS\voices_repo\children";
initialPath ="D:\KV_MMS\voices_repo\mozilla8";
result = readFilePaths(initialPath, folders, "mp3");
"readPaths"
result = result(randperm(numel(result)));

sizee = size(result);
samples = sizee(1,1);
if(samples>200)
    samples = 200;
end
sounds = audioFileReading(result(1:samples,1));
"read audio"


wantedPower = 0.02;

MF_limits = [100:2:180];
sizee = size(MF_limits);
N_limits = sizee(1,2);

maxF = 1000;
f_step=0.5
results = {};
for i = 1:N_limits
    statsTrue = 0;
    statsFalse = 0;

    for j = 1:samples
        y = cell2mat(sounds(j));
        
        [f,a] = furier(y,48000);
        [f,a] = lowPassFilter(f,a,1000);
        [f,a] = highPassFilter(f,a,50);

        [f, a] = freqScaling(f,a,f_step, maxF);
        [f, a] = powerScaling(f,a,1);
        powerSum = 0;
        for k=1:(maxF/f_step)
            powerSum = powerSum + a(k)*a(k);
            if(powerSum>=wantedPower)
                powerAt = f(k);
                break;
            end
        end
        if(MF_limits(i) > powerAt)
            statsTrue = statsTrue + 1;
        else
            statsFalse = statsFalse + 1;
        end
    end
    
    per_true = statsTrue / (statsTrue + statsFalse);
    result = {MF_limits(i) , per_true}
    results = [results ; result];
end
