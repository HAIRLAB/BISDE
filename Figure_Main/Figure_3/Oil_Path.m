
clc
clear
close all


[NUM]=xlsread('oilprice');
b=NUM(1:end,2);bn=isnan(b);ind=find(bn==1);b(ind)=[];
dt=1;x=b(2:end)-b(1:end-1);[f,xi] = ksdensity(x);
figure('color',[1 1 1]);
t=1:size(x,1);
scatter(t,x,20,[0/255,128/255,0/255],'filled')
set(gca,'XTick',[1,3047,5551,7922]);
set(gca,'XTickLabel',{'1986', '1997','2007','2017'},'fontsize',25)
set(gca,'ytick',-20:10:20,'linewidth',2)
xlabel('Time','interpreter','latex','fontsize',24)
ylabel('Fluctuation ($/d)','interpreter','latex','fontsize',24)
print('oil_price_fluctuation','-depsc') 