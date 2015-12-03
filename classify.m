function Y = classify(m, X)
  Y = zeros(size(X, 1), 1);
  % For each data point, extract its features and use k-nearest neighbors to 
  % classify it.
  t = time();
  for ind = 1:size(X,1)
    transformed = extract_feature(X(ind, :), m.principleComps);
    Y(ind, 1) = knn(transformed, m.clusters, m.labels, 50, .9);
  end
  (time() - t) / size(X, 1)
end