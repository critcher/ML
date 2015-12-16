% Logistic regression classifier
function Model = train2(X, Y)
  pkg load image;
  pcaPercent = .8;
  numLabels = max(Y);
  
  allPoints = zeros(size(X,1), size(extract_full_feature2(X(1, :)), 2));
  for p = 1:size(allPoints,1)
    allPoints(p, :) = extract_full_feature2(X(p, :));
  end
  principleComps = getPrincipleVectors(allPoints, pcaPercent);
  
  numComponents = size(principleComps, 2);
  transformedPoints = zeros(size(X,1), numComponents + 1);
  for ind = 1:size(X,1)
    transformedPoints(ind, :) = [1 extract_feature2(X(ind, :), principleComps)];
  end
  weights = trainLogistic(transformedPoints, Y, 0, 500);
  % Fill the model
  Model.principleComps = principleComps;
  Model.weights = weights;
end