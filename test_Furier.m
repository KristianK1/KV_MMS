clc
clear all;
folders = [""];
%initialPath ="D:\KV_MMS\voices_repo\children";
initialPath ="D:\KV_MMS\voices_repo\mozilla_stuff";
result = readFilePaths(initialPath, folders, "mp3");
result = result(randperm(numel(result)));
sizee = size(result);
sizee = sizee(1,1)
for i = 1:sizee
    if(rem(i,100)==0)
        i
    end
    result(i);
    [y,Fs] = audioread(result(i), "double");
    [a, f] = furier(y,Fs);
    break

end