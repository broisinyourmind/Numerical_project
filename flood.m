% close all
clear
clc

I = imread("tw.bmp");
doder = im2double(I);

% state1 = doder <= 0.5;
% state2 = doder > 0.5;
% doder2 = 0.5 .* state1 + doder .* state2;
% imshow(doder2);
% colormap jet;
dd = [[0 0 1];[0 1 0]];



for ii = 1:1000
%     state1 = doder <= 0.0001*ii;
%     state2 = doder > 0.0001*ii;
%     doder2 = 0.0001*ii .* state1 + doder .* state2;
    doder = doder - 0.0001;
    imshow(doder);
    colormap(dd)
    pause(0.05)

end