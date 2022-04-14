function probs = Odluka(path, values)

    minF = 61;
    maxF = 400;
    freqStep = 0.5;



    try
        [y, Fs] = audioread(path, "double");
    catch e
        rethrow(e);
    end

    sizeY = size(y);
    sizeY = sizeY(1,1);

    if sizeY/Fs < 1/freqStep
        exc = MException('MATLAB:test', 'Length of sound less than %f seconds at path %s',1/freqStep, path);
        throw(exc)
    end


    cd obrada
    
    [f,a] = furier(y,Fs);
    [f,a] = pojasni_propust(f, a, minF, maxF);
    [f,a] = freqScaling(f,a, freqStep, maxF);
    [f,a] = powerScaling(f, a, 1);


    probs_O1 = zeros(1,4);
    probs_O2 = zeros(1,4);
    probs_O3 = zeros(1,4);
    %Odluka1
    wantedPower = 0.02;
    [~, freq] = FindLowPowerBand(a,f,wantedPower);


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
    
    corr = corrcoef(values.O2.M, a);
    probs_O2(1,1) = corr(1,2);

    corr = corrcoef(values.O2.F, a);
    probs_O2(1,2) = corr(1,2);

    corr = corrcoef(values.O2.CM, a);
    probs_O2(1,3) = corr(1,2);

    corr = corrcoef(values.O2.CF, a);
    probs_O2(1,4) = corr(1,2);
    
    %uklanjanje negativnih vrijednosti
    probs_O2 = (probs_O2 + abs(probs_O2)) / 2; 
    
    probs_O2 = probs_O2/sum(probs_O2);
    
    %Odluka3
    [~, freq] = averageFreq(a,f);


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