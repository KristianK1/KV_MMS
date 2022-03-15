function [a,f] = powerScaling(a,f, wantedPower)
    power = signalPower(a,f,0,-1);
    sizee = size(a);
    sizee=sizee(1,1);
    for i=1:sizee
        a(i) = a(i)*wantedPower/power;
    end
end