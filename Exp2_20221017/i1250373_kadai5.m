clear;
close all
img_name = 'kut.jpg';
output_name = 'input1_tonemapped.jpg';

img = imread(img_name);

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

resultR = red / 64;
resultR = resultR * 85;

resultG = tonecurveG(green);
resultB = tonecurveB(blue);

img(:,:,1) = resultR;
img(:,:,2) = resultG;
img(:,:,3) = resultB;

result = img;
imshow(result)

function out = tonecurveG(x)
    out_d = 127.5 - 255 / 2 * cos(3 * pi / 255 * double(x)); 
    out = uint8(out_d);
end

function out = tonecurveB(x)
    out = (255)/(150 - 25) * x -51;
end

function pl = pl(x)
[height, width] = size(x);
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
end