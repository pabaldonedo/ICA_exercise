%%Author: Pablo Alonso
clear all
close all
clc

init()

x = linspace(0,1,200);

source1 = sin(2*pi*10*x);
source2 = sawtooth(2*pi*16*x);
noise = 2*(rand(1,200)-0.5);

sources = [source1; source2; noise];
coeficients = [4.0, 1.5, 0.4; 2.0, 3.0, 0.2; 0.5, 0.5, 1];

fastICA_artificial_data(sources, coeficients);
