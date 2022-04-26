function [f,a] = removeNoise(f,a, factor)
    sizeF = size(f);
    sizeF = sizeF(1,1);

    maxV = 0;
    for i = 1:sizeF
        if(a(i,1) > maxV)
            maxV = a(i,1);
        end
    end

    maxV = maxV * factor;

    a = a - maxV;

    a = (a + abs(a)) / 2;

end