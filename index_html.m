clear all
clc


path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
foldersIgnore = [""];

N = 50000;
[rez,f] = loadReadAnalize(path, foldersIgnore, ".mp3", N, 0.5,61,4000);



