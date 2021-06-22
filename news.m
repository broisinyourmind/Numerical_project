clc;clear;close all;
[img_n,cmap] = imread('news1.jpg');
size(img_n)
news1 = imshow(img_n,cmap);

% news2 = imresize(news1(img_n),[500 500])
Mov(1) = getframe;
text(10,10,'according to the news ......','Color','red','FontSize',20);
Mov(2) = getframe;

movie(Mov,1,0.5);
v = VideoWriter('news.avi');
set(v,'FrameRate',0.5);
open(v);
writeVideo(v,Mov);
close(v);
