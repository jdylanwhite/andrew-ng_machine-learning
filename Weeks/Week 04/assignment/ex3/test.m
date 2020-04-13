% Test script for ex3.m

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;
num_labels = 10;

% Load data
load('ex3data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

% Display 2D data in a nice grid
displayData(sel);

% Set parameters and compute cost and grad
theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
lambda_t = 3;
[J grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

% One vs all classification
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

% Add ones to the X data matrix
X = [ones(m, 1) X];
[m,n] = size(X)
initial_theta = zeros(n, 1);
[J,grad] = lrCostFunction(initial_theta,X,y,lambda);
h = sigmoid(X*all_theta');
[v,p] = max(h,[],2);
