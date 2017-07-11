function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
% Both sets of code are working! Yeah!

C = zeros(size(centroids, 1),1);
S = zeros(K, n);
for i = 1: m
  for j = 1: K
    if(idx (i) == j)
    C(j) = C(j)+1;
    S(j,:) = S(j,:) + X(i,:);
 end
 centroids (j,:) = 1/C(j)*S(j,:);
end 
end 

% the following code used the vector summary. more simple

%C = zeros(size(centroids, 1),1);
%for j = 1:K
  %C(j)= sum(idx == j);
  %centroids(j,:)= 1/C(j)*((idx == j)'* X);
%end


% =============================================================


end

