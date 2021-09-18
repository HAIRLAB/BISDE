
clc
clear
close all

%% Load the data of Facebook
load('Facebook_Stock_Price.mat');
tt=1:length(FBSP);
X=log(FBSP);N=size(X,1);tdt=252*390;dt=1/tdt;
figure('color',[1 1 1]);
plot(tt,X,'linewidth',2);
set(gca,'ytick',5.4:0.1:5.8,'fontsize',12,'linewidth',1.2)
set(gca,'xtick',[1,8580,16770,24960],'fontsize',12,'linewidth',1.2);
set(gca,'xticklabel',{'2020-07-01', '2020-07-31','2020-08-31','2020-09-30'})
xlabel('Time (d)','interpreter','latex','fontsize',16)
ylabel('Stock Price (log(\$)) ','interpreter','latex','fontsize',16)
print('Log_Facebook_path','-depsc')