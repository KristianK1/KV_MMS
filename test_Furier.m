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
    
    %sound(y, Fs);
    [a, f] = furier(y,Fs);
    
    break
    %[f,a] = lowPassFilter(f,a,1000);
    %[f,a] = highPassFilter(f,a,65);
    %filtered = ifft(y);
    %sound(y,Fs);

    %sizee = size(a);
    %sizee=sizee(1,1);
    
    %plot(f,a)
    %sizeY = size(y);
    %sizeY = sizeY(1,1)/Fs;
    %pause(round(sizeY)+2);
    %pause(1);
end