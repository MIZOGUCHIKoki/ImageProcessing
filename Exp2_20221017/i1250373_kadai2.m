clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
%imshow(gimg);
result = kaidan(gimg);

imshow(result)
[height, width] = size(result);
count = zeros(1,256);
for k = 0:255 % 0<=k<=255
    for h = 1:height
        for w = 1:width
            if gimg(h,w) == k
                count(k+1) = count(k+1)+1;
            end
        end
    end
end
figure;
plot(0:255, count);
xlim([0 255]);
function out = kaidan(x)
    out = x / 64;
    out = out * 85; 
end
