
clc
clear
close all

%%  Generate the data  of the generalized Wiener process
randn('state',100)
X(1)=0;Y(1)=0; Z(1)=0; %Initial value
T=1000;N=2.5*10^4;dt=T/N; 
dw=sqrt(dt)*randn(1,N);  
Xem=zeros(1,N);   
for i=1:N                    % Use  the E-M method to solve the generalized Wiener process
     X(i+1)=X(i)+dt*(-3)+sqrt(100)*dw(i);
     Y(i+1)=Y(i)+dt*(-3);
     Z(i+1)=sqrt(100)*sum(dw(1:i));
end
t=[0:dt:T];  % Data
figure('color',[1 1 1]);

%% The sample path of the generalized Wiener process

plot(t,X,'linewidth',3);
set(gca,'xtick',0:200:1000,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-3500:1000:500,'fontsize',12)
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
print('Gen_Wiener_pro_path2','-depsc')
