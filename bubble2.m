
group=[0.1 0.1 0.1 0.1;0.1 0.1 0.1 0.1;0.1 0.1 0.1 0.1];  

sum1=sum(group(1,:)); 
sum2=sum(group(2,:)); 
sum3=sum(group(3,:));
group(1,:)=(group(1,:)./sum1).^0.5; 
group(2,:)=(group(2,:)./sum2).^0.5; 
group(3,:)=(group(3,:)./sum3).^0.5; 
clear sum1 sum2 sum3; 
set(figure,'color','white')
hold; 
g=3; 
for i=1:g
    for j=1:4 
        if group(i,j)>0 
            plot(i,j,'.','Markersize',group(i,j)*150,'color',[1-i/g 1-i/g 1-i/g]) 
        end
    end
end

xlim([0.5 3.5]);
ylim([0.5 4.5]);
set(gca,'xticklabel',[],'xtick',[1:1:3],'yticklabel',[],'ytick',[1:1:4])
xxposi=[1 2 3]; 
xyposi=0.3*ones(1,3); 
yxposi=0.4*ones(1,4);
yyposi=[1:1:4]; 
text(xxposi,xyposi,{'','',''},'HorizontalAlignment','center','FontSize', 14);
text(yxposi,yyposi,{'CO2','','',''},'HorizontalAlignment','right','FontSize', 20); 