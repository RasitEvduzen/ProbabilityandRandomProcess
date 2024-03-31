clc,clear,close all,warning off;
% Written By: Rasit
% 31-Mar-2024
% Calculation Pi value, using Monte Carlo Simulation
%%
xinitial = -20;   % Integral Lower Bound 
xfinal = 20;      % Integral Upper Bound
NoD = 1e4;        % Number of Data

% ----------------- Candidate Function -----------------
% y = @(x) sin(x);  % Function - 1  Interval -> [0 pi]
% y = @(x) cos(x);  % Function - 2 Interval -> [-pi/2 pi/2]
% y = @(x) x;       % Function - 3 Interval -> [0 1]
y = @(x) sin(pi*x)./(pi*x);       % Function - 4  Integral Interval -> [-20 20]
% y = @(x) (5*cos(3*x)).*exp(-.3*x);  % Function - 5 Integral Interval -> [0 10]
x = (xfinal-xinitial)*rand(1,NoD)+xinitial; % Random Sample

xspan = linspace(xinitial,xfinal,NoD);
Sum = 0;
for i=1:NoD
    Sum = Sum + y(x(i));
end
Sum = Sum*((xfinal-xinitial)/NoD);

% Simulation
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for i=1:NoD
    if mod(i,1e2) == 0
        clf
        fplot(y,[xinitial xfinal],'r',LineWidth=3),hold on
        stem(x(1:i),y(x(1:i)),"filled","b",LineWidth=.01,MarkerSize=.25)
        title(["Approximate Value of Function Integral Value: "+num2str(Sum)])
        drawnow
    end
end

