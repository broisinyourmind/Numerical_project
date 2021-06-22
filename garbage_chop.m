clc;clear;close all;

land = imread('land_park1.jpg');

[p1, p1_cmap, p1_alpha] = imread('people1-re.png');
[p2, p2_cmap, p2_alpha] = imread('people2-re.png');
[g1, g1_cmap, g1_alpha] = imread('garbage1-re.png');
[b, b_cmap, b_alpha] = imread('bottle-re.png');


p1_resize = imresize(p1,0.2);
p1_alpha_resize = imresize(p1_alpha,0.2);
p2_resize = imresize(p2,0.2);
p2_alpha_resize = imresize(p2_alpha,0.2);

g1_resize = imresize(g1,0.1);
g1_alpha_resize = imresize(g1_alpha,0.1);
b_resize = imresize(b,0.1);
b_alpha_resize = imresize(b_alpha,0.1);

h_land = image(land);
h_land.AlphaData = 0.57;
axis off;
Mov(1) = getframe;
hold on

h_p1 = image(100, 350, p1_resize, 'AlphaData', p1_alpha_resize);
Mov(2) = getframe;
h_p2 = image(400, 350, p2_resize, 'AlphaData', p2_alpha_resize);
Mov(3) =getframe;
h_g1 = image(250, 450, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(4) = getframe;
h_b = image(430, 400, b_resize, 'AlphaData', b_alpha_resize);
Mov(5) = getframe;



set(h_p1, 'XData', 200, 'YData', 300);
Mov(6) = getframe;
set(h_p1, 'Visible', 'off');
Mov(7) = getframe;



set(h_p2, 'XData', 300, 'YData', 300);
Mov(8) = getframe;
set(h_p2, 'Visible', 'off');
Mov(9) = getframe;
h_g2 = image(400, 430, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(10) = getframe;
h_b1 = image(100, 390, b_resize, 'AlphaData', b_alpha_resize);
Mov(11) = getframe;
h_g3 = image(160, 400, g1_resize, 'AlphaData', g1_alpha_resize);
Mov(12) = getframe;
h_b2 = image(200, 400, b_resize, 'AlphaData', b_alpha_resize);



hold off

movie(Mov,1,2);
v = VideoWriter('garbage.avi');
set(v,'FrameRate',2);
open(v);
writeVideo(v,Mov);
close(v);


