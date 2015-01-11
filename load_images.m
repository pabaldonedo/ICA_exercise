function images = load_images(files),
% LOAD_IMAGES  Load a set of images and return them in a cell array
%
% The images to load are given as a pattern, possibly including wildcards.
%
% Example:
%    images = load_images('*.tif');

[pathstr, name, ext] = fileparts(files);
f = dir(files);
images = cell(1, length(f));

for k=1:length(f),
  images{k} = imread(fullfile(pathstr, f(k).name));
end
