%% Use this code to compare the PDFs of the real data and the simulated data

clc
clear
close all

%%  Load  data of the oil

[NUM]=xlsread('oilprice');
b=NUM(1:end,2);bn=isnan(b);ind=find(bn==1);b(ind)=[];
dt=1;X=b(2:end)-b(1:end-1);
Xre(1)=X(1); 

%% Employ the identified model to reproduce the data
for j=1:size(X,1)              
    Xre(j+1)=Xre(j)+dt*(-1.0493*Xre(j))+(0.3451*Xre(j)^2+0.3898*cos(2*Xre(j)))^(0.5)*sqrt(dt)*randn;
end

%% Compare the PDFs of the real data and the simulated data

[f1,x1] = ksdensity(X);
[f2,x2] = ksdensity(Xre);
figure('color',[1 1 1]);
plot(x1,f1,'linewidth',4) 
set(gca,'ytick',0:0.2:0.8,'linewidth',1.2)
set(gca,'XTick',-20:10:20,'fontsize',12,'linewidth',1.2);
xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('PDF','fontsize',16)
hold on 
plot(x2,f2,'linewidth',4) 
hold off
h=legend('Empirical PDF','Generated PDF');
set(h,'FontSize',18)
print('pdffitting','-depsc') 

