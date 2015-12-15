function class = classifyLogistic(point, weights)
  probs = exp(point * weights);
  % return the class with the highest probability
  [~,class] = max(probs);
  class -= 1;
end