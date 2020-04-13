% J. Dylan White
% 03.23.2020
% Octave Tutorial - Variables and arrays

% Some simple arithmetic
5+2;
3-1;
1/2;
3*2;
2^6;

% Setting variables
a = 3;
b = 'hi';
c = (3>=1);
c;
d = pi;
disp(d);
disp(sprintf('2 decimals: %0.2f',d));
disp(sprintf('6 decimals: %0.6f',d));

% Arrays
A = [1 2; 3 4; 5 6];
v = [1 2 3];
u = [1; 2; 3];
u == v';
w = 1:6;
C = ones(2,3);
x = ones(1,3);
y = zeros(1,3);
z = rand(1,3);
Z = rand(3,3);
normalDist = randn(1,3);
w = -6 + sqrt(10)*randn(1,10000);
hist(w);
I = eye(4);
help(rand)

% Set an array and examine size
A = [1 2; 3 4; 5 6];
sz = size(A);
sz_row = size(A,1);
sz_columns = size(A,2);

% Set a vector and examine length
v = 1:4;
len = length(v);