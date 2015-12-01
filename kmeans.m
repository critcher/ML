function curMeans = kmeans(data, k)
  dim = size(data, 2);
  curMeans = zeros(k, dim);
  curLabels = zeros(size(data, 1), 1);
  mins = min(data);
  maxes = max(data);
  for ind = 1:k
    curMeans(ind, :) = mins .+ (rand(1, dim) .* (maxes .- mins));
  end
  oldLabels = ones(k, dim);
  while (~isequal(curLabels, oldLabels))
    oldLabels = curLabels;
    % Assign data points to clusters
    for curPoint = 1:size(data,1)
      minDist = -1;
      for curCluster = 1:k
        dist = sum((data(curPoint, :) - curMeans(curCluster)).^2);
        if (minDist < 0 || dist < minDist)
          minDist = dist;
          curLabels(curPoint) = curCluster;
        end
      end
    end
    % Move means to average of new labels
    for curCluster = 1:k
      relativePoints = data(curLabels == curCluster,:);
      if(~isempty(relativePoints))
        curMeans(curCluster, :) = mean(relativePoints, 1);
      end
    end
  end
end