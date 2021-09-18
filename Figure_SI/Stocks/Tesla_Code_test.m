
clc
clear
close all

%% Generate the data of Tesla
load('Tesla_Stock_Price.mat');
tt=1:length(TSP);
figure('color',[1 1 1])
plot(tt,TSP,'LineWidth',2)
set(gca,'XTick',[1,8580,16770,24960],'fontsize',12,'linewidth',1.2);
set(gca,'XTickLabel',{'2020-07-01', '2020-07-31','2020-08-31','2020-09-30'})
set(gca,'ytick',200:100:550,'fontsize',12,'linewidth',1.2)
xlabel('Time (d)','interpreter','latex','fontsize',16)
ylabel('Stock Price (\$) ','interpreter','latex','fontsize',16)
print('Tesla_path','-depsc')
