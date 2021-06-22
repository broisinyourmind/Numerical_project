clc;clear;close all;

%land = imread('river.jpg');
land = imread('river.jpg');

[p1, p1_cmap, p1_alpha] = imread('watoo.png');
[p2, p2_cmap, p2_alpha] = imread('car.png');
[p3, p3_cmap, p3_alpha] = imread('car2.png');
[g1, g1_cmap, g1_alpha] = imread('car3.png');
[b, b_cmap, b_alpha] = imread('car4.png');%purplecar


p1_resize = imresize(p1,0.3);
p1_alpha_resize = imresize(p1_alpha,0.3);
p2_resize = imresize(p2,0.4);
p2_alpha_resize = imresize(p2_alpha,0.4);
p3_resize = imresize(p3,0.4);
p3_alpha_resize = imresize(p3_alpha,0.4);
g1_resize = imresize(g1,0.4);
g1_alpha_resize = imresize(g1_alpha,0.4);
b_resize = imresize(b,0.6);
b_alpha_resize = imresize(b_alpha,0.6);

h_land = image(land);
h_land.AlphaData = 0.6;
%axis off;
Mov(1) = getframe;
hold on

h_p1 = image(10, 350, p1_resize, 'AlphaData', p1_alpha_resize);
Mov(2) = getframe;
h_p2 = image(150, 350, p2_resize, 'AlphaData', p2_alpha_resize);
Mov(3) =getframe;
h_g1 = image(250, 300, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(4) = getframe;
h_b = image(330, 300, b_resize, 'AlphaData', b_alpha_resize);
Mov(5) = getframe;
h_text1 = text(250, 50, 'µs±Ä¬â¥Û', 'Color', 'blue', 'FontSize', 23);
Mov(6) = getframe;
set(h_text1, 'Visible', 'on');
Mov(7) = getframe;
set(h_p1, 'XData', 30, 'YData', 60);
Mov(8) = getframe;
set(h_p1, 'Visible', 'on');
Mov(9) = getframe;
h_text2 = text(635, 500, '', 'Color', 'red', 'FontSize', 13);
Mov(10) = getframe;
set(h_text2, 'Visible', 'on');
Mov(11) = getframe;
set(h_p2, 'XData', 30, 'YData', 230);
Mov(12) = getframe;
set(h_p2, 'Visible', 'on');
Mov(13) = getframe;
h_g2 = image(650, 50, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(14) = getframe;
h_b1 = image(500, 450, b_resize, 'AlphaData', b_alpha_resize);
Mov(15) = getframe;
h_g3 = image(350, 450, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(16) = getframe;
h_b2 = image(750, 300, b_resize, 'AlphaData', b_alpha_resize);
Mov(17) = getframe;
h_g4 = image(100, 450, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(18) = getframe;
h_b3 = image(150, 430, b_resize, 'AlphaData', b_alpha_resize);
Mov(19) = getframe;
text(250,400,'','Color','red','FontSize',13);
Mov(20) = getframe;
hold off

movie(Mov,1,1);
v = VideoWriter('stealsand.avi');
set(v,'FrameRate',2);
open(v);
writeVideo(v,Mov);
close(v);



