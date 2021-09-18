%% Use this code to reproduce the Fig. 4

 close all
 clear
 clc
 
%% Generalized Wiener process
%%% For the drift 
x=-3:0.001:3;
y1=-3*ones(1,6001);
y2=-3.0633*ones(1,6001);
y3=0*ones(1,6001);
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',2)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',2);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',2);
set(gca,'YLim',[-4 0],'linewidth',1.2);
set(gca,'YTick',[-4:1:0]);
set(gca,'FontSize',20);
xlabel('$x(t)$','interpreter','latex','fontsize',28)
ylabel('diffusion','interpreter','latex','fontsize',28)
h=legend('Real drift','BISDE','SDE\_SINDy');
set(h,'FontSize',16)
print('1','-depsc')

%%%%%%%%%%%%%%%%

x=-1:0.001:1;
y1=-3*ones(1,2001);
y2=-3.0633*ones(1,2001);
y3=0*ones(1,2001);
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',2)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',2);
hold on 
set(gca,'FontSize',36);
set(gca,'XTick',[ -1:1:1],'linewidth',1.4);
set(gca,'YLim',[ -4 -2],'linewidth',1.4);
set(gca,'YTick',[-4:1:-2]);


%%% For the diffusion
x=-3:0.001:3;
y1=100*ones(1,6001);
y2=100.2723*ones(1,6001);
y3=0*ones(1,6001);
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',2)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',2);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',2);
set(gca,'YLim',[ 0 120],'linewidth',1.2);
set(gca,'YTick',[0:30:120]);
set(gca,'FontSize',20);
xlabel('$x(t)$','interpreter','latex','fontsize',28)
ylabel('diffusion','interpreter','latex','fontsize',28)
h=legend('Real diffusion','BISDE','SDE\_SINDy');
set(h,'FontSize',16)
print('1','-depsc')

% % % % % % % % % % % %

x=-1:0.001:1;
y1=100*ones(1,2001);
y2=100.2723*ones(1,2001);
y3=0*ones(1,2001);
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',5)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',5)
hold on 
set(gca,'FontSize',36);
set(gca,'XTick',[ -1:1:1],'linewidth',1.4);
set(gca,'YLim',[ 99 101],'linewidth',1.4);
set(gca,'YTick',[99:1:101]);


%% Double-well Potential 

%%% For the drift 

x=-4:0.001:4;
y1=x-x.^3;
y2=0.9926*x-1.0099*x.^3;
y3=1.0492*x-1.0610*x.^3;
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',4)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',4);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',4);
set(gca,'FontSize',36);
set(gca,'YLim',[ -80 80],'linewidth',1.4);
set(gca,'YTick',[-80:40:80]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=-4:0.001:-3.9;
y1=x-x.^3;
y2=0.9926*x-1.0099*x.^3;
y3=1.0492*x-1.0610*x.^3;
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',4)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',4);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',4);
set(gca,'FontSize',36);
set(gca,'XTick',[ -4:0.1:-3.9],'linewidth',1.4);



%%% For the diffusion

x=-4:0.001:4;
y1=1+x.^2;
y2=1.0007+0.9841*x.^2;
y3=1.9205*x.^2;
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',2)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',2);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',2);
set(gca,'YLim',[0 15],'linewidth',1.2);
set(gca,'YTick',[0:5:15]);
set(gca,'FontSize',20);
xlabel('$x(t)$','interpreter','latex','fontsize',28)
ylabel('diffusion','interpreter','latex','fontsize',28)
h=legend('Real drift','BISDE','SDE\_SINDy');
set(h,'FontSize',16)
print('1','-depsc')
%%%%%%%%%%%%%%%%%%
x=-1.1:0.001:-1;
y1=1+x.^2;
y2=1.0007+0.9841*x.^2;
y3=1.9205*x.^2;
figure('color',[1 1 1]);
plot(x,y1,'color',[124 160 0]/256,'linewidth',4)
hold on 
plot(x,y2,'color',[0 140 241]/256,'linewidth',4);
hold on 
plot(x,y3,'color',[220 78 13]/256,'linewidth',4);
set(gca,'FontSize',36);
set(gca,'XTick',[ -1.1:0.1:-1],'linewidth',1.4);
set(gca,'YLim',[ 1.8 2.4],'linewidth',1.4);
set(gca,'YTick',[1.8:0.2:2.4]);




%% Two-dimension SDEs

%%%%For the drift 

x = -4:0.4:4;
y = -3:0.4:3;
[X,Y] = meshgrid(x, y);
Z = X-Y-X.*Y.^2-X.^3;
Z1=X+Y-X.^2.*Y-Y.^3;
Z2=0.9941*X-0.9738*Y-1.0294*X.*Y.^2-1.0076*X.^3;
Z3=0.9883*X+0.9452*Y-1.0744*X.^2.*Y-0.9387*Y.^3;
Z4=-0.9537*Y-0.5944*X.*Y.^2-0.4618*X.^3;
Z5=0.9636*X+0.7762*Y-0.9553*X.^2.*Y-0.8307*Y.^3;
[px,py] = gradient(Z);
[px1,py1] = gradient(Z1);
figure('color',[1 1 1]);
quiver(x,y,Z,Z1,'AutoScale','on','AutoScaleFactor',2,'Color',[124 160 0]/256,'MaxHeadSize',30)
hold on
quiver(x,y,Z2,Z3,'AutoScale','on','AutoScaleFactor',2,'Color',[0 140 241]/256,'MaxHeadSize',30)
hold on
quiver(x,y,Z4,Z5,'AutoScale','on','AutoScaleFactor',2,'Color',[220 78 13]/256,'MaxHeadSize',30)
set(gca,'FontSize',20);
set(gca,'YTick',[-3:2:3],'linewidth',1.2);
xlabel('$x(t)$','interpreter','latex','fontsize',28)
ylabel('$y(t)$','interpreter','latex','fontsize',28)
h=legend('Vector fields of real drift','BISDE','SDE\_SINDy');
set(h,'FontSize',15)
print('1','-depsc') 

%%%  For the diffusion
x = -3:0.4:3;
y = -3:0.4:3;
[X,Y] = meshgrid(x, y);
Z = 1+Y.^2;
Z1=1+X.^2;
 Z2=1.0050+0.9897*Y.^2;
 Z3=0.9984+1.0306*X.^2;
 Z4=1.8476*Y.^2;
 Z5=1.0492+1.0155*X.^2;
[px,py] = gradient(Z);
[px1,py1] = gradient(Z1);
figure('color',[1 1 1]);
quiver(x,y,Z,Z1,'AutoScale','on','AutoScaleFactor',2,'Color',[124 160 0]/256)
hold on
quiver(x,y,Z2,Z3,'AutoScale','on','AutoScaleFactor',2,'Color',[0 140 241]/256)
hold on
quiver(x,y,Z4,Z5,'AutoScale','on','AutoScaleFactor',2,'Color',[220 78 13]/256)
hold off
set(gca,'FontSize',20,'linewidth',1.2);
xlabel('$x(t)$','interpreter','latex','fontsize',28)
ylabel('$y(t)$','interpreter','latex','fontsize',28)
zlabel('$y(t)$','interpreter','latex','fontsize',18)
h=legend('Vector fields of real diffusion','BISDE','SDE\_SINDy');
set(h,'FontSize',16)
print('1','-depsc')


