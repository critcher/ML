function feature = extract_full_feature2(point)
  feature = hog2(make_image(point, 32, 32, 3))(:)';
end