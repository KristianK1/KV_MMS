clear all
clc

%cd voices_repo\testData\
%dirs = dir;


%tempSize = size(dirs);
%N_of_files = tempSize(1,1);
%
%for i=1:N_of_files
%    if dirs(i).name == "testData"
%        folder = dirs(i);
%    end
%end


%cd clips\;

cd voices_repo\testData\
dirs = dir

tempSize = size(dirs)
N_of_files = tempSize(1,1);
for i=1:N_of_files
    if endsWith(dirs(i).name, "mp3") == true
        [y,Fs] = audioread(dirs(i).name);
        fourier = fft(y);
        fourier = abs(fourier);
        tempSize = size(fourier);
        sizee = tempSize(1);
        fourier = fourier(1:sizee/2,1);
        amp=zeros(2,sizee/2);
        amp(1,:)  = [0:1/(sizee-1)*Fs: 0.5*Fs];
        amp(2,:) = fourier;
        i
        size(amp)
        %break
    end
end
cd C:\KV_MMS;
plot(amp(1,:), amp(2,:));
cd ..