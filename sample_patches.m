function res = sample_patches(images, window, samples),
% SAMPLE_PATCHES samples patches from given cell array of images
%
% Usage:  patches = sample_patches(images, windowsize, samplecount)
%    returns samplecount patches of size windowsize from images.
%
% Example:
%    images = load_images('*.tif');
%    patches = sample_patches(images, [16, 16], 100);

N = length(images);
res = zeros([window, samples]);

imginds = ceil(N * rand(1, samples));

for k=1:N,
  I = find(imginds == k);
  isize = size(images{k}) - window;
  pos = ceil(repmat(isize', 1, length(I)) .* rand(2, length(I)));
  for l=1:length(I),
    res(:, :, I(l)) = images{k}(pos(1, l)+(0:window(1)-1), pos(2, l)+(0:window(2)-1));
  end
end
