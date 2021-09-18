clear
clc
close

%% Generate the data of the two-dimensional SDE
randn('state',100)
X(1)=1;Y(1)=1;
T=2000;N=8*10^4;dt=T/N;t=[0:dt:T];
dw1=sqrt(dt)*randn(1,N);
dw2=sqrt(dt)*randn(1,N);
for i=1:N
    X(i+1)=X(i)+(X(i)-X(i)^3-X(i)*Y(i)^2-Y(i))*dt+(1+Y(i)^2)^0.5*dw1(i);
    Y(i+1)=Y(i)+(Y(i)-Y(i)*X(i)^2-Y(i)^3+X(i))*dt+(1+X(i)^2)^0.5*dw2(i);
end
figure('color',[1 1 1]);
plot3(t,X,Y,'LineWidth',2)
set(gca,'ztick',-3:2:3,'fontsize',12,'linewidth',1.2)
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$x(t)$','interpreter','latex','fontsize',16)
zlabel('$y(t)$','interpreter','latex','fontsize',16)
print('Two_dimensional_path','-depsc') 
