clear all, clc, clf;

data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:,1)];
theta = zeros(2, 1);
iterations = 1500;
alpha = 0.01;
J = zeros(iterations+1,1) ;
h = X*theta;
J(1) = (1/(2*m))*(h - y)'*(h - y);
disp(theta)

figure(1)
plot(X(:,2),y,'rx','MarkerSize',10);
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');
hold on

%for i = 1:iterations,
%
%  theta = theta - ((alpha/m) * (h-y)' * X)';
%  h = X*theta;
%  J(i+1) = ((1/(2*m))*(h - y)'*(h - y));
%  
%  figure(2)
%  plot([0:iterations],J)
%  ylabel('J');
%  xlabel('Iteration');
%  
%  pause(0.01)
%
%end

theta = gradientDescent(X, y, theta, alpha, iterations);

%figure(1)
%plot(X(:,2), X*theta, 'b-');
%legend('Training data', 'Linear regression');