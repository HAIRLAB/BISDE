
clc
clear
close all

%%  Generate the data of the generalized Wiener process

randn('state',100)
X(1)=0;Y(1)=0; Z(1)=0;%Initial value
T=10;N=2.5*10^2;dt=T/N; 
dw=sqrt(dt)*randn(1,N);  
Xem=zeros(1,N);   
for i=1:N                    % Use the E-M method to solve the generalized Wiener process
     X(i+1)=X(i)+dt*(-3)+sqrt(100)*dw(i);
     Y(i+1)=Y(i)+dt*(-3);
     Z(i+1)=sqrt(100)*sum(dw(1:i));
end
t=[0:dt:T];  % Data
figure('color',[1 1 1]);

%% Comparison 
plot(t,X,t,Y,t,Z,'linewidth',3);
grid on
set(gca,'xtick',0:2:10,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-50:30:40,'fontsize',12)
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
print('Gen_Wiener_pro_path1','-depsc')
