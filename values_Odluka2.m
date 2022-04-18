nM = size(Mv_O2);
nM = nM(1,2);

nF = size(Fv_O2);
nF = nF(1,2);

nCM = size(CMv_O2);
nCM = nCM(1,2);

nCF = size(CFv_O2);
nCF = nCF(1,2);

rezMSum = transpose(sum((transpose(Mv_O2)))) / nM;
rezFSum = transpose(sum((transpose(Fv_O2)))) / nF;
rezCMSum = transpose(sum((transpose(CMv_O2)))) / nCM;
rezCFSum = transpose(sum((transpose(CFv_O2)))) / nCF;

figure
grid
plot(f_O2, [rezMSum, rezFSum, rezCMSum, rezCFSum]);
title("rezultati algoritma za Odluku 2");
legend(["male", "female", "child male", "child female"]);

values_O2.M = rezMSum;
values_O2.F = rezFSum;
values_O2.CM = rezCMSum;
values_O2.CF = rezCFSum;

values_O2.Fmin = FMIN_O2;
values_O2.Fmax = FMAX_O2;
values_O2.fstep = Fstep_O2;