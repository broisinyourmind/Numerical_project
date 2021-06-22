z=0:0.05:10
y=sin(2*z);
x=cos(4*z)
curve=animatedline('LineWidth',2)
set(gca,'Xlim',[-1.5 1.5],'Ylim',[-1.5 1.5],'Zlim',[0 10]);
view(43,24);
hold on
for i=1:length(z)
    addpoints(curve,x(i),y(i),z(i));
    
    scatter3(x(i),y(i),z(i))
    drawnow
    pause(0.01)
end

R1=2
t=0:0.1:10
for n=1:length(t)
    theta=0:pi/50:pi
    phi=0:pi/50:pi
    [theta,phi]=meshgrid(theta,phi);
    R2=1+0.2*cos(8*(phi-theta-t(n)))
    y=(R1+R2.*sin(theta)).*cos(phi)
    x=(R1+R2.*sin(theta)).*sin(phi)
    z=R1.*sin(theta);
    mesh(x,y,z)
    %axis equal
    axis([-3.5,3.5,-3.5,3.5,-1.5,1.5])
    shading faceted
    M(n)=getframe
end