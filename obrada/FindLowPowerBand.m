function [outF, exactFreq] = FindLowPowerBand(a, f, Power)
    sizee = size(f);
    sizee=sizee(1,1);

    powerSum = 0;
    outF = zeros(sizee,1);
    for i=1:sizee
        powerSum = powerSum + a(i)*a(i);
        if(powerSum>=Power)
            outF(i,1) = 1;
            exactFreq = f(i,1);
            break;
        end
    end
end