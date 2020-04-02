% Test script for ex2

% Read data and set arrays
data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% Plot data
%figure; hold on;
%pos = find(y==1);
%neg = find(y==0);
%plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);
%plot(X(neg,1),X(neg,2),'ko','LineWidth',1,'MarkerSize',7,'MarkerFaceColor','y');
%ylabel('Exam 2 Score');
%xlabel('Exam 1 Score');

%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Get hypothesis function from sigmoid function
h = sigmoid(X*initial_theta);

% Calculate the cost function
J = (1.0/m)*(-y'*log(h) - (1.0-y)'*log(1.0-h));
grad = (1.0/m)*X'*(h-y);

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
  
% Calculate probabilities  
p = sigmoid(X*theta);
p(find(p>=0.5)) = 1;
p(find(p<0.5)) = 0;