clear all
clc
%dir clips
dirs = dir;


tempSize = size(dirs);
N_of_files = tempSize(1,1);

for i=1:N_of_files
    if dirs(i).name == "clips"
        folder = dirs(i);
    end
end


cd clips\;

dirs = dir;

tempSize = size(dirs);
N_of_files = tempSize(1,1);
for i=1:N_of_files
    if endsWith(dirs(i).name, "mp3") == true
        dirs(i)
        [y,Fs] = audioread(dirs(i).name);
        fourier = fft(y);
        fourier = abs(fourier);
        tempSize = size(fourier);
        size = tempSize(1);
        fourier = fourier(1:size/2,1);
        amp=zeros(2,size/2);
        amp(1,:)  = [0:1/(size-1)*Fs: 0.5*Fs];
        amp(2,:) = fourier;
        break
    end
    
end

plot(amp(1,:), amp(2,:));
cd ..