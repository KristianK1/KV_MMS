clear all
clc
a=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];
f=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];
power = signalPower(f,a,0,-1)
transpose(FindLowPowerBand(f,a,power/2))

