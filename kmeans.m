function curMeans = kmeans(data, k, maxIters)
  dim = size(data, 2);
  curMeans = zeros(k, dim);
  curLabels = zeros(size(data, 1), 1);
  mins = min(data);
  maxes = max(data);
  for ind = 1:k
    curMeans(ind, :) = mins .+ (rand(1, dim) .* (maxes .- mins));
  end
  oldLabels = ones(k, dim);
  iters = 0;
  while (~isequal(curLabels, oldLabels) && iters < maxIters)
    oldLabels = curLabels;
    iters += 1;
    % Assign data points to clusters
    for curPoint = 1:size(data,1)
      repeatedPoint = repmat(data(curPoint), [k, 1]);
      dists = sum((repeatedPoint .- curMeans).^2, 2);
      [~, curLabels(curPoint)] = min(dists);
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