function rez = findAvgFreq(Amps, f)
    sizeF = size(f);
    sizeF = sizeF(1,1)
    rez = zeros(sizeF, 1);

    Nfiles = size(Amps);
    Nfiles = Nfiles(1,2)

    cd obrada\
    for i=1:Nfiles
        rez = rez + averageFreq(Amps(:,i), f);
    end
    cd ..

    rez = rez/Nfiles;
end