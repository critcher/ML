function image = make_image(data, w, h, channels)
  image = reshape(data, [h, w, channels]);
end