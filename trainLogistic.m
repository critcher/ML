function weights = trainLogistic(X, Y, lambda, nIter)
  numLabels = uint32(max(Y) + 1);
  numComponents = size(X,2);
  weights = ones(numComponents, numLabels);
  for it = 1:nIter
    fprintf("%d/%d\r", it, nIter);
    fflush(stdout);
    expos = zeros(size(X,1), numLabels);
    for class = 1:numLabels
      expos(:, class) = exp(sum(repmat(weights(:,class)', size(X,1), 1) .* X, 2));
    end
    tempSums = sum(expos,2);
    probs = expos ./ repmat(tempSums, 1, numLabels);
    deltaW = weights * lambda;
    for point = 1:size(X,1)
      match = zeros(1, numLabels);
      match(1, Y(point, :) + 1) = 1;
      deltaW = deltaW - ((1/size(X,1)) * double(X(point, :)') * (match .- probs(point, :)));
    end
    weights = weights .- .1 * deltaW;
  end
  fprintf("\n");
  fflush(stdout);
end