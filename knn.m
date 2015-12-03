function class = knn(point, clusters, labels, k, weighting)
% KNN Classify using weighted k-nearest neighbors
%   knn(point, clusters, labels, k, weighting)
%   point - the test point to classify
%   clusters - the training points (possible neighbors)
%   labels - the associated labels for each point in clusters
%   k - how many closest neighbors to use for classification
%   weighting - how much to favor the votes of closer neighbors

  % Create array of distances
  repeatedPoint = repmat(point, [size(clusters, 1), 1]);
  dists = sum((repeatedPoint .- clusters).^2, 2);
  % Sort the array and grab the top k
  [~, kIndices] = sort(dists);
  relevantDists = dists(kIndices(1:k));
  neighborLabels = labels(kIndices(1:k));
  % weight the votes
  weights = (ones(k, 1) .- (relevantDists ./ max(relevantDists))) .^ weighting;
  votes = zeros(1, k);
  for ind = 0:max(labels)
    votes(1,ind + 1) = sum(weights(neighborLabels == ind));
  end
  % return the class with the most votes  
  [~,class] = max(votes);
  class -= 1;
end