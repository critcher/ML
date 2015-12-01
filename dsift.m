function feat = dsift(image)

image = rgb2gray(image);
if ~isa(image, 'single'), image = single(image); end;

[~, feat] = vl_dsift(image, 'size', 4 , 'step' , 16);
feat = double(feat');
end