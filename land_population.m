clc;clear;close all;
for ii = 1:90
x1=rand(100*(ii),1)*500;  %横坐标在(-2500，2500)范围内，生成1*10的随机矩阵
y1=rand(1,100*(ii))*500;  %纵坐标在(-2500，0)范围内，生成1*10的随机矩阵


h(ii) = figure(ii);
plot(x1,y1,'s','color','r');   %以x1为横坐标,y1为纵坐标绘制红色方块点图
axis off
legend('population','Location','NorthWest');
set( h(ii), 'Color','w')
rectangle('position',[0 0 500 500],'LineWidth',2,'LineStyle','-');  %中心区域的虚线框
Mov(ii) = getframe;
end

text(100,100,'土地布滿了人','Color','blue','FontSize',30);
Mov(91) = getframe;

movie(Mov,1,30);
v = VideoWriter('land_population.avi');
set(v,'FrameRate',30);
open(v);
writeVideo(v,Mov);
close(v);

