% Test script of ex2_reg

%% Initialization
clear ; close all; clc;

%% Load Data
data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);

% Plot data
plotData(X, y);
hold on;
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')
legend('y = 1', 'y = 0')
hold off;

% Add Polynomial Features
X = mapFeature(X(:,1), X(:,2));

%% Initialize fitting parameters
%initial_theta = zeros(size(X, 2), 1);
%
%% Set regularization parameter lambda to 1
%lambda = 1;
%
%% Compute and display initial cost and gradient for regularized logistic
%% regression
%[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);
%cost
%grad