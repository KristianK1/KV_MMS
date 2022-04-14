clearvars -except values_O1 values_O3
clc


%{
path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\laki"; %PC Kristian

%path = "C:\KV_MMS_voices_repo\mozilla_stuff"; %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\children_max"; %Lenovo Kristian



N = 100;
FMIN = 61;
FMAX = 400;
Fstep = 1;

[Mv, f1] = loadReadAnalize(path, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
[Fv, f2] = loadReadAnalize(path, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
[CMv, f3] = loadReadAnalize(pathChi, ["female"], ".mp3", N, Fstep, FMIN, FMAX);
[CFv, f4] = loadReadAnalize(pathChi, ["male"], ".mp3", N, Fstep, FMIN, FMAX);
%}


load rezultati\justUseThis.mat


nM = size(Mv);
nM = nM(1,2);

nF = size(Fv);
nF = nF(1,2);

nCM = size(CMv);
nCM = nCM(1,2);

nCF = size(CFv);
nCF = nCF(1,2);

rezMSum = transpose(sum((transpose(Mv)))) / nM;
rezFSum = transpose(sum((transpose(Fv)))) / nF;
rezCMSum = transpose(sum((transpose(CMv)))) / nCM;
rezCFSum = transpose(sum((transpose(CFv)))) / nCF;

values_O2.M = rezMSum;
values_O2.F = rezFSum;
values_O2.CM = rezCMSum;
values_O2.CF = rezCFSum;
values_O2.freqs = f;


clearvars -except values_O1 values_O2 values_O3