function correct = kfold(data, labels, k)
  chunkSize = round(size(data, 1) / k);
  correct = 0;
  total = 0;
  for ind = 1:k
    fprintf("%d/%d\n", ind, k);
    fflush(stdout);
    startIndex = 1 + (ind - 1) * chunkSize;
    endIndex = min(ind * chunkSize, size(data, 1));
    if (startIndex == 1)
      range = [];
    else
      range = [1:startIndex-1];
    end
    if endIndex < size(data, 1)
      range = [range, endIndex+1:size(data,1)];
    end
    M = train1(data(range, :), labels(range, :));
    guesses = classify1(M, data(startIndex:endIndex, :));
    correct += sum(guesses == labels(startIndex:endIndex, :));
    total += size(guesses, 1);
  end
  correct /= total;
end