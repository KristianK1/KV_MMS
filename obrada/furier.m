function [freqs, amplitudes] = furier(y, Fs)
    fourier = fft(y);
    tempSize = size(fourier);
    sizee = tempSize(1,1);
    fourier = fourier(1:floor(sizee/2),1);
    amplitudes = abs(fourier);
    freqs  = [0:1/(sizee-1)*Fs: 0.5*Fs];
    freqs = transpose(freqs);
end