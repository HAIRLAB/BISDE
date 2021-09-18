
clc
clear
close all


load('WS01010630.mat');
XX=WS01010630;
indd=find(isnan(XX));XX(indd)=[];
txt=XX(2:end)-XX(1:end-1);
tt=1:size(XX(1:end-1),1);
figure('color',[1 1 1]);
scatter(tt,txt,15,[0/255,128/255,0/255],'filled')
set(gca,'XTick',[1,8640,17424,26208]);
set(gca,'XTickLabel',{'01-01', '02-29','04-30','06-30'},'fontsize',25)
set(gca,'ytick',-10:5:10,'linewidth',2)
xlabel('Time','interpreter','latex','fontsize',24)
ylabel('Fluctuation (mps)','interpreter','latex','fontsize',24)
print('wind-speed','-depsc') 