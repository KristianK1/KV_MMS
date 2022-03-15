function [freqs, aps] = highPassFilter(freqs, aps, cutoff)
    sizeF = size(freqs);
    sizeF = sizeF(1,1);
    yy = "cetiri";
    for i=1:sizeF
        if(freqs(i)<cutoff)
            aps(i)=0;
        else
            break
        end
    end

end