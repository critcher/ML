% Logistic regression classifier
function Y = classify2(m, X)
  Y = zeros(size(X, 1), 1);
  % For each data point, extract its features and use GNB to 
  % classify it.
  for ind = 1:size(X,1)
    transformed = extract_feature2(X(ind, :), m.principleComps);
    Y(ind, 1) = classifyLogistic([1 transformed], m.weights);
  end
end