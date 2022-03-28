function [freqs, aps] = lowPassFilter(freqs, aps, cutoff)
    sizeF = size(freqs);
    sizeF = sizeF(1,1);
    maxF = freqs(sizeF,1);
    limit = round(sizeF*cutoff/maxF);
    freqs = freqs(1:limit,1);
    aps = aps(1:limit,1);
    

end