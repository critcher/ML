function Model = train(X, Y)
  pkg load image;
  k = 5;
  pcaPercent = .95;
  numLabels = max(Y);
  clusterPoints = {};
  
  allPoints = zeros(size(X,1), 4*128);
  for p = 1:size(allPoints,1)
    allPoints(p, :) = extract_full_feature(X(p, :));
  end
  principleComps = getPrincipleVectors(allPoints, pcaPercent);
  
  for curLabel = 0:numLabels
    curClassPoints = X(Y == curLabel, :);
    transformedPoints = zeros(size(curClassPoints,1), size(principleComps, 2));
    for p = 1:size(curClassPoints,1)
      transformedPoints(p, :) = extract_feature(curClassPoints(p, :), principleComps);
    end
    clusterPoints(curLabel + 1, 1) = kmeans(transformedPoints, 5, 200);
  end
  Model.clusterPoints = clusterPoints;
  Model.principleComps = principleComps;
end