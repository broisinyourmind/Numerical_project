clc
clear
close all

m = 30;%原本的陸地面積
o = 70;%原本的海洋面積
n = 1;
while n<16
    percentage = [m o]; %陸地面積
    m = m-1;
    o = o+1;
    labels = {'land','ocean'};
    pie(percentage);
    
    legend(labels);
    Mov1(n) = getframe;    
    n = n+1;
end


movie(Mov1,1,30);
v = VideoWriter('pie.avi');
set(v,'FrameRate',30);
open(v);
writeVideo(v,Mov1);
close(v);