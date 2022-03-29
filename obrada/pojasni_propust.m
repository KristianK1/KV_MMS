function [freqs, aps] = pojasni_propust(freqs,aps, min, max)
    sizeF = size(freqs);
    sizeF = sizeF(1,1);
    for i=1:sizeF
        if(freqs(i)<min)
            aps(i)=0;
        else
            break
        end
    end

    maxF = freqs(sizeF,1);
    limit = round(sizeF*max/maxF);
    freqs = freqs(1:limit,1);
    aps = aps(1:limit,1);
end