% Test for ex5.m

%% Initialization
clear ; close all; clc

%===============================================================================
% Load and plot the data
%===============================================================================

% Load from ex5data1: 
load ('ex5data1.mat');

% m = Number of examples
m = size(X, 1);

% Plot training data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');

%===============================================================================
% Calculate the regularized cost function and gradient
%===============================================================================

% Set initial parameters
theta = [1 ; 1];

% Calculate cost function and gradient
[J, grad] = linearRegCostFunction([ones(m, 1) X], y, theta, 1);


%===============================================================================
% Train linear regression
%===============================================================================

lambda = 0;
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);

%  Plot fit over the data
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
hold on;
plot(X, [ones(m, 1) X]*theta, '--', 'LineWidth', 2)
hold off;

%===============================================================================
% Learning curves
%===============================================================================

lambda = 0;
[error_train, error_val] = ...
    learningCurve([ones(m, 1) X], y, ...
                  [ones(size(Xval, 1), 1) Xval], yval, ...
                  lambda);

plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])

fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end

%===============================================================================
% Create polygon features
%===============================================================================

p=8;
X_poly = zeros(numel(X), p);
for i = 1:p
  X_poly(:,i) = X.^i;
end