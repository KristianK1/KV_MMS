clear all
close all
clc

a = [0.6 0.7 0.8 0.9];
figure
subplot(1,3,1);
bar(a)
grid
title("Rezultati ispitavanja korelacije");

[~,I22] = max(a,[],'all','linear');
[~,I23] = min(a,[],'all','linear');
maxV = a(I22);
minV = a(I23);
a = (a - minV)

subplot(1,3,2);
bar(a)
grid
title("Nakon oduzimanja najmanje vrijednosti");


a = a./ sum(a);

subplot(1,3,3);
bar(a)
grid
title("Vrijednosti skalirane na 1.00");