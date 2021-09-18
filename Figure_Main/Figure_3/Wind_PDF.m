%% Use this code to compare the empirical PDF of the real data 
%%% with the theoretical PDF by solving the Fokker-Planck equation

clc
clear
close all

%% Load the data of the wind

load('WS01010630.mat');
XX=WS01010630;
indd=find(isnan(XX));XX(indd)=[];
X=XX(2:end)-XX(1:end-1); dt=1/6;

%% Fokker-Planck equation and M-H sampler

 aa=2.7433;bb=1.7688;cc=-6.7949;
xmh(1)=0; nc=0;MI=40000;% set intial values
for i=1:MI
    xmh(i+1)=xmh(i)+0.8*randn;
    % acceptance probability
    pij=(aa+bb*xmh(i+1)^2)^(cc/(2*bb)-1);
    pii=(aa+bb*xmh(i)^2)^(cc/(2*bb)-1);
    ap1=min(pij/pii,1);
    ap2=rand;
    if ap2<ap1
        xmh(i+1)=xmh(i+1);
        nc=nc+1;
    else
        xmh(i+1)=xmh(i); 
    end
end
acp=nc/MI;
XMH=xmh(MI/2:MI);

%% compare the empirical PDF of the real data 
%%% with the theoretical PDF by solving the Fokker-Planck equation

[y1,x1] = ksdensity(X);
[y2,x2] = ksdensity(XMH);
figure('color',[1 1 1]);
plot(x1,y1,'linewidth',4) 
set(gca,'ytick',0:0.2:0.8,'linewidth',1.2)
set(gca,'XTick',-6:4:8,'fontsize',12,'linewidth',1.2);
xlabel('$x$','interpreter','latex','fontsize',20)
ylabel('PDF','fontsize',16)
hold on 
plot(x2,y2,'linewidth',4)
h=legend('Empirical PDF','Fokker-Planck PDF');
print('pdffitting','-depsc') 
hold off

