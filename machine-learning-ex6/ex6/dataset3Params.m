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
x1 = [1 2 1]; x2 = [0 4 -1];
c = [0.01,0.03,.1,.3,1,3,10,30];
m = length(c);
sig = [0.01,0.03,.1,.3,1,3,10,30];
errorL = ones(m,m);
for i=1:m
  for j=1:m
    model = svmTrain(X, y, c(i), @(x1,x2) gaussianKernel(x1, x2, sig(j)));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    errorL(i,j) = error;
  end
end
[val, idx] = min(errorL(:))
[I_row, I_col] = ind2sub(size(errorL),idx)
sigma = sig(I_col)
C = c(I_row)
errorL
% =========================================================================

end
