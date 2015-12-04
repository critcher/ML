function feature = extract_feature1(point, pca)
  feature = extract_full_feature1(point);
  feature = reproject(feature, pca);
end