function Y = classify(m, X)
  t = time();
  Y = zeros(size(X, 1), 1);
  for ind = 1:size(X,1)
    transformed = extract_feature(X(ind, :), m.principleComps);
    Y(ind, 1) = knn(transformed, m.clusters, m.labels, 35);
  end
  time() - t
end