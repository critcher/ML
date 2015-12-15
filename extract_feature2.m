function feature = extract_feature2(point, pca)
  feature = extract_full_feature2(point);
  feature = reproject(feature, pca);
end