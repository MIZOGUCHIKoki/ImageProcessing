close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

%グレイスケール画像に変換
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);

[height,width] = size(gimg);
outimg = zeros(height,width);
hist = zeros(1,256);
for k=0:255
    count = 0;
    for i = 1:height
        for j = 1:width
            if gimg(i,j) == k
                count = count + 1; 
            end
        end
    end
end
plot(0:255,hist);
xlim([0 256]);
map = zeros(256,1);
oimg = zeros(height,width);

for k=1:256
    map(k) = (1.0/2)*(k-1) + 128;
end

for h = 1:height
    for w = 1:width 
        oimg(h,w) = map(gimg(h,w)+1);
    end
end

gimg = unit8(oimg);
figure;
imshow(result);

count = zeros(1,256);
for k = 0:255
    for h = 1:height
        for w = 1:width
            if result(h,w) == k
                count(k+1) = count(k+1) + 1;
            end
        end
    end
end
figure;
plot([0:255], count);
xlim([0 255]);