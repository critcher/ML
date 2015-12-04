function Model = train1(X, Y)
  pkg load image;
  pcaPercent = .8;
  numLabels = max(Y);
  
  allPoints = zeros(size(X,1), size(extract_full_feature1(X(1, :)), 2));
  for p = 1:size(allPoints,1)
    allPoints(p, :) = extract_full_feature1(X(p, :));
  end
  principleComps = getPrincipleVectors(allPoints, pcaPercent);
  
  numComponents = size(principleComps, 2);
  classProbs = zeros(numLabels, 1);
  means = zeros(numComponents, numLabels);
  variances = zeros(numComponents, numLabels);
  for curLabel = 0:numLabels
    curClassPoints = X(Y == curLabel, :);
    transformedPoints = zeros(size(curClassPoints,1), size(principleComps, 2));
    for p = 1:size(curClassPoints,1)
      transformedPoints(p, :) = extract_feature1(curClassPoints(p, :), principleComps);
    end
    classProbs(curLabel + 1, 1) = size(transformedPoints, 1) / size(X, 1);
    means(:, curLabel + 1) = mean(transformedPoints, 1)';
    variances(:, curLabel + 1) = std(transformedPoints, 1)';
  end
  % Fill the model
  Model.principleComps = principleComps;
  Model.means = means;
  Model.variances = variances;
  Model.classProbs = classProbs;
end