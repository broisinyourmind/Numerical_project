close all
clear
clc

% 載入圖片
[img_Tree1T,cmap_Tree1T,alpha_Tree1T] = imread('Tree1T.png');
[img_Tree1B,cmap_Tree1B,alpha_Tree1B] = imread('Tree1B.png');
[img_Lumberjack,cmap_Lumberjack,alpha_Lumberjack] = imread('Lumberjack.png');
[img_Wind,cmap_Wind,alpha_Wind] = imread('Wind.png');
BG = imread('bg.jpg');
[img_BG_1,cmap_BG_1,~] = imread('bg1.png');
[img_BG_2,cmap_BG_2,~] = imread('bg2.png');

img_Tree1_resize = imresize(img_Tree1,0.3);
alpha_Tree1_resize = imresize(alpha_Tree1,0.3);
img_Lumberjack_resize = imresize(img_Lumberjack,0.3);
alpha_Lumberjack_resize = imresize(alpha_Lumberjack,0.3);
img_Tree1T_resize = imresize(img_Tree1T,0.3);
alpha_Tree1T_resize = imresize(alpha_Tree1T,0.3);
img_Tree1B_resize = imresize(img_Tree1B,0.3);
alpha_Tree1B_resize = imresize(alpha_Tree1B,0.3);
img_Wind_resize = imresize(img_Wind,0.6);
alpha_Wind_resize = imresize(alpha_Wind,0.6);

alpha_BG_1=im2uint8(ones(500,500));
alpha_BG_2=im2uint8(ones(500,500));


% 初始化figure與背景
figure(1)
axes
h_BG = image(BG);
axis off
hold on
h_BG_2 = image(0,0,img_BG_2, 'AlphaData', alpha_BG_2);
hold on
h_BG_1 = image(0,0,img_BG_1, 'AlphaData', alpha_BG_1);

% 畫樹
hold on
h_Tree1T_1 = image(-10,0,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_1 = image(-10,-1,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_2 = image(60,80,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_2 = image(60,75,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_3 = image(150,180,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_3 = image(150,177,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_4 = image(240,280,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_4 = image(240,276,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);
hold on
h_Tree1T_5 = image(330,380,img_Tree1T_resize, 'AlphaData', alpha_Tree1T_resize);
hold on
h_Tree1B_5 = image(330,377,img_Tree1B_resize, 'AlphaData', alpha_Tree1B_resize);


% 風吹沒事
hold on
h_Wind_1 = image(-120,100,img_Wind_resize, 'AlphaData', alpha_Wind_resize);
hold on
h_Wind_2 = image(-120,300,img_Wind_resize, 'AlphaData', alpha_Wind_resize);
% 吹到80和270被擋下來
for hh = 1:20
    pause(0.05)
    set(h_Wind_1,'XData',-120+10*hh);
    Mov(hh) = getframe;
end
for hh = 1:10
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end
for hh = 1:40
    pause(0.05)
    set(h_Wind_2,'XData',-120+9.75*hh);
    set(h_Wind_1,'AlphaData',alpha_Wind_resize*((40-hh)/20));
    Mov(length(Mov)+1) = getframe;
end
set(h_Wind_1,'Visible', 'off');
for hh = 1:40
    pause(0.05)
    set(h_Wind_2,'AlphaData',alpha_Wind_resize*((40-hh)/20));
    Mov(length(Mov)+1) = getframe;
end
set(h_Wind_2,'Visible', 'off');
for hh = 1:20
    pause(0.05)
    Mov(length(Mov)+1) = getframe;
end


% 砍樹
hold on
h_Lumberjack = image(-100,-100,img_Lumberjack_resize, 'AlphaData', alpha_Lumberjack_resize);

for ii = 1:55
    pause(0.05)
    set(h_Lumberjack,'XData',-100+10*ii,'YData',-100+11*ii);
    Mov(length(Mov)+1) = getframe;
    Mov(length(Mov)+1) = getframe;
end


% 樹飛走
pause(1)
for ii1 = 1:15
    pause(0.05)
    set(h_Tree1T_1,'YData',0-10*ii1);
    Mov(length(Mov)+1) = getframe;
end

for ii1 = 1:10
    pause(0.05)
    set(h_Tree1T_2,'YData',80-20*ii1);
    Mov(length(Mov)+1) = getframe;
end

for ii1 = 1:10
    pause(0.05)
    set(h_Tree1T_3,'YData',180-30*ii1);
    Mov(length(Mov)+1) = getframe;
end

for ii1 = 1:10
    pause(0.05)
    set(h_Tree1T_4,'YData',280-40*ii1);
    Mov(length(Mov)+1) = getframe;
end

for ii1 = 1:10
    pause(0.05)
    set(h_Tree1T_5,'YData',380-50*ii1);
    Mov(length(Mov)+1) = getframe;
end


% 風吹
hold on
h_Wind_1 = image(-120,190,img_Wind_resize, 'AlphaData', alpha_Wind_resize);
hold on
h_Wind_2 = image(-120,500,img_Wind_resize, 'AlphaData', alpha_Wind_resize);
hold on
h_Wind_3 = image(190,500,img_Wind_resize, 'AlphaData', alpha_Wind_resize);

for kk = 1:60
    pause(0.05)
    set(h_Wind_1,'XData',-120+5.2*kk,'YData',190-5.2*kk);
    set(h_Wind_2,'XData',-120+10.4*kk,'YData',500-10.4*kk);
    set(h_Wind_3,'XData',190+5.2*kk,'YData',500-5.2*kk);
    Mov(length(Mov)+1) = getframe;
end
for kk = 1:60
    pause(0.05)
    set(h_Wind_1,'XData',-120+5.2*kk,'YData',190-5.2*kk);
    set(h_Wind_2,'XData',-120+10.4*kk,'YData',500-10.4*kk);
    set(h_Wind_3,'XData',190+5.2*kk,'YData',500-5.2*kk);
    Mov(length(Mov)+1) = getframe;
end



% 樹幹與第一背景一起淡化消失
for jj = 100:-1:1
    pause(0.05)
    set(h_BG_1,'AlphaData',alpha_BG_1*0.025*jj);
    set(h_Tree1B_1,'AlphaData',alpha_Tree1B_resize*0.025*jj);
    set(h_Tree1B_2,'AlphaData',alpha_Tree1B_resize*0.025*jj);
    set(h_Tree1B_3,'AlphaData',alpha_Tree1B_resize*0.025*jj);
    set(h_Tree1B_4,'AlphaData',alpha_Tree1B_resize*0.025*jj);
    set(h_Tree1B_5,'AlphaData',alpha_Tree1B_resize*0.025*jj);
    Mov(length(Mov)+1) = getframe;
end

set(h_BG_1,'Visible','off');
set(h_Tree1B_1,'Visible','off');
set(h_Tree1B_2,'Visible','off');
set(h_Tree1B_3,'Visible','off');
set(h_Tree1B_4,'Visible','off');
set(h_Tree1B_5,'Visible','off');
Mov(length(Mov)+1) = getframe;


movie(Mov,1,30);
Video = VideoWriter('BeachTree.avi');
set(Video,'FrameRate',30);
open(Video);
writeVideo(Video,Mov);
close(Video);
