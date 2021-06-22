t=0:pi/50:2*pi
x=cos(t)
y=sin(t)
plot(x,y)
hold on
axis equal

lineX=[0, 1]
lineY=[0, 0]
h=plot(lineX,lineY)
theda=0
while true
    theda=theda-0.1
    lineX(2)=cos(theda)
    lineY(2)=sin(theda)
    set(h,'XData',lineX,'YData',lineY)
    drawnow
end