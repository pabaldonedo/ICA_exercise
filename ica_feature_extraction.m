%author: pablo alonso baldonedo
clear all
close all
clc

init()

images = load_images('images/nat*.tif');
window = [16, 16];
numpatches = 100;
patches = sample_patches(images, window, numpatches);
X = reshape(patches, prod(window), numpatches);
%plot_columns(X, window);

preprocessed_patches = preprocessing(X);
[icasig, A, W] = fastica(preprocessed_patches);
plot_columns(A);


%Convolving
convolving = images{2};

figure()
imshow(convolving, [])
for i = 99:99
    figure()
    subplot(1,2,1)
    imshow(reshape(A(:,i), 16, 16), [])
    subplot(1,2,2)
    convolved = conv2(double(convolving), reshape(A(:,i), 16, 16));
    imshow(convolved, [])
end
