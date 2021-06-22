close all
clear
clc

% 載入圖片
[img_Tree1,cmap_Tree1,alpha_Tree1] = imread('Tree1.png');
[img_Tree1T,cmap_Tree1T,alpha_Tree1T] = imread('Tree1T.png');
[img_Tree1B,cmap_Tree1B,alpha_Tree1B] = imread('Tree1B.png');
[img_CO2,cmap_CO2,alpha_CO2] = imread('CO2.png');
[img_O2,cmap_O2,alpha_O2] = imread('O2.png');
[img_Lumberjack,cmap_Lumberjack,alpha_Lumberjack] = imread('Lumberjack.png');
[img_Thermometer,cmap_Thermometer,alpha_Thermometer] = imread('Thermometer.png');
[img_Fire,cmap_Fire,alpha_Fire] = imread('Fire.png');
BG = imread('bg.jpg');

img_Tree1_resize = imresize(img_Tree1,0.3);
alpha_Tree1_resize = imresize(alpha_Tree1,0.3);
img_CO2_resize = imresize(img_CO2,0.1);
alpha_CO2_resize = imresize(alpha_CO2,0.1);
img_O2_resize = imresize(img_O2,0.1);
alpha_O2_resize = imresize(alpha_O2,0.1);
img_Lumberjack_resize = imresize(img_Lumberjack,0.3);
alpha_Lumberjack_resize = imresize(alpha_Lumberjack,0.3);
img_Tree1T_resize = imresize(img_Tree1T,0.3);
alpha_Tree1T_resize = imresize(alpha_Tree1T,0.3);
img_Tree1B_resize = imresize(img_Tree1B,0.3);
alpha_Tree1B_resize = imresize(alpha_Tree1B,0.3);
img_Thermometer_resize = imresize(img_Thermometer,1);
alpha_Thermometer_resize = imresize(alpha_Thermometer,1);
img_Fire_resize = imresize(img_Fire,0.5);
alpha_Fire_resize = imresize(alpha_Fire,0.5);

figure(1)
axes
h_BG = image(BG);
axis off

% hold on
% h_Tree1_1 = image(30,200,img_Tree1_resize, 'AlphaData', alpha_Tree1_resize);
% hold on
% h_Tree1_2 = image(180,200,img_Tree1_resize, 'AlphaData', alpha_Tree1_resize);
% hold on
% h_Tree1_3 = image(330,200,img_Tree1_resize, 'AlphaData', alpha_Tree1_resize);

hold on
h_Tree1T_1 = image(30,200,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_1 = image(30,200,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_2 = image(180,200,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_2 = image(180,200,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_3 = image(330,200,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_3 = image(330,200,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);

hold on
h_CO2_1 = image(50,50,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_2 = image(240,60,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_3 = image(430,70,img_CO2_resize, 'AlphaData', alpha_CO2_resize);

for ii = 1:50
    pause(0.05)
    set(h_CO2_1,'XData',50+0.95*ii,'YData',50+2.6*ii);
    set(h_CO2_2,'XData',240-0.1*ii,'YData',60+2.7*ii);
    set(h_CO2_3,'XData',430-0.3*ii,'YData',70+2.5*ii);
    Mov(ii) = getframe;
end

for ii2 = 25:-1:1
    pause(0.05)
    set(h_CO2_1,'AlphaData',alpha_CO2_resize*0.12*ii2);
    set(h_CO2_2,'AlphaData',alpha_CO2_resize*0.12*ii2);
    set(h_CO2_3,'AlphaData',alpha_CO2_resize*0.12*ii2);
    Mov(length(Mov)+1) = getframe;
end

for hh = 1:10
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

set(h_CO2_1,'Visible', 'off');
set(h_CO2_2,'Visible', 'off');
set(h_CO2_3,'Visible', 'off');

hold on
h_O2_1 = image(97.5,180,img_O2_resize, 'AlphaData', alpha_O2_resize);
hold on
h_O2_2 = image(235,195,img_O2_resize, 'AlphaData', alpha_O2_resize);
hold on
h_O2_3 = image(415,195,img_O2_resize, 'AlphaData', alpha_O2_resize);

for jj = 1:50
    pause(0.05)
    set(h_O2_1,'XData',97.5+0*jj,'YData',180-2.75*jj);
    set(h_O2_2,'XData',235+0.3*jj,'YData',195-2.3*jj);
    set(h_O2_3,'XData',415-0.1*jj,'YData',195-2.5*jj);
    Mov(length(Mov)+1) = getframe;
end

set(h_O2_1,'Visible', 'off');
set(h_O2_2,'Visible', 'off');
set(h_O2_3,'Visible', 'off');

pause(1)
hold on
h_Lumberjack = image(-100,250,img_Lumberjack_resize, 'AlphaData', alpha_Lumberjack_resize);

for hh = 1:40
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for kk1 = 1:20
    pause(0.05)
    set(h_Lumberjack,'XData',-100+10*kk1);
    Mov(length(Mov)+1) = getframe;
end

for hh = 1:20
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for kk2 = 1:20
    pause(0.05)
    set(h_Lumberjack,'XData',90+8.5*kk2);
    set(h_Tree1T_1,'YData',200-20*kk2);
    Mov(length(Mov)+1) = getframe;
end

for hh = 1:20
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for kk3 = 1:20
    pause(0.05)
    set(h_Lumberjack,'XData',251.5+8.5*kk3);
    set(h_Tree1T_2,'YData',200-20*kk3);
    Mov(length(Mov)+1) = getframe;
end

for hh = 1:20
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for kk4 = 1:20
    pause(0.05)
    set(h_Lumberjack,'XData',413+8*kk4);
    set(h_Tree1T_3,'YData',200-20*kk4);
    Mov(length(Mov)+1) = getframe;
end

pause(1)
hold on
h_CO2_1 = image(30,520,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_2 = image(127.5,520,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_3 = image(225,520,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_4 = image(322.5,520,img_CO2_resize, 'AlphaData', alpha_CO2_resize);
hold on
h_CO2_5 = image(420,520,img_CO2_resize, 'AlphaData', alpha_CO2_resize);

for hh = 1:40
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for ll = 1:100
    pause(0.05)
    CO2_1_XPosition = get(h_CO2_1,'XData');
    CO2_2_XPosition = get(h_CO2_2,'XData');
    CO2_3_XPosition = get(h_CO2_3,'XData');
    CO2_4_XPosition = get(h_CO2_4,'XData');
    CO2_5_XPosition = get(h_CO2_5,'XData');
    set(h_CO2_1,'XData',CO2_1_XPosition+5*rand()-2,'YData',520-8*(ll+2*rand()-1));
    set(h_CO2_2,'XData',CO2_2_XPosition+5*rand()-2,'YData',520-7.5*(ll+2*rand()-1));
    set(h_CO2_3,'XData',CO2_3_XPosition+5*rand()-2,'YData',520-7*(ll+2*rand()-1));
    set(h_CO2_4,'XData',CO2_4_XPosition+5*rand()-2,'YData',520-8.5*(ll+2*rand()-1));
    set(h_CO2_5,'XData',CO2_5_XPosition+5*rand()-2,'YData',520-8*(ll+2*rand()-1));
    Mov(length(Mov)+1) = getframe;
end

set(h_Tree1B_1,'Visible', 'off');
set(h_Tree1B_2,'Visible', 'off');
set(h_Tree1B_3,'Visible', 'off');

pause(1)
hold on
h_Thermometer = image(0,0,img_Thermometer_resize, 'AlphaData', alpha_Thermometer_resize-255);
hold on
h_Fire = image(125,300,img_Fire_resize, 'AlphaData', alpha_Fire_resize-255);

for hh = 1:40
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end

for nn = 1:25
    pause(0.05)
    set(h_Thermometer,'AlphaData', alpha_Thermometer_resize*0.1*nn);
    Mov(length(Mov)+1) = getframe;
end

pause(1)
for nn = 1:25
    pause(0.05)
    set(h_Fire,'AlphaData', alpha_Fire_resize*0.1*nn);
    Mov(length(Mov)+1) = getframe;
end

movie(Mov,1,30);
Video = VideoWriter('Tree_Air_Chopped.avi');
set(Video,'FrameRate',30);
open(Video);
writeVideo(Video,Mov);
close(Video);
