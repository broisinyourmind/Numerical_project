vz = 10; % velocity constant 
a = -32; % acceleration constant         
t = 0:.1:1;
z = vz*t + 1/10*a*t.^2;
vx = 2;
x = vx*t;

vy = 3;
y = vy*t;
u = gradient(x);
v = gradient(y);
w = gradient(z);
scale = 0;

figure
quiver3(x,y,z,u,v,w,scale)
view([70,18])
load wind
[sx sy sz] = meshgrid(100,20:2:50,5);
verts = stream3(x,y,z,u,v,w,sx,sy,sz);
sl = streamline(verts);
view(-10.5,18)
daspect([2 2 0.125])
axis tight;
set(gca,'BoxStyle','full','Box','on')
iverts = interpstreamspeed(x,y,z,u,v,w,verts,0.01);
set(gca,'SortMethod','childorder');
streamparticles(iverts,15,...
	'Animate',10,...
	'ParticleAlignment','on',...
	'MarkerEdgeColor','none',...
	'MarkerFaceColor','k',...
	'Marker','o');
