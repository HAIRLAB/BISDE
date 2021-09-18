%% Potential function
clear
clc
close all

randn('state',100)
T=1000;N=2.5*10^4;dt=T/N;X(1)=1; 
dw=sqrt(dt)*randn(1,N);      
for j=1:N                   
    X(j+1)=X(j)+dt*(X(j)-X(j)^3)+sqrt(1+X(j)^2)*dw(j);
end
t=[0:dt:T];
figure('color',[1 1 1]);
p1=1./sqrt((1+X(1:end-1).^2)*dt);
p2=((X(2:end)-X(1:end-1)-(X(1:end-1)-X(1:end-1).^3)*dt).^2)./(2*(1+X(1:end-1).^2)*dt);
p2=exp(-p2);
P=1/(sqrt(2*pi))*p1.*p2;
scatter(t(2:end),X(2:end),20,'filled','cdata',P); colorbar 
hcb=colorbar;
%set(hcb,'ytick',[0.05:0.1:0.35],'fontSize',20)
set(gca,'xtick',0:500:1000,'fontSize',18,'linewidth',2) 
set(gca,'ytick',-4:2:4,'fontSize',25)
xlabel('$t$','interpreter','latex','fontsize',30)
ylabel('$x(t)$','interpreter','latex','fontsize',30)
print('Double_Well_color','-depsc')
