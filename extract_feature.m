function feature = extract_feature(point, pca)
  feature = extract_full_feature(point);
  feature = reproject(feature, pca);
end