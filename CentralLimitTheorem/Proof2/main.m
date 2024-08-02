% Central Limit Theorem Proof
% Written By: Rasit
% Date: 02-Aug-2024
clc,clear,close all
%%
% Simulation parameters
num_samples = 200; % Number of samples
t = linspace(-3,3,num_samples); % Time Vec
signal1 = double(t>=-1&t<=1);
signal2 = double(t>=-.5&t<=.5);
conv_result = signal1;
num_iterations = 3;

figure('units', 'normalized', 'outerposition', [0 0 1 1], 'color', 'w')
for n = 1:num_iterations
    fixed_signal = conv_result;
    conv_result = zeros(1,num_samples);
    for k = 1:length(t)
        shifted_signal2 = circshift(fliplr(signal2), [0, k-num_samples/2]); % Circular Convolution
        conv_result(k) = sum(fixed_signal.*shifted_signal2)*(t(2)-t(1));
        if mod(k,10) == 0
            clf
            plot(t, fixed_signal, 'b', 'LineWidth', 2),hold on
            plot(t, shifted_signal2, 'r', 'LineWidth', 2);
            plot(t, conv_result, 'y', 'LineWidth', 2);
            x_patch = [t, fliplr(t)];
            y_patch = [zeros(1, num_samples), fliplr(conv_result)];
            patch(x_patch, y_patch, [.1 .1 .1], 'FaceAlpha', 0.4, 'EdgeColor', 'none');
            axis([-5 5 -0.1 1.1]);yline(0, 'LineWidth', 2);
            title("Central Limit Theorem")
            legend('Previous Convolution Result', 'Step Function', 'New Convolution Result', 'Function Area');
            drawnow;
        end
    end
end
