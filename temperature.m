clc;clear;close all;
x = 1:7; % 月份
y = 30+2*x; % 溫度值（假設是介於 0〜35 的亂數）
h = figure(1);
set(h)
bar(x, y);
xlabel('西元(年)'); % x 軸的說明文字
ylabel('平均溫度 (^{o}c)'); % y 軸的說明文字
% 下列指令將 x 軸的數字改成月數
set(gca,'xticklabel', {'2020','2030','2040', '2050', '2060', '2070','2080'});
set(gcf, 'PaperPositionMode', 'auto');

Mov(1) = getframe;


hold on 

h1 = plot(x,y);
set(h1,'LineWidth',15,'color','red');
h2 = text(1,20,'溫度上升','Color','red','FontSize',30,'LineWidth',15);
set(h2)
Mov(2) = getframe;

movie(Mov,1,0.5);
v = VideoWriter('temperature.avi');
set(v,'FrameRate',0.5);
open(v);
writeVideo(v,Mov);
close(v);

