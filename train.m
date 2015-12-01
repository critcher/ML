function Model = train(X, Y)
  k = 5;
  numLabels = max(Y);
  clusterPoints = {};
  for curLabel = 0:numLabels
    curClassPoints = X(Y == curLabel, :);
    clusterPoints(curLabel + 1) = kmeans(curClassPoints, 5);
  end
  Model.clusterPoints = clusterPoints;
end