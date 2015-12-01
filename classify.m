function Y = classify(m, X)
  Y = zeros(size(X, 1), 1);
  for ind = 1:size(X,1)
    transformed = extract_feature(X(ind, :), m.principleComps);
    Y(ind, 1) = nn(transformed, m);
  end
end