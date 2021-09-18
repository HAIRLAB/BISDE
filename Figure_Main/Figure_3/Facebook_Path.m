
clc
clear
close all

load('Facebook_Stock_Price.mat');
tt=1:length(FBSP);
figure('color',[1 1  1])
scatter(tt,FBSP,8,[0/255,128/255,0/255],'filled')
set(gca,'XTick',[1,8580,16770,24960]);
set(gca,'XTickLabel',{'07-01', '07-31','08-31','09-30'},'fontsize',25)
set(gca,'ytick',220:20:320,'linewidth',2)
xlabel('Time','interpreter','latex','fontsize',24)
ylabel('Price ($)','interpreter','latex','fontsize',24)
print('Tesla_SP_color','-depsc')