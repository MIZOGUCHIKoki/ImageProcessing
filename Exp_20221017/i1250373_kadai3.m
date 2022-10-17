clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
%imshow(gimg);

%入力画像のヒストグラムを出力
result = tonecurve(gimg);
imshow(result);

function out = tonecurve(x)
    out_d = 127.5 - 255 / 2 * cos(3 * pi / 255 * double(x));  % 計算結果をいったん実数型(double)で保持
    out = uint8(out_d);
end