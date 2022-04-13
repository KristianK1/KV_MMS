clear all
clc


path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
foldersIgnore = ["male"];

N = 50;
[rez,f] = loadReadAnalize( ...
    path, foldersIgnore, ".mp3", N, 0.5,61,4000);

sizee = size(rez);
sizee = sizee(1,1)

sum = averageFreq(rez{1,1}, f);

cd ("obrada\")
for i=2:N
    sum = sum + averageFreq(rez{i,1}, f);
end
cd ..
sum = sum./N;
plot(f,sum)
hold on
