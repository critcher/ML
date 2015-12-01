function class = nn(point, Model)
  class = 0;
  minDist = -1;
  for curCluster = 1:size(Model.clusterPoints, 1)
    clusterMeans = cell2mat(Model.clusterPoints(curCluster, 1));
    for curMean = 1:size(clusterMeans, 1)
      dist = sum((point .- clusterMeans(curMean, :)).^2);
      if (minDist < 0 || dist < minDist)
        minDist = dist;
        class = curCluster - 1;
      end
    end
  end
end