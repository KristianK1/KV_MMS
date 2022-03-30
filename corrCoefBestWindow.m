%podrazumjeva da se ima rezM i rezF
%clearvars -except rezMSum rezFSum f rezM rezF
path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
N1 = 50000;
%[rezM,~] = loadReadAnalize(path, ["female"], ".mp3", N1, 1,55,4000);
%[rezF,f] = loadReadAnalize(path, ["male"],   ".mp3", N1, 1,55,4000);
rezMSum = transpose(sum((transpose(rezM)))) ./ N1;
rezFSum = transpose(sum((transpose(rezF)))) ./ N1;

f_temp = f;

N2 = 1000;
%[rezM,~] = loadReadAnalize(path, ["female"], ".mp3", N2, 1,55,4000);
%[rezF,f] = loadReadAnalize(path,   ["male"], ".mp3", N2, 1,55,4000);


rezM_temp =rezM;
rezF_temp =rezF;

maxF = 4000;
results = zeros(maxF,2);

while maxF>=70
        maxF
    rezFSum = rezFSum(1:maxF, 1);
    rezMSum = rezMSum(1:maxF, 1);
    rezM_temp = rezM_temp(1:maxF, :);
    rezF_temp = rezF_temp(1:maxF, :);
    
    f_temp = f_temp(1:maxF,1);
    
    for i=1:N2
        c_correct = corrcoef(rezM_temp(:,i),rezMSum);
        c_wrong = corrcoef(rezM_temp(:,i),rezFSum);
        if(c_correct(2,1) > c_wrong(2,1))
            %ispravno
            results(maxF,1) = results(maxF,1) + 1;
        else
            results(maxF,1) = results(maxF,1) + 1*sqrt(-1);
        end
    end
    
    for i=1:N2
        c_correct = corrcoef(rezF_temp(:,i),rezFSum);
        c_wrong = corrcoef(rezF_temp(:,i),rezMSum);
        if(c_correct(2,1) > c_wrong(2,1))
            %ispravno
            results(maxF,2) = results(maxF,2) + 1;
        else
            results(maxF,2) = results(maxF,2) + 1*sqrt(-1);
        end
    end


    maxF = maxF - 1;
end

results = results ./10000.*100;
