nM = size(Mv_O1);
nM = nM(1,2);

nF = size(Fv_O1);
nF = nF(1,2);

nCM = size(CMv_O1);
nCM = nCM(1,2);

nCF = size(CFv_O1);
nCF = nCF(1,2);


freqVectorSize = size(f_O1);
freqVectorSize = freqVectorSize(1,1);

Mrez = zeros(freqVectorSize,1);
Frez = zeros(freqVectorSize,1);
CMrez = zeros(freqVectorSize,1);
CFrez = zeros(freqVectorSize,1);

power = 0.02;

cd obrada\

for j=1:nM
    [tmp, ~] = FindLowPowerBand(Mv_O1(:,j), f_O1, power);
    Mrez = Mrez + tmp;
end

for j=1:nF
    [tmp, ~] = FindLowPowerBand(Fv_O1(:,j), f_O1, power);
    Frez = Frez + tmp;
end


for j=1:nCM
    [tmp, ~] = FindLowPowerBand(CMv_O1(:,j), f_O1, power);
    CMrez= CMrez + tmp;
end


for j=1:nCF
    [tmp, ~] = FindLowPowerBand(CFv_O1(:,j), f_O1, power);
    CFrez = CFrez + tmp;    
end


Mrez = Mrez/nM;
Frez = Frez/nF;
CMrez = CMrez/nCM;
CFrez = CFrez/nCF;


figure
grid
plot(f_O1, [Mrez, Frez, CMrez, CFrez]);
title("rezultati algoritma za Odluku 1");
legend(["male", "female", "child male", "child female"]);



figure
title("Odluka 1 gauss curves");
grid
hold on

%M
[ampM, srM, sigM] = gaussFiting(f_O1,Mrez);
gauss = ampM * exp(-(f_O1-srM).^2/(2*sigM^2));
plot(f_O1,gauss)

%F
[ampF, srF, sigF] = gaussFiting(f_O1,Frez);
gauss = ampF * exp(-(f_O1-srF).^2/(2*sigF^2));
plot(f_O1,gauss)

%CM
[ampCM, srCM, sigCM] = gaussFiting(f_O1,CMrez);
gauss = ampCM * exp(-(f_O1-srCM).^2/(2*sigCM^2));
plot(f_O1,gauss)

%CF
[ampCF, srCF, sigCF] = gaussFiting(f_O1,CFrez);
gauss = ampCF * exp(-(f_O1-srCF).^2/(2*sigCF^2));
plot(f_O1,gauss)


legend(["male", "female", "child male", "child female"]);

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

values_O1.Fmin = FMIN_O1;
values_O1.Fmax = FMAX_O1;
values_O1.fstep = Fstep_O1;
values_O1.power = power;




