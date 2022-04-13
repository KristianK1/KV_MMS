clc
clear all
close all
load rezultati\FreqAverageResults_20000samples_61Hz_400Hz_1Hz.mat

cd obrada\

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