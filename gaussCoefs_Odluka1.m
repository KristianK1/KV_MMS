clearvars -except values_O2 values_O3
close all
clc


N = 200;

path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\laki"; %PC Kristian

%path = "C:\KV_MMS_voices_repo\mozilla_stuff"; %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\children_max"; %Lenovo Kristian

%{
[Mv,f] = loadReadAnalize(path, ["female"], ".mp3", N, 0.5,61,400);
[Fv,f] = loadReadAnalize(path, ["male"], ".mp3", N, 0.5,61,400);
[CMv,f] = loadReadAnalize(pathChi, ["female"], ".mp3", N, 0.5,61,400);
[CFv,f] = loadReadAnalize(pathChi, ["male"], ".mp3", N, 0.5,61,400);
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


freqVectorSize = size(f);
freqVectorSize = freqVectorSize(1,1);

Mrez = zeros(freqVectorSize,1);
Frez = zeros(freqVectorSize,1);
CMrez = zeros(freqVectorSize,1);
CFrez = zeros(freqVectorSize,1);

power = 0.03;

cd obrada\

"M"
for j=1:nM
    Mrez = Mrez + FindLowPowerBand(Mv(:,j), f, power);
end

"F"
for j=1:nF
    Frez = Frez + FindLowPowerBand(Fv(:,j), f, power);    
end


"CM"
for j=1:nCM
    CMrez= CMrez + FindLowPowerBand(CMv(:,j), f, power);
end


"CF"
for j=1:nCF
    CFrez = CFrez + FindLowPowerBand(CFv(:,j), f, power);    
end


Mrez = Mrez/nM;
Frez = Frez/nF;
CMrez = CMrez/nCM;
CFrez = CFrez/nCF;

figure
plot(f, [Mrez, Frez, CMrez, CFrez]);










figure
hold on

%M
[ampM, srM, sigM] = gaussFiting(f,Mrez);
gauss = ampM * exp(-(f-srM).^2/(2*sigM^2));
plot(f,gauss)

%F
[ampF, srF, sigF] = gaussFiting(f,Frez);
gauss = ampF * exp(-(f-srF).^2/(2*sigF^2));
plot(f,gauss)

%CM
[ampCM, srCM, sigCM] = gaussFiting(f,CMrez);
gauss = ampCM * exp(-(f-srCM).^2/(2*sigCM^2));
plot(f,gauss)

%CF
[ampCF, srCF, sigCF] = gaussFiting(f,CFrez);
gauss = ampCF * exp(-(f-srCF).^2/(2*sigCF^2));
plot(f,gauss)

cd ..

values_O1.M.amp = ampM;
values_O1.M.mi = srM;
values_O1.M.sig = sigM;

values_O1.F.amp = ampF;
values_O1.F.mi = srF;
values_O1.F.sig = sigF;

values_O1.CM.amp = ampCM;
values_O1.CM.mi = srCM;
values_O1.CM.sig = sigCM;

values_O1.CF.amp = ampCF;
values_O1.CF.mi = srCF;
values_O1.CF.sig = sigCF;

clearvars -except values_O1 values_O2 values_O3


