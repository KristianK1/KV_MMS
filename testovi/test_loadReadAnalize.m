clear all
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
foldersIgnore = [""];

N = 10000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 0.5,61,4000);

%{
figure
hold on
for i=1:N
    subplot(4,5,i);
    plot(f, rez{i,1})
end
%}
