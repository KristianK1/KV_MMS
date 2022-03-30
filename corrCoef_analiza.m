clear all
clc

path ="D:\KV_MMS_voices_repo\mozilla8_repeat\"; %PC Kristian
N = 5000;
[rezM,f] = loadReadAnalize(path, ["female"], ".mp3", N, 0.5,61,4000);
[rezF,f] = loadReadAnalize(path, ["male"], ".mp3", N, 0.5,61,4000);
figure
plot(f,transpose(sum((transpose(rezM)))))
hold on
plot(f,transpose(sum((transpose(rezF)))))

rezFSum = transpose(sum((transpose(rezM)))) / N;
rezMSum = transpose(sum((transpose(rezF)))) / N;
f1 = f;
f2 = f;
corrCoefsM = zeros(4000,2);
corrCoefsF = zeros(4000,2);

maxF = 3999;
while maxF>=70
    cd obrada
    [f1, rezFSum] = pojasni_propust(f1,rezFSum, 61,maxF);
    [f2, rezMSum] = pojasni_propust(f2,rezMSum, 61,maxF);
    cd ..
    maxF = maxF - 1;

    for i = 1:5000
        curr = rezF(:,i);
        corrCoefsMM()
    end
    for i=1:5000

    end
end
