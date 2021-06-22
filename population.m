clc;clear;close all;

[img_p,cmap] = imread('population1.png');
imshow(img_p,cmap); 

Mov(1) = getframe;
size(img_p);



% hold on;
% x = linspace(1,573);
% y = exp(x/70);
% h = plot(x,-(y-560),'-r','LineWidth',5);
% legend('population','Location','NorthWest');
% Mov(2) = getframe;
x=linspace(1,573);
y = exp(x/70);

for ii = 1:100
    hold on
    h = plot(x(1:ii),-(y(1:ii)-400),'-r','LineWidth',5);
    legend('population','Location','NorthWest');
    
    switch ii
        case ii<10
            pause(0.005)
        case ii>=10 && ii<100
            pause(0.001)
        case ii>=100
            pause(0.0001)
    end
    Mov(ii) = getframe;
end
movie(Mov,1,30);
v = VideoWriter('population.avi');
set(v,'FrameRate',30);
open(v);
writeVideo(v,Mov);
close(v);



