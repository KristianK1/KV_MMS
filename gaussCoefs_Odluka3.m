nM = size(Mv_O3);
nM = nM(1,2);

nF = size(Fv_O3);
nF = nF(1,2);

nCM = size(CMv_O3);
nCM = nCM(1,2);

nCF = size(CFv_O3);
nCF = nCF(1,2);

freqVectorSize = size(f_O3);
freqVectorSize = freqVectorSize(1,1);

Mrez = zeros(freqVectorSize,1);
Frez = zeros(freqVectorSize,1);
CMrez = zeros(freqVectorSize,1);
CFrez = zeros(freqVectorSize,1);

cd obrada\


for j=1:nM
    [tmp, ~] = averageFreq(Mv_O3(:,j),f_O3);
    Mrez = Mrez + tmp;
end


for j=1:nF
    [tmp, ~] = averageFreq(Fv_O3(:,j),f_O3);
    Frez = Frez + tmp;
end


for j=1:nCM
    [tmp, ~] = averageFreq(CMv_O3(:,j),f_O3);
    CMrez= CMrez + tmp;
end


for j=1:nCF
    [tmp, ~] = averageFreq(CFv_O3(:,j),f_O3);    
    CFrez = CFrez + tmp;   
end


Mrez = Mrez/nM;
Frez = Frez/nF;
CMrez = CMrez/nCM;
CFrez = CFrez/nCF;

figure
plot(f_O3, [Mrez, Frez, CMrez, CFrez]);
grid
title("rezultati algoritma za Odluku 3");
legend(["male", "female", "child male", "child female"]);










figure
grid
title("Odluka 3 gauss curves");
hold on
%M
[ampM, srM, sigM] = gaussFiting(f_O3,Mrez);
Mgauss = ampM * exp(-(f_O3-srM).^2/(2*sigM^2));
plot(f_O3, Mgauss)


%F
[ampF, srF, sigF] = gaussFiting(f_O3,Frez);
Fgauss = ampF * exp(-(f_O3-srF).^2/(2*sigF^2));
plot(f_O3, Fgauss)


%CM
[ampCM, srCM, sigCM] = gaussFiting(f_O3,CMrez);
CMgauss = ampCM * exp(-(f_O3-srCM).^2/(2*sigCM^2));
plot(f_O3, CMgauss)


%CF
[ampCF, srCF, sigCF] = gaussFiting(f_O3,CFrez);
CFgauss = ampCF * exp(-(f_O3-srCF).^2/(2*sigCF^2));
plot(f_O3, CFgauss)


legend(["male", "female", "child male", "child female"]);
cd ..


values_O3.M.amp = ampM;
values_O3.M.mi = srM;
values_O3.M.sig = sigM;

values_O3.F.amp = ampF;
values_O3.F.mi = srF;
values_O3.F.sig = sigF;

values_O3.CM.amp = ampCM;
values_O3.CM.mi = srCM;
values_O3.CM.sig = sigCM;

values_O3.CF.amp = ampCF;
values_O3.CF.mi = srCF;
values_O3.CF.sig = sigCF;

values_O3.Fmin = FMIN_O3;
values_O3.Fmax = FMAX_O3;
values_O3.fstep = Fstep_O3;
