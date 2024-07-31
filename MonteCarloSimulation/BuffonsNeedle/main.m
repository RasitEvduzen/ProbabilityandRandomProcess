% Monte Carlo Simulation - Buffon's Needles 
% Written By: Rasit
% 30-Jul-2024
clc, clear all, close all;
%%
d = 1;   % Distance between parallel lines
l = 0.5; % Length of the needle
N = 200; % Number Of Iter
line_extent = 4; 
crossCount = 0;
iterations = 1:N;

figure('units', 'normalized', 'outerposition', [0 0 1 1], 'color', 'w')
subplot(121),hold on;axis([-4 4 -4 4]),axis off;
title('Buffon''s Needle Simulation');

for k = -line_extent:line_extent
    xline(k); % plot lines
end

for i = 1:N
    x_center = (line_extent-d)*(2*rand()-1); 
    y_center = (line_extent-d)*(2*rand()-1); 
    theta = rand*pi;

    x1 = x_center-(l/2)*cos(theta);
    y1 = y_center-(l/2)*sin(theta);
    x2 = x_center+(l/2)*cos(theta);
    y2 = y_center+(l/2)*sin(theta);

    
    x_min = min(x1, x2);
    x_max = max(x1, x2);

    if floor(x_min/d) ~= floor(x_max/d)
        crossCount = crossCount + 1;
        plot(subplot(121), [x1, x2], [y1, y2], 'r', 'LineWidth', 1); % Crosses a line (red needle)
        plot(subplot(121), x1, y1, 'o', 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', 5);

    else
        plot(subplot(121), [x1, x2], [y1, y2], 'b', 'LineWidth', 1); % Does not cross (blue needle)
        plot(subplot(121), x2, y2, 'o', 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'MarkerSize', 5);
    end
    % Estimate pi using crossing count
    if crossCount > 0
        pi_estimate = (2 * l * i) / (d * crossCount);
        pi_values(i) = pi_estimate;
    else
        pi_values(i) = 0;
    end
    subplot(122)
    plot(iterations(1:i), pi_values(1:i),'b'),hold on
    xlim([1 N]),ylim([1 6]),xlabel('Iteration');
    yline(pi,"r",LineWidth=2)
    title("Estimated Value of \pi: "+num2str(pi_values(i)));
    drawnow;
end
