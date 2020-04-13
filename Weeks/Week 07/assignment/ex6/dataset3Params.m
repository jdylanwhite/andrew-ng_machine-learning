function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Set list of parameters
CList = [0.01,0.03,0.1,0.3,1.,3.,10.,30.];
sigmaList = [0.01,0.03,0.1,0.3,1.,3.,10.,30.];
error = zeros(length(CList)*length(sigmaList),3);

row = 0;
for C = CList
  for sigma = sigmaList
     row = row+1;
     fprintf("Count = %g / %g",row,length(CList)*length(sigmaList))
     model=svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
     pred=svmPredict(model,Xval);
     error(row,:) = [mean(double(pred~=yval)),C,sigma];
   end
 end
 

 [r,c] = find(error(:,1)==min(error(:,1)));
 C = error(r,2);
 sigma = error(r,3);



% =========================================================================

end
