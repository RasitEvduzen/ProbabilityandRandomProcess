% Monte Carlo Simulation Pi calculation with unit circle
% 06-Oct-2017
% Written By : Rasit EVDÜZEN
clc,clear all,close all;

NoS = 200;   % Number of simulation
NoI = 0;      % Number of Inside
NoO = 0;      % Number of Outside

% Plot Parameters
r = 1;
theta = linspace(0,2*pi);
x1 = r*cos(theta);
y1 = r*sin(theta);

figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for i = 1: NoS 
    x = 2*rand-1;
    y = 2*rand-1;
    rectangle('Position',[-1 -1 2 2],'LineWidth',2)
    hold on, axis equal
    if [(x^2) + (y^2)] < 1
        NoI = NoI + 1;
        scatter(x,y,'b','filled')
    else
        NoO = NoO + 1;
        scatter(x,y,'b','filled')
    end
    pi_val = (4 * NoI) / (NoS);  % Calculation pi
    plot(x1,y1,'r','LineWidth',2),title(['Number of Iteration',num2str(i),'  Approximation of Pi :',num2str(pi_val)])
    drawnow
end