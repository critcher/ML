function feature = extract_full_feature(point)
  feature = hog(make_image(point, 32, 32, 3))(:)';
end