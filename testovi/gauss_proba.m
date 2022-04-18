clear all
clc
close all

f = [0:0.5:400];
f = transpose(f);

sd = 10;
mu = 100;
y = 0.2/(2*pi*sd)*exp(-(f-mu).^2/(2*sd^2));

suum = f;
for i = 1:size(suum)
    suum(i) = rand()/20000;
end
y = suum + y;

figure
hold on
plot(f,y)

gaussFiting(f,y)

