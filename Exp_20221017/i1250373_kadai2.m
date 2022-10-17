clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
%imshow(gimg);
