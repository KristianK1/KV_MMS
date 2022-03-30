
path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
N = 5000;
[rezM,f] = loadReadAnalize(path, ["female"], ".mp3", N, 0.5,61,4000);
[rezF,f] = loadReadAnalize(path, ["male"], ".mp3", N, 0.5,61,4000);
rezFSum = transpose(sum((transpose(rezM))));
rezMSum = transpose(sum((transpose(rezF))));
f1 = f;
f2 = f;
corrCoefs = zeros(4000,1);
maxF = 3999;
while maxF>=100
    cd obrada
    [f1, rezFSum] = pojasni_propust(f1,rezFSum, 61,maxF);
    [f2, rezMSum] = pojasni_propust(f2,rezMSum, 61,maxF);
    cd ..
    temp = corrcoef(rezFSum, rezMSum);
    corrCoefs(maxF,1) = temp(1,2);
    maxF = maxF - 1;
end


minV = corrCoefs(100,1);
minI = 1;
for i=101:3000
    if(corrCoefs(i,1)<minV)
        minV = corrCoefs(i,1);
        minI = i;
    end
end

minI
minV