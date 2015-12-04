function class = GNB(point, pis, mews, sigmas)
  probs = log(pis);
  for ind = 1:size(point, 2)
    probs = probs .+ log(normpdf(point(ind), mews(ind, :), sigmas(ind, :))');
  end
  % return the class with the highest probability
  [~,class] = max(probs);
  class -= 1;
end