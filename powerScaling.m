function [f,a] = powerScaling(f,a, wantedPower)
    power = signalPower(f,a,0,-1);
    sizee = size(a);
    sizee=sizee(1,1);
    for i=1:sizee
        a(i) = sqrt(a(i)*a(i)*wantedPower/power);
    end
end