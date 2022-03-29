clc 
clear all
folders = ["teens"];
initialPath ="D:\KV_MMS\voices_repo\mozilla8";
result = readFilePaths(initialPath, folders, "mp3");
"readPaths"
result = result(randperm(numel(result)));

sizee = size(result);
samples = sizee(1,1);
if(samples>100)
    samples = 100;
end
sounds = audioFileReading(result(1:samples,1))