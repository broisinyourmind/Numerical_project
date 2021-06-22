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