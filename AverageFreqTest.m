%clearvars -except Mrez Frez MCrez FCrez
clear all
clc


%path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
%path ="D:\KV_MMS_voices_repo\laki"; %PC Kristian

%foldersIgnore = ["male"];
%N = 1000;
%[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 1,61,400);
%avgFreq = findAvgFreq(rez,f);



N = 20000


path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
%path ="D:\KV_MMS_voices_repo\laki"; %PC Kristian
foldersIgnore = ["female"];
%N = 10000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 1,61,400);
Mrez = findAvgFreq(rez,f);



path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
%path ="D:\KV_MMS_voices_repo\laki"; %PC Kristian
foldersIgnore = ["male"];
%N = 10000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 1,61,400);
Frez = findAvgFreq(rez,f);




%path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
path ="D:\KV_MMS_voices_repo\laki"; %PC Kristian
foldersIgnore = ["female"];
%N = 10000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 1,61,400);
CMrez = findAvgFreq(rez,f);




%path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
path ="D:\KV_MMS_voices_repo\laki"; %PC Kristian
foldersIgnore = ["male"];
%N = 10000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 1,61,400);
CFrez = findAvgFreq(rez,f);


plot(f,[Mrez, Frez, CMrez, CFrez])


