% Monte Carlo Simulation Pi calculation with unit circle
% 06-Oct-2017
% Written By : Rasit EVDÜZEN
clc,clear all,close all;
%%
NoS = 5e3;    % Number of simulation
NoI = zeros(NoS,1);      % Number of Inside
NoO = zeros(NoS,1);      % Number of Outside
SimT = 0;
% Plot Parameters
r = 1;
theta = linspace(0,2*pi);
x1 = r*cos(theta);
y1 = r*sin(theta);
pi_val = zeros(NoS,1);
SimIter = 1:NoS;
for i = 1: NoS
    SimT = SimT + 1;
    x(i) = 2*rand-1;
    y(i) = 2*rand-1;
    if [(x(i)^2) + (y(i)^2)] < 1
        NoI(i) = 1;
    else
        NoO(i) = 1;
    end
    pi_val(i) = (4 * sum(NoI(1:i))) / (SimT);  % Calculation pi
end

%% Simulation
figure('units','normalized','outerposition',[0 0 1 1],'color','w')
for i = 1:NoS
    if mod(i,1e2) == 0
        subplot(121)
        rectangle('Position',[-1 -1 2 2],'LineWidth',2)
        hold on, axis off, axis equal
        scatter(x(1:i),y(1:i),'b','filled')
        plot(x1,y1,'r','LineWidth',4),title('Number of Iteration',num2str(i))

        subplot(122)
        plot(pi_val(1:i),'-k.'),yline(pi,'r')
        title('Approximation of Pi :',num2str(pi_val(i)))
        axis([-2 NoS 2 4.2])
        drawnow
    end
end