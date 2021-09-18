
clc
clear
close all

%% Load the data of wind
randn('state',1)
load('WS01010630.mat');
XX=WS01010630;
indd=find(isnan(XX));XX(indd)=[];
tt=1:size(XX,1);
figure('color',[1 1 1]);
plot(tt,XX,'linewidth',2)
set(gca,'ytick',0:5:20,'linewidth',1.2)
set(gca,'XTick',[1,8640,17424,26208],'fontsize',12,'linewidth',1.2);
set(gca,'XTickLabel',{'2020-01-01', '2020-02-29','2020-04-30','2020-06-30'},'fontsize',12)
xlabel('Time (d)','interpreter','latex','fontsize',16)
ylabel('Wind speed (mps)','interpreter','latex','fontsize',16)
print('Wind_path','-depsc') 