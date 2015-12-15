function feat = hog2(image)

image = rgb2gray(image);
if ~isa(image, 'single'), image = single(image); end;

cellsize = 4;
feat = vl_hog(image, cellsize);
feat = double(feat);
feat = reshape(feat, [(32/cellsize)^2, 31]);
end