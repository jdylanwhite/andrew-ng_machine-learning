% J. Dylan White
% 03.23.2020
% Octave Tutorial - Moving Data Around

%===============================================================================
% Saving/Loading data to/from file
%===============================================================================

% Create a vector
v = rand(1,1000);

% Save the vector to file
save test.mat v
%save test.txt v -ascii

% Clear variables
clear

% Load the vector file back
load test.mat

%===============================================================================
% Array slicing and appending
%===============================================================================

% Create an array
A = [1 2 ; 3 4 ; 5 6];

% Get the element in r3 c2
A(3,2);

% Get the r2 vector
A(2,:);

% Get the c2 vector
A(:,2);

% Get the r1 & r3 vectors
A([1 3], :);

% Rewrite the c2 vector
A(:,2) = [10; 11; 12];

% Append a column
A = [A , [100; 101; 102]];

% Append a row
A = [A ; [1000, 1001, 1002]];

% Turn A into a vector
v = A(:);

% Reset A and create a new matrix
A = [1 2 ; 3 4 ; 5 6];
B = 10 + A;

% Concatenate A and B
C = [A B];
C = [A ; B];