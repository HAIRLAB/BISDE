tic
clc
clear
close all

%%  Load the data of oil
[NUM]=xlsread('oilprice');
b=NUM(1:end,2);bn=isnan(b);ind=find(bn==1);b(ind)=[];
dt=1;x=b(2:end)-b(1:end-1);[f,xi] = ksdensity(x);
figure('color',[1 1 1]);
plot(x,'Linewidth',2)
set(gca,'ytick',-15:10:20,'linewidth',1.2)
set(gca,'XTick',[1,3047,5551,7922],'fontsize',12,'linewidth',1.2);
set(gca,'XTickLabel',{'1986', '1997','2007','2017'},'fontsize',12)
xlabel('Time (y)','fontsize',16)
ylabel('Oil price fluctuation ($/d)','fontsize',16)
print('Oil_fluctuation_path','-depsc')