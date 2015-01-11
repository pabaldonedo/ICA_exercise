function plot_columns(X, window),
% PLOT_COLUMNS plots the columns of a matrix as images having a given size
%
% Usage:  plot_columns(X, window)
%
% Example:
%    images = load_images('*.tif');
%    window = [16, 16];
%    numpatches = 100;
%    patches = sample_patches(images, window, numpatches);
%    X = reshape(patches, prod(window), numpatches);
%    plot_columns(X, window);

[D, N] = size(X);

if nargin < 2,
  window = [sqrt(D), sqrt(D)];
else
  if prod(window) ~= D,
    error('Impossible window size');
  end
end

ysize = floor(sqrt(N));
xsize = ceil(N / ysize);

im0 = X - min(X(:));
im0 = im0 / max(im0(:));

for k=1:N,
  subplot(xsize, ysize, k);
  image(repmat(reshape(im0(:, k), window), [1, 1, 3]));
  colormap(gray);
  axis off
end
