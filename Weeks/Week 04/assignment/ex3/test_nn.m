% Test script for ex3_nn.m

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;
num_labels = 10;

% Load Training Data
load('ex3data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

% Display the selected data
displayData(sel);

% Load the weights into variables Theta1 and Theta2
load('ex3weights.mat');

% Use the theta values to predict
pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);