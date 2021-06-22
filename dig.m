lc;clear;close all;
[land,land_map,land_alpha]=imread('land.png');
[dig,dig_map,dig_alpha]=imread('dig.jpg');
[sun,sun_map,sun_alpha]=imread('sun.png');
[ant,ant_map,ant_alpha]=imread('ants-re1.png');
[g,g_map,g_alpha]=imread('garbage1-re.png');

dig_resize = imresize(dig,0.5);
sun_resize = imresize(sun,0.5);
ant_resize = imresize(ant,0.4);
ant_alpha_resize = imresize(ant_alpha,0.4);
g_resize = imresize(g,0.08);
g_alpha_resize = imresize(g_alpha,0.08);
iland = imfinfo('land.png') ;
h_land = image(land);
axis off

hold on 
h_dig = image(15,350,dig_resize);


h_sun = image(sun_resize);


Mov(1)=getframe;


set(h_dig,'XData',300,'YData',200);
Mov(2)=getframe;%%
set(h_dig,'XData',15,'YData',350);
theta=linspace(0, 2*pi, 101);
fill(30*cos(theta)+425,5*sin(theta)+200,'k');
Mov(3)=getframe;

set(h_dig,'XData',300,'YData',200);
Mov(4)=getframe;

set(h_dig,'XData',15,'YData',350);
fill(50*cos(theta)+425,20*sin(theta)+200,'k');
Mov(5)=getframe;

set(h_dig,'XData',300,'YData',200);
Mov(6)=getframe;

set(h_dig,'XData',15,'YData',350);
fill(100*cos(theta)+425,50*sin(theta)+200,'k');
Mov(7)=getframe;

h_ant = image(350,10,ant_resize,'AlphaData', ant_alpha_resize);
Mov(8)=getframe;

set(h_ant,'XData',350,'YData',50);
Mov(9)=getframe;

set(h_ant,'Xdata',350,'Ydata',100);
Mov(10)=getframe;

text(300,70,'what the heck','color','b','Fontsize',20);
Mov(11)=getframe;

h_g = image(350,200,g_resize,'AlphaData',g_alpha_resize);
Mov(12)=getframe;
h_g = image(370,160,g_resize,'AlphaData',g_alpha_resize);
Mov(13)=getframe;
h_g = image(390,200,g_resize,'AlphaData',g_alpha_resize);
Mov(14)=getframe;
h_g = image(450,230,g_resize,'AlphaData',g_alpha_resize);
h_g = image(350,150,g_resize,'AlphaData',g_alpha_resize);
h_g = image(430,220,g_resize,'AlphaData',g_alpha_resize);
h_g = image(450,210,g_resize,'AlphaData',g_alpha_resize);
h_g = image(430,170,g_resize,'AlphaData',g_alpha_resize);
h_g = image(460,150,g_resize,'AlphaData',g_alpha_resize);
Mov(15)=getframe;
hold off

movie(Mov,1,1);
v = VideoWriter('dig.avi');
set(v,'FrameRate',1);
open(v);
writeVideo(v,Mov);
close(v);





