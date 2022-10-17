clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
%imshow(gimg);
result = tonecurve(gimg);
imshow(result);

function out = tonecurve(x)
    if x< 64
        out = 0;
    elseif x< 128
        out = 85;
    elseif x < 192
        out = 170;
    else
        out = 255
    end
end
