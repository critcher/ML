function Model = train(X, Y)
  pkg load image;
  k = 5;
  pcaPercent = .75;
  numLabels = max(Y);
  clusterPoints = {};
  
  allPoints = zeros(size(X,1), size(extract_full_feature(X(1, :)), 2));
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
    clusterPoints(curLabel + 1, 1) = transformedPoints;
  end
  % Fill the model
  Model.principleComps = principleComps;
  Model.clusters = cell2mat(clusterPoints);
  Model.labels = zeros(size(Model.clusters, 1), 1);
  curLabel = 1;
  for ind = 1:size(clusterPoints)
    curClusterPoints = clusterPoints{ind};
    for ind2 = 1:size(curClusterPoints, 1)
      Model.labels(curLabel, 1) = ind - 1;
      curLabel += 1;
    end
  end
end