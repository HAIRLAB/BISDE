clear
clc
close
randn('state',100)
X(1)=1;Y(1)=1;
T=2000;N=8*10^4;dt=T/N;t=[0:dt:T];
dw1=sqrt(dt)*randn(1,N);
dw2=sqrt(dt)*randn(1,N);
for i=1:N
    X(i+1)=X(i)+(X(i)-X(i)^3-X(i)*Y(i)^2-Y(i))*dt+(1+Y(i)^2)^0.5*dw1(i);
    Y(i+1)=Y(i)+(Y(i)-Y(i)*X(i)^2-Y(i)^3+X(i))*dt+(1+X(i)^2)^0.5*dw2(i);
end
p1=1./(2*pi*sqrt(1+X(1:end-1).^2).*sqrt(1+Y(1:end-1).^2));
p21=((X(2:end)-X(1:end-1)-(X(1:end-1)-X(1:end-1).^3-X(1:end-1).*Y(1:end-1).^2-Y(1:end-1))*dt).^2)./(2*(1+Y(1:end-1).^2)*dt);
p22=((Y(2:end)-Y(1:end-1)-(Y(1:end-1)-Y(1:end-1).^3-Y(1:end-1).*X(1:end-1).^2+X(1:end-1))*dt).^2)./(2*(1+X(1:end-1).^2)*dt);
p2=exp(-p21-p22);
P=p1.*p2;
figure('color',[1 1 1]);
scatter3(t(2:end),X(2:end),Y(2:end),20,'filled','cdata',P)
colorbar
hcb=colorbar;
set(hcb,'ytick',[0.02:0.04:0.14],'fontSize',20)
xlabel('$t$','interpreter','latex','fontsize',18)
ylabel('$x(t)$','interpreter','latex','fontsize',18)
zlabel('$y(t)$','interpreter','latex','fontsize',18)
set(gca,'xtick',0:500:2000,'fontSize',18,'linewidth',2) 
%set(gca,'ztick',-4:0:4,'fontSize',18,'linewidth',2) 
print('Two-dimension_color','-depsc')