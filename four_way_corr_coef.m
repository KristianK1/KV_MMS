clearvars -except rezFSum rezMSum rezCMSum rezCFSum f1 f2 f3 f4
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\laki"; %PC Kristian

%path = "C:\KV_MMS_voices_repo\mozilla_stuff"; %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\children_max"; %Lenovo Kristian

N = 10000;
FMIN = 61;
FMAX = 400;
Fstep = 1;


load rezultati\corr_analize_1Hz_61_400.mat


%{
[Mrez, f1] = loadReadAnalize(path, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
rezMsize = size(Mrez);
rezMsize = rezMsize(1,2)
rezMSum = transpose(sum((transpose(Mrez)))) ./ rezMsize;

[Frez, f2] = loadReadAnalize(path, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
rezFsize = size(Frez);
rezFsize = rezFsize(1,2)
rezFSum = transpose(sum((transpose(Frez)))) ./ rezFsize;

[CMrez, f3] = loadReadAnalize(pathChi, ["female"], ".", N, Fstep, FMIN, FMAX);
rezCMsize = size(CMrez);
rezCMsize = rezCMsize(1,2)
rezCMSum = transpose(sum((transpose(CMrez)))) ./ rezCMsize;

[CFrez, f4] = loadReadAnalize(pathChi, ["male"], ".", N, Fstep, FMIN, FMAX);
rezCFsize = size(CFrez);
rezCFsize = rezCFsize(1,2)
rezCFSum = transpose(sum((transpose(CFrez)))) ./ rezCFsize;



figure
hold on
plot(f1,rezFSum)
plot(f2,rezMSum)
plot(f3,rezCFSum)
plot(f4,rezCMSum)
legend({'female','male', 'Child female','Child male'})
%}



N = 2000 ;
[QrezM, f11] = loadReadAnalize(path, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
[QrezF, f21] = loadReadAnalize(path, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
[QrezCM, f31] = loadReadAnalize(pathChi, ["female"], ".", N, Fstep, FMIN, FMAX);
[QrezCF, f41] = loadReadAnalize(pathChi, ["male"], ".", N, Fstep, FMIN, FMAX);


"M"
%musko
resultsM = zeros(1, 4);
for i=1:50
    corrs = zeros(1,4);
    corr = corrcoef(rezMSum, QrezM(:,i));
    corrs(1) = corr(1,2);

    corr = corrcoef(rezFSum, QrezM(:,i));
    corrs(2) = corr(1,2);

    corr = corrcoef(rezCMSum, QrezM(:,i));
    corrs(3) = corr(1,2);

    corr = corrcoef(rezCFSum, QrezM(:,i));
    corrs(4) = corr(1,2);

    if sum(sum(corrs~=abs(corrs))) == 1
        corrs
    end
    
    [~,I] = max(corrs,[],'all','linear');

    resultsM(I) = resultsM(I) + 1;
end

"F"
%zensko
resultsF = zeros(1, 4);
for i=1:50
    corrs = zeros(1,4);
    corr = corrcoef(rezMSum, QrezF(:,i));
    corrs(1) = corr(1,2);

    corr = corrcoef(rezFSum, QrezF(:,i));
    corrs(2) = corr(1,2);

    corr = corrcoef(rezCMSum, QrezF(:,i));
    corrs(3) = corr(1,2);

    corr = corrcoef(rezCFSum, QrezF(:,i));
    corrs(4) = corr(1,2);

    if sum(sum(corrs~=abs(corrs))) == 1
        corrs
    end
    
    [~,I] = max(corrs,[],'all','linear');

    resultsF(I) = resultsF(I) + 1;
end

"CF"
%dijete musko
resultsCM = zeros(1, 4);
for i=1:20
    corrs = zeros(1,4);
    corr = corrcoef(rezMSum, QrezCM(:,i));
    corrs(1) = corr(1,2);

    corr = corrcoef(rezFSum, QrezCM(:,i));
    corrs(2) = corr(1,2);

    corr = corrcoef(rezCMSum, QrezCM(:,i));
    corrs(3) = corr(1,2);

    corr = corrcoef(rezCFSum, QrezCM(:,i));
    corrs(4) = corr(1,2);

    if sum(sum(corrs~=abs(corrs))) == 1
        corrs
    end
    
    [~,I] = max(corrs,[],'all','linear');

    resultsCM(I) = resultsCM(I) + 1;
end


"CM"
%dijete zensko
resultsCF = zeros(1, 4);
for i=1:21
    corrs = zeros(1,4);
    corr = corrcoef(rezMSum, QrezCF(:,i));
    corrs(1) = corr(1,2);

    corr = corrcoef(rezFSum, QrezCF(:,i));
    corrs(2) = corr(1,2);

    corr = corrcoef(rezCMSum, QrezCF(:,i));
    corrs(3) = corr(1,2);

    corr = corrcoef(rezCFSum, QrezCF(:,i));
    corrs(4) = corr(1,2);

    if sum(sum(corrs~=abs(corrs))) == 1
        corrs
    end
    
    [~,I] = max(corrs,[],'all','linear');

    resultsCF(I) = resultsCF(I) + 1;
end


resultsM = resultsM / sum(sum(resultsM))
resultsF = resultsF / sum(sum(resultsF))
resultsCM = resultsCM / sum(sum(resultsCM))
resultsCF = resultsCF / sum(sum(resultsCF))