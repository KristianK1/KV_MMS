function [outf, wantedFreq] = averageFreq(a,f)

sizee = size(f);
sizee = sizee(1,1);

avg = 0;
for i=1:sizee
    avg = avg + f(i,1)*a(i,1);
end

avg = avg/sum(sum(a));

freqStep = f(2,1) - f(1,1);
outf = zeros(sizee, 1);

for i=1:sizee
    if abs(f(i,1) - avg) <= freqStep/2
        outf(i,1) = 1;
        wantedFreq = f(i,1);
        break
    end
end