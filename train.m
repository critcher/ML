function Model = train(X, Y)
  singleImSize = size(dsift(make_image(X(1, :), 32, 32, 3)));
  allFeats = zeros(size(X,1) * singleImSize(1), singleImSize(2));
  for ind = 1:size(X,1)
    allFeats(1 + (ind - 1) * singleImSize(1):ind * singleImSize(1), :) = dsift(make_image(X(ind, :), 32, 32, 3));
  end
  pca = getPrincipleVectors(allFeats, .97);
  Model = pca;
end