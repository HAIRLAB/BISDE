
clc
clear
close all

%% Generate the data of the Double-Well potential 
randn('state',100)
T=1000;N=2.5*10^4;dt=T/N;X(1)=1; 
dw=sqrt(dt)*randn(1,N);      
for j=1:N                   
    X(j+1)=X(j)+dt*(X(j)-X(j)^3)+sqrt(1+X(j)^2)*dw(j);
end
t=[0:dt:T];
figure('color',[1 1 1]);
plot(t,X,'LineWidth',2);
set(gca,'xtick',0:200:1000,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-4:2:4,'fontsize',12)
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
print('Double_Well_path','-depsc')
