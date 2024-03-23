clc,clear all,close all;
% CLT Proof-1
% Written By: Rasit
% 22-Mar-2024
%%
NoD = 1e4; 
Bins = 50;           % Numbers of samples and bins
mx = 5e-1;            % Mean of standard uniform PMF
Var_x = 1/12;         % Variance of standard uniform PMF 
% Std_x = sqrt(Var_x);  % Stdev of standard uniform PMF
Ls = 5; % For two simulations, each with 2 and 10 random variables
g_pdf = @(y,my,sgmy2) exp(-(y-my).^2/2/sgmy2)/sqrt(2*pi*sgmy2); % Gaussian pdf
y = sum(rand(Ls,NoD))/Ls; 
figure('units','normalized','outerposition',[0 0 1 1],'color','w')


subplot(1,1,1)
[ns,cs] = hist(y,Bins);  % ns: Frequency counts, cs: Bin locations
hist(y,Bins),hold on

dy = cs(2)-cs(1); % Bin width
t = mx+[-500:500]*(mx/500); % Range on the y-axis
plot(t,NoD*dy*g_pdf(y,mx,Var_x/Ls),'r')
