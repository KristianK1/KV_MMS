function P = signalPower(a,f, minF, maxF)
sizee = size(a);
sizee=sizee(1,1);
P = 0;
for i=1:sizee
    if f(i)>=minF && (f(i)<=maxF || maxF == -1)
        P = P + a(i)*a(i);
    end
end
P = sqrt(P);