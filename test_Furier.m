clc
folders = [""];
initialPath ="D:\KV_MMS\voices_repo\testData";
result = readFilePaths(initialPath, folders, "mp3")

result(1)
[y,Fs] = audioread("D:\KV_MMS\voices_repo\testData\000bbe80d7bae0eedc4b85b294c06ae96bb7c2b4efe610a846484c73ed8e98f8e1b5deb93f1ed6193e80f07b8e3fb9ee2e906a02b359b1390e401d93d272047d.mp3", "double");
%sound(y, Fs);
[a, f] = furier(y,Fs);

[f,a] = lowPassFilter(f,a,1500);
figure 
plot(f,a)