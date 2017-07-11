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

%set up a matrix with 64 rows: C, sigma, error 


%All = zeros(64,3);
%errorRow = 0;
%c_test = [0.01 0.03 0.1 0.3 1 3 10 30];
%sigma_test = [0.01 0.03 0.1 0.3 1 3 10 30];
%for i = 1: length(c_test)
   %for j =1: length(sigma_test)
     %C = c_test(i);
     %sigma = sigma_test(j);
     %errorRow = errorRow + 1;
     %model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
     %predictions = svmPredict(model, Xval);
     %prediction_error = mean(double(predictions ~= yval));
     %All(errorRow,:)=[C,sigma,prediction_error];
   %end 
%end 

%[smallest_error,I] = min(All(:,3));
%C = All(I,1);
%sigma = All(I,2);
%set up a matrix with 64 rows: C, sigma, error 
A = zeros (64,3);
errorRow = 0;
value_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%C_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%sigma_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
for i = 1: 1:numel(value_test)
   for j =1: numel(value_test)
     errorRow = errorRow + 1;
     c_test = value_test(i);
     sigma_test = value_test(j);
     model= svmTrain(X, y, c_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
     predictions = svmPredict(model, Xval);
     prediction_error = mean(double(predictions ~= yval));
     A(errorRow,:)=[c_test,sigma_test,prediction_error];
   end 
end 

[smallest_error,I] = min(A(:,3));
C = A(I,1);
sigma = A(I,2);




% =========================================================================

end
