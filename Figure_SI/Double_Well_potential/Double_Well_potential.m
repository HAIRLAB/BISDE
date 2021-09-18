clear
clc
close all

%% Potential energy  function
x=-2:0.01:2;
y=-0.5*x.^2+0.25*x.^4;
figure('color',[1 1 1]);
plot(x,y,'linewidth',3);
set(gca,'xtick',-2:1:2,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-0.5:0.5:2,'fontsize',12)
xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('$U(x)$','interpreter','latex','fontsize',20)
print('Potential_energy','-depsc')

%%  Solution curves 

x1(1)=2;x2(1)=0.01;x3(1)=-0.01;x4(1)=-2;
dt=0.01;N=6;
t=0:dt:N;
for i=1:N/dt
    x1(i+1)=x1(i)+dt*(x1(i)-x1(i)^3);
    x2(i+1)=x2(i)+dt*(x2(i)-x2(i)^3);
    x3(i+1)=x3(i)+dt*(x3(i)-x3(i)^3);
    x4(i+1)=x4(i)+dt*(x4(i)-x4(i)^3);
end
figure('color',[1 1 1]);
plot(t,x1,t,x2,t,x3,t,x4,'linewidth',2);
set(gca,'xtick',0:2:6,'fontsize',12,'linewidth',1.2) 
set(gca,'ytick',-2:1:2,'fontsize',12)
xlabel('$t$','interpreter','latex','fontsize',20)
ylabel('$x(t)$','interpreter','latex','fontsize',20)
grid on
print('Solution_curves','-depsc')