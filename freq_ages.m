clear all
clc

ageGroups = ["teens", "twenties", "thirties", "fourties", "fifties", "sixties", "seventies", "eighties", "nineties"];

path ="D:\KV_MMS_voices_repo\mozilla8_repeat\male"; %PC Kristian

N = ;
figure
sumTotal = {};
for i=1:9
    foldersIgnore = ageGroups;
    foldersIgnore(i) = "";
    foldersIgnore
    [rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 0.5,61,3000);
    rezSum = transpose(sum((transpose(rez))));
    subplot(3,3,i);
    plot(f, rezSum);
    title(ageGroups(i));
end
