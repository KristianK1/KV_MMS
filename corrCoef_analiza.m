clear all
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
N = 5000;
[rezM,f] = loadReadAnalize(path, ["female"], ".mp3", N, 0.5,61,4000);
[rezF,f] = loadReadAnalize(path, ["male"], ".mp3", N, 0.5,61,4000);

