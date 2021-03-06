
clc
clear
close all

%%  Generate the  data of the Langevin equation
randn('state',100)
Xzero=1;T=1000;N=25000;dt=T/N; 
dw=sqrt(dt)*randn(1,N);    
Xem=zeros(1,N);Xtemp=Xzero; Y(1)=1;  Z(1)=0;
for j=1:N                  
     
     Xtemp=Xtemp+dt*(-3*Xtemp)+3*dw(j);
     Y(j+1)=Y(j)+dt*(-3*Y(j));
     Z(j+1)=2*sum(dw(1:j));
     Xem(j)=Xtemp;
end
t=[0:dt:T];x=[Xzero,Xem];  
figure('color',[1 1 1]);
plot(t,x,'linewidth',1.2)
set(gca,'xtick',0:200:1000,'fontsize',12,'linewidth',1.2) 
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
print('Langevin_path2','-depsc')