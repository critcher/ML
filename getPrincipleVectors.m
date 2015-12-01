function principleVecs = getPrincipleVectors(dataPoints, percentCaptured)
  covMat = cov(dataPoints);
  [eigVecs, d] = eigs(covMat, size(covMat, 1));
  eigVals = sum(d, 1);
  eigVals = eigVals ./ sum(abs(eigVals));
  totalCaptured = 0;
  index = 1;
  while (index <= size(eigVals, 2) && totalCaptured < percentCaptured)
    totalCaptured += eigVals(index);
    index += 1;
  end
  principleVecs = eigVecs(:, 1:index - 1);
end