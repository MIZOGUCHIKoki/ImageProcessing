close all;

img = zeros(256,256);
[H, W] = size(img);
for y = 1:H
    for x = 1:W
        img(y,x) = sin(2 * pi / (256 / 4) * x)  + 1;
    end
end

imshow(img,[0 2]); %スケーリング