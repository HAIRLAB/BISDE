tic
clc
clear
close all

%%  Generate SDE data
randn('state',100)
X(1)=0;Y(1)=0; Z(1)=0;%initial value
T=1000;N=2.5*10^4;dt=T/N; % interval;number of data; number of bin
dw=sqrt(dt)*randn(1,N);  % generate stochastic path
Xem=zeros(1,N);   
for i=1:N                    % the E-M method to solve SDE  
     X(i+1)=X(i)+dt*(-3)+sqrt(100)*dw(i);
end
t=[0:dt:T];  % Data
p1=1./sqrt(100*dt)*ones(1,N);
p2=((X(2:end)-X(1:end-1)+3*dt*ones(1,N)).^2)/(2*100*dt);
p2=exp(-p2);
P=1/(sqrt(2*pi))*p1.*p2;
figure('color',[1 1 1]);
%set(0,'defaultfigurecolor','w')
%plot(t,X,t,Y,t,Z,'linewidth',3);
scatter(t(2:end),X(2:end),20,'filled','cdata',P); colorbar 
hcb=colorbar;
set(hcb,'ytick',[0.02:0.04:0.18],'fontSize',20)
set(gca,'xtick',0:500:1000,'fontSize',18,'linewidth',2) 
set(gca,'ytick',-3500:2000:500,'fontSize',25)
xlabel('$t$','interpreter','latex','fontsize',30)
ylabel('$x(t)$','interpreter','latex','fontsize',30)
print('GBM_Path_Color','-depsc')
%Xtemp=Xtemp+dt*(2-Xtemp)+2^(0.5)*winc;  T=1000;N=2.5*10^4;dt=T/N;