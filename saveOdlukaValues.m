close all
clear all
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat"; %PC Kristian
pathChi = "D:\KV_MMS_voices_repo\chiSve";        %PC Kristian
pathTest = "D:\KV_MMS_voices_repo\children_snimljeno";
%pathCF = "D:\KV_MMS_voices_repo\CSD\english\wav";

%path = "C:\KV_MMS_voices_repo\mozilla_stuff";   %Lenovo Kristian
%pathChi = "C:\KV_MMS_voices_repo\Cdata";         %Lenovo Kristian



N_O1 = 2000;
FMIN_O1 = 62;
FMAX_O1 = 500;
Fstep_O1 = 0.5;

[Mv_O1, f_O1] = loadReadAnalize(path, ["female"], ".mp3", N_O1, Fstep_O1, FMIN_O1, FMAX_O1);
[Fv_O1, f_O1] = loadReadAnalize(path, ["male"], ".mp3", N_O1, Fstep_O1, FMIN_O1, FMAX_O1);
[CMv_O1, f_O1] = loadReadAnalize(pathChi, ["female"], ".mp3", N_O1, Fstep_O1, FMIN_O1, FMAX_O1);
[CFv_O1, f_O1] = loadReadAnalize(pathChi, ["male"], ".mp3", N_O1, Fstep_O1, FMIN_O1, FMAX_O1);

N_O2 = 2000;
FMIN_O2 = 62;
FMAX_O2 = 10000;
Fstep_O2 = 2;

[Mv_O2, f_O2] = loadReadAnalize(path, ["female"], ".mp3", N_O2, Fstep_O2, FMIN_O2, FMAX_O2);
[Fv_O2, f_O2] = loadReadAnalize(path, ["male"], ".mp3", N_O2, Fstep_O2, FMIN_O2, FMAX_O2);
[CMv_O2, f_O2] = loadReadAnalize(pathChi, ["female"], ".mp3", N_O2, Fstep_O2, FMIN_O2, FMAX_O2);
[CFv_O2, f_O2] = loadReadAnalize(pathChi, ["male"], ".mp3", N_O2, Fstep_O2, FMIN_O2, FMAX_O2);

N_O3 = 2000;
FMIN_O3 = 100;
FMAX_O3 = 350;
Fstep_O3 = 0.5;



[Mv_O3, f_O3] = loadReadAnalize(path, ["female"], ".mp3", N_O3, Fstep_O3, FMIN_O3, FMAX_O3);
[Fv_O3, f_O3] = loadReadAnalize(path, ["male"], ".mp3", N_O3, Fstep_O3, FMIN_O3, FMAX_O3);
[CMv_O3, f_O3] = loadReadAnalize(pathChi, ["female"], ".mp3", N_O3, Fstep_O3, FMIN_O3, FMAX_O3);
[CFv_O3, f_O3] = loadReadAnalize(pathChi, ["male"], ".mp3", N_O3, Fstep_O3, FMIN_O3, FMAX_O3);



gaussCoefs_Odluka1
values_Odluka2
gaussCoefs_Odluka3

values.O1 = values_O1;
values.O2 = values_O2;
values.O3 = values_O3;

