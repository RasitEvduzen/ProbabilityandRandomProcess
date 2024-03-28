clc,clear,close all,warning off;
% Written By: Rasit
% To Day is Pi Day '14-Mar-2022'
% Calculation Pi value, using Monte Carlo Simulation

y = @(x) 4/(1+x^2);
x = rand(1,1e6);
NofIter = size(x,2);

xinitial = 0;
xfinal = 1;

Sum = 0;
for i = 1: NofIter
    Sum = Sum + y(xinitial+ (xfinal - xinitial) *x(1,i));
end

Sum = Sum*((xfinal-xinitial)/NofIter);
fplot(y,[0 1]),grid
title(["Approximate value of pi: "+num2str(Sum)])
fprintf('Approximate value of pi: %d \n',Sum)