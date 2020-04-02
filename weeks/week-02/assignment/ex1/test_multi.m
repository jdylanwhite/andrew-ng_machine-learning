data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
[X mu sigma] = featureNormalize(X);
disp(X)
X = [ones(m, 1) X];
alpha = 0.01;
num_iters = 400;
theta = zeros(3, 1);
J = zeros(num_iters+1,1);
h = X*theta;
J(1) = (1/(2*m))*(h - y)'*(h - y);

for i = 1:num_iters,

  theta = theta - ((alpha/m) * (h-y)' * X)';
  h = X*theta;
  J(i+1) = ((1/(2*m))*(h - y)'*(h - y));
  
  figure(2)
  plot([0:num_iters],J)
  ylabel('J');
  xlabel('Iteration');
  
  pause(0.01)

end