% Test script

%% Initialization
clear ; close all; clc

%  Load data
load ('ex8_movies.mat');

%  Y is a 1682x943 matrix, containing ratings (1-5) of 1682 movies on 
%  943 users
%
%  R is a 1682x943 matrix, where R(i,j) = 1 if and only if user j gave a
%  rating to movie i

%  We can "visualize" the ratings matrix by plotting it with imagesc
##imagesc(Y);
##ylabel('Movies');
##xlabel('Users');

%  Load pre-trained weights (X, Theta, num_users, num_movies, num_features)
load ('ex8_movieParams.mat');

%  Reduce the data set size so that this runs faster
num_users = 4; num_movies = 5; num_features = 3;
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);

lambda = 1.5
J = 0.5*sum(sum(((X*Theta' - Y).^2).*R));
J = J + 0.5*lambda*sum(sum(Theta.^2));
J = J + 0.5*lambda*sum(sum(X.^2));
X_grad = ((X*Theta' - Y).*R)*Theta;
X_grad = X_grad+lambda*X;
Theta_grad = ((X*Theta' - Y).*R)'*X;
Theta_grad = Theta_grad+lambda*Theta;
grad = [X_grad(:); Theta_grad(:)];
