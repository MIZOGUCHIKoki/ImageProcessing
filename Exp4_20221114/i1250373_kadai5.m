close all;

img = zeros(256,256);
[H, W] = size(img);
for y = 1:H
    for x = 1:W
        img(x,y) = sin(2 * pi / (256 / 4) * x) + 1;
    end
end
fft2_img = fft2(img);
fspec = fftshift(fft2_img);
j = abs(fspec);
power = j * j;

figure;
colormap(gray);
imagesc([-128:127],[-128:127], power);
axis image;
