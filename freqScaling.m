function [newF,newA] = freqScaling(f,a, freqStep, maxF)
    newF = zeros(floor(maxF/freqStep), 1);
    newA = zeros(floor(maxF/freqStep), 1);
    
    stepCount = 2;
    %prvi korak ostaje isti
    newF(1) = f(1);
    newA(1) = a(1);

    sizee = size(f);
    sizee = sizee(1,1);

    sum=0;
    for i=1:sizee
        if f(i)<stepCount*freqStep && f(i)<maxF
            sum = sum + a(i)*a(i);
            if i==sizee
                newA(stepCount) = sqrt(sum);
                newF(stepCount) = stepCount*freqStep;
                stepCount = stepCount + 1;
            end
        elseif f(i)==maxF
            sum = sum + a(i)*a(i);
            newA(stepCount) = sqrt(sum);
            newF(stepCount) = stepCount*freqStep;
            stepCount = stepCount + 1;
        elseif f(i)>maxF
            newA(stepCount) = sqrt(sum);
            newF(stepCount) = stepCount*freqStep;
            stepCount = stepCount + 1;
        else
            newA(stepCount) = sqrt(sum);
            newF(stepCount) = stepCount*freqStep;
            stepCount = stepCount + 1;
            sum = a(i)*a(i);
        end
    end

    sizee = size(newF);
    sizee = sizee(1,1);
    if(newF(sizee,1)==0)
       newF(sizee,1)=stepCount*freqStep;
       %"helloooo"
    end
end