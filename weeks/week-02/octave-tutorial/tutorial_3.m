% J. Dylan White
% 03.23.2020
% Octave Tutorial - Computing on Data

%===============================================================================
% Initialize some matrices and vectors
%===============================================================================

A = [1 2 ; 3 4 ; 5 6];
B = A+10;
C = [1 1 ; 2 2];
v = [1;2;3];
a = [1 15 2 0.5];

%===============================================================================
% Perform some matrix operations
%===============================================================================

% Matrix product of A and C
A*C;

% Element product of A and B
A.*B;

% Element squaring of A
A .^ 2;

% Element inverse of v
1 ./ v;

% Element operations on v
log(v);
exp(v);
abs(-v);

% Increment elements of v by 1
v + ones(length(v),1);
v + 1 ;

% Matrix transpose
A';
A == (A')';

% Get maximum of a and tell me what index that was
val = max(a);
[val,ind] = max(a);

% Get the column wise maximum of A
max(A);

% Determine which elements of a are below 3 and tell me which indices they are
a < 3;
find(a<3);

% Create a magic square matrix and perform some of these operators
A = magic(3);
[r,c] = find(A>=7);
A(2,3);

% Add/Mult all of the elements of a
sum(a);
prod(a);

% Round up/down elements of a
ceil(a);
floor(a);

% Get the column wise maximum of A
max(A);
max(A,[],1);

% Get the row wise maximum of A
max(A,[],2);

% Get the max of the entire matrix
max(max(A));
max(A(:));

% Reset A and test magic properties
A = magic(9);
sum(A,1);
sum(A,2);
sum(sum(A.*eye(9)));

% Flip matrix
flipud(eye(9));
fliplr(eye(9));

% Find inverse of A
A = magic(3)
invA = pinv(A)
A*invA



