clearvars -except rezFSum rezMSum rezCMSum rezCFSum f1 f2 f3 f4
clc

%path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
path = "C:\KV_MMS_voices_repo\mozilla_stuff\"; %Lenovo Kristian
pathChi = "C:\KV_MMS_voices_repo\laki\"; %Lenovo Kristian

N = 2000;
FMIN = 62;
FMAX = 1800;
Fstep = 0.5;

if ~exist('rezMSum', 'var')
    "ponovo"
    [rezM, f1] = loadReadAnalize(path, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
    rezMsize = size(rezM);
    rezMsize = rezMsize(1,2)
    rezMSum = transpose(sum((transpose(rezM)))) ./ rezMsize;

    [rezF, f2] = loadReadAnalize(path, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
    rezFsize = size(rezM);
    rezFsize = rezFsize(1,2)
    rezFSum = transpose(sum((transpose(rezF)))) ./ rezFsize;
    
    [rezCM, f3] = loadReadAnalize(pathChi, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
    rezCMsize = size(rezCM);
    rezCMsize = rezCMsize(1,2)
    rezCMSum = transpose(sum((transpose(rezCM)))) ./ rezCMsize;
    
    [rezCF, f4] = loadReadAnalize(pathChi, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
    rezCFsize = size(rezCF);
    rezCFsize = rezCFsize(1,2)
    rezCFSum = transpose(sum((transpose(rezCF)))) ./ rezCFsize;
    
    figure
    hold on
    plot(f1,rezFSum)
    plot(f2,rezMSum)
    plot(f3,rezCFSum)
    plot(f4,rezCMSum)
    legend({'female','male', 'Child female','Child male'})
end


N = 50;
[QrezM, f11] = loadReadAnalize(path, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
[QrezF, f21] = loadReadAnalize(path, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
[QrezCM, f31] = loadReadAnalize(pathChi, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
[QrezCF, f41] = loadReadAnalize(pathChi, ["male"], ".mp3", N, Fstep, FMIN, FMAX);


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
    
    [~,I] = max(corrs,[],'all','linear');

    resultsM(I) = resultsM(I) + 1;
end


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
    
    [~,I] = max(corrs,[],'all','linear');

    resultsF(I) = resultsF(I) + 1;
end


%dijete zensko
resultsCM = zeros(1, 4);
for i=1:19
    corrs = zeros(1,4);
    corr = corrcoef(rezMSum, QrezCM(:,i));
    corrs(1) = corr(1,2);

    corr = corrcoef(rezFSum, QrezCM(:,i));
    corrs(2) = corr(1,2);

    corr = corrcoef(rezCMSum, QrezCM(:,i));
    corrs(3) = corr(1,2);

    corr = corrcoef(rezCFSum, QrezCM(:,i));
    corrs(4) = corr(1,2);
    
    [~,I] = max(corrs,[],'all','linear');

    resultsCM(I) = resultsCM(I) + 1;
end


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
    
    [~,I] = max(corrs,[],'all','linear');

    resultsCF(I) = resultsCF(I) + 1;
end

resultsM = resultsM / sum(sum(resultsM))
resultsF = resultsF / sum(sum(resultsF))
resultsCM = resultsCM / sum(sum(resultsCM))
resultsCF = resultsCF / sum(sum(resultsCF))