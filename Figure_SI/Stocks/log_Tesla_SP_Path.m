
clc
clear
close all


%% Load the data of Tesla

load('Tesla_Stock_Price.mat');
tt=1:length(TSP);
X=log(TSP);N=size(X,1);tdt=252*390;dt=1/tdt;t=[0:dt:(N-1)*dt];
figure('color',[1 1 1]);
plot(tt,X,'linewidth',2);
set(gca,'ytick',5.3:0.2:6.3)
set(gca,'xtick',[1,8580,16770,24960],'fontsize',12,'linewidth',1.2);
set(gca,'XTick',[1,8580,16770,24960],'fontsize',12,'linewidth',1.2);
set(gca,'XTickLabel',{'2020-07-01', '2020-07-31','2020-08-31','2020-09-30'})
xlabel('Time (d)','interpreter','latex','fontsize',16)
ylabel('Stock Price (log(\$))','interpreter','latex','fontsize',16)
print('Log_Tesla_path','-depsc')