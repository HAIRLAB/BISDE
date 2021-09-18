%% Use this code to generate the sample path of bearing by loading different datasets

clear
clc
close all

%% Load the data of bearing 
load('HP1NBD.mat')
x=X098_DE_time; 
tt=1:length(x);
figure('color',[1 1 1])
plot(tt,x,'linewidth',2)
set(gca,'FontSize',16);
set(gca,'XTick',[1,96001,192001,288001,384001,480001],'linewidth',1.2,'fontsize',12);
set(gca,'XTickLabel',{'0','2', '4','6','8','10'})
xlabel('Time (s)','fontsize',12)
ylabel('Amplitude (m/s^2)','fontsize',12)


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

