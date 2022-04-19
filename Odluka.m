function probs = Odluka(path, values)



    try
        [y, Fs] = audioread(path, "double");
    catch e
        rethrow(e);
    end

    sizeY = size(y);
    sizeY = sizeY(1,1);

    if sizeY/Fs < 2
        exc = MException('MATLAB:test', 'Length of sound less than %f seconds at path %s',1/freqStep, path);
        throw(exc)
    end


    cd obrada
    
    [f1,a1] = furier(y,Fs);
    [f1,a1] = pojasni_propust(f1, a1, values.O1.Fmin, values.O2.Fmax);
    [f1,a1] = freqScaling(f1,a1, values.O1.fstep, values.O1.Fmax);
    [f1,a1] = powerScaling(f1, a1, 1);

    [f2,a2] = furier(y,Fs);
    [f2,a2] = pojasni_propust(f2, a2, values.O2.Fmin, values.O2.Fmax);
    [f2,a2] = freqScaling(f2,a2, values.O2.fstep, values.O2.Fmax);
    [f2,a2] = powerScaling(f2, a2, 1);


    [f3,a3] = furier(y,Fs);
    [f3,a3] = pojasni_propust(f3, a3, values.O3.Fmin, values.O3.Fmax);
    [f3,a3] = freqScaling(f3, a3, values.O3.fstep, values.O3.Fmax);
    [f3,a3] = powerScaling(f3, a3, 1);



    probs_O1 = zeros(1,4);
    probs_O2 = zeros(1,4);
    probs_O3 = zeros(1,4);
    %Odluka1
    wantedPower = 0.02;
    [~, freq] = FindLowPowerBand(a1,f1,wantedPower);


    amp = values.O1.M.amp;
    mi = values.O1.M.mi;
    sig = values.O1.M.sig;
    probs_O1(1,1) = amp * exp(-(freq-mi).^2/(2*sig^2));

    amp = values.O1.F.amp;
    mi = values.O1.F.mi;
    sig = values.O1.F.sig;
    probs_O1(1,2) = amp * exp(-(freq-mi).^2/(2*sig^2));

    
    amp = values.O1.CM.amp;
    mi = values.O1.CM.mi;
    sig = values.O1.CM.sig;
    probs_O1(1,3) = amp * exp(-(freq-mi).^2/(2*sig^2));

    amp = values.O1.CF.amp;
    mi = values.O1.CF.mi;
    sig = values.O1.CF.sig;
    probs_O1(1,4) = amp * exp(-(freq-mi).^2/(2*sig^2));

    probs_O1 = probs_O1/sum(probs_O1);


    %Odluka2
    
    corr = corrcoef(values.O2.M, a2);
    probs_O2(1,1) = corr(1,2);

    corr = corrcoef(values.O2.F, a2);
    probs_O2(1,2) = corr(1,2);

    corr = corrcoef(values.O2.CM, a2);
    probs_O2(1,3) = corr(1,2);

    corr = corrcoef(values.O2.CF, a2);
    probs_O2(1,4) = corr(1,2);
    
    %uklanjanje negativnih vrijednosti
    probs_O2 = (probs_O2 + abs(probs_O2)) / 2; 
    
    probs_O2 = probs_O2/sum(probs_O2);
    
    %Odluka3
    [~, freq] = averageFreq(a3,f3);


    amp = values.O3.M.amp;
    mi = values.O3.M.mi;
    sig = values.O3.M.sig;
    probs_O3(1,1) = amp * exp(-(freq-mi).^2/(2*sig^2));

    amp = values.O3.F.amp;
    mi = values.O3.F.mi;
    sig = values.O3.F.sig;
    probs_O3(1,2) = amp * exp(-(freq-mi).^2/(2*sig^2));

    
    amp = values.O3.CM.amp;
    mi = values.O3.CM.mi;
    sig = values.O3.CM.sig;
    probs_O3(1,3) = amp * exp(-(freq-mi).^2/(2*sig^2));

    amp = values.O3.CF.amp;
    mi = values.O3.CF.mi;
    sig = values.O3.CF.sig;
    probs_O3(1,4) = amp * exp(-(freq-mi).^2/(2*sig^2));

    probs_O3 = probs_O3/sum(probs_O3);

    cd ..







    probs = [probs_O1 ; probs_O2 ; probs_O3]; 
end