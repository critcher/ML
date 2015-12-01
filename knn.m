function class = knn(point, clusters, labels, k)
  % Create array of distances
  repeatedPoint = repmat(point, [size(clusters, 1), 1]);
  dists = sum((repeatedPoint .- clusters).^2, 2);
  % Sort the array and grab the top k
  [~, kIndices] = sort(dists);
  neighborLabels = labels(kIndices(1:k));
  class = mode(neighborLabels);
end