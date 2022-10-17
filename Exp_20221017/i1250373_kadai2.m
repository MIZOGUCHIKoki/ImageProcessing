clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
%imshow(gimg);
result = gimg / 64;
result = result * 85;
imshow(result)
[hegigh, width] = size(gimg);
count = zeros(1,256);

for k = 0:255 % 0<=k<=255
    for h = 1:width
        for w = 1:width
            if gimg(h,w) == k
                count(k+1) = count(k+1)+1;
            end
        end
    end
end
figure;
plot([0:255], count);
xlim([0 255]);
