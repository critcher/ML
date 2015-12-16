% Gaussian Naive Bayes classifier
function Y = classify1(m, X)
  Y = zeros(size(X, 1), 1);
  % For each data point, extract its features and use GNB to 
  % classify it.
  for ind = 1:size(X,1)
    transformed = extract_feature1(X(ind, :), m.principleComps);
    Y(ind, 1) = GNB(transformed, m.classProbs, m.means, m.variances);
  end
end