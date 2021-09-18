
clc
clear
close all

%%  Generate the  data of the Langevin equation 
randn('state',100)
Xzero=1;T=10;N=250;dt=T/N;
dw=sqrt(dt)*randn(1,N);     
Xem=zeros(1,N);Xtemp=Xzero; Y(1)=1;  Z(1)=0;
for j=1:N                   
     Xtemp=Xtemp+dt*(-3*Xtemp)+3*dw(j);
     Y(j+1)=Y(j)+dt*(-3*Y(j));
     Z(j+1)=3*sum(dw(1:j));
     Xem(j)=Xtemp;
end
t=[0:dt:T];x=[Xzero,Xem];  
figure('color',[1 1 1]);
plot(t,x,t,Y,t,Z,'linewidth',3);
grid on
set(gca,'xtick',0:2:10,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-4:4:8,'fontsize',12)
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
print('Langevin_path1','-depsc')