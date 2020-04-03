% Test for ex4

%===============================================================================
% Load and set up data 
%===============================================================================

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   

% Load Training Data
load('ex4data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);
displayData(X(sel, :));

% Load the weights into variables Theta1 and Theta2
load('ex4weights.mat');

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:)];

% Set y array to be m by K
yMatrix = eye(num_labels)(y,:);

%===============================================================================
% Perform forward propagation
%===============================================================================

% Set a1
s1 = size(X,1);
a1 = [ones(s1,1),X];

% Set z2, a2
z2 = a1*Theta1';
s2 = size(z2,1);
a2 = [ones(s2,1),sigmoid(z2)];

% Set z3,a3
z3 = a2*Theta2';
a3 = sigmoid(z3);

%===============================================================================
% Calculate the regularized cost function
%===============================================================================

% Set regularization coefficient
lambda = 1;

% Calculate cost function
J = 0.0;
for i = 1:m
  J = J + (-yMatrix(i,:)*log(a3(i,:))') - ((1-yMatrix(i,:))*log(1-a3(i,:))');
end
J = J/m

J = J + (lambda/(2*m))*(sum(Theta1(:,2:end)(:).^2)+sum(Theta2(:,2:end)(:).^2))

%===============================================================================
% Backpropagate to get the gradients
%===============================================================================

delta3 = a3 - yMatrix;
delta2 = delta3*Theta2(:,2:end).*sigmoidGradient(z2);
  
Delta1 = delta2'*a1;
Delta1 = Delta1/m;
Delta2 = delta3'*a2;
Delta2 = Delta2/m;