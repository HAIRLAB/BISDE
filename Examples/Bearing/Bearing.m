
%% Use this code to identify the dynamics of bearing  by loading different datasets
clear
clc
close all

%% Load the data of the bearing 

load('HP1NBD.mat')
x=X098_FE_time; sc=1000;
randn('state',100)
tt=1:length(x);


%% Use the binning operation to estimate the drift
xmax=max(x);xmin=min(x);bins=100;dt=1/48000;
binlen=(xmax-xmin)/bins;
for j=1:bins
    tx(1,j)=xmin+j*binlen-1/2*binlen;
    num(j)=0;
    sumx(j)=0;
    for i=1:size(x,1)-1
        if x(i)>= xmin+(j-1)*binlen && x(i)< xmin+j*binlen
            num(j)=num(j)+1;
            sumx(j)=sumx(j)+(x(i+1)-x(i))/dt;             
        else
            ;
        end
    end
    tx(2,j)=(sumx(j))/num(j);
end
    indxthre=find(num>1000);
    tx=tx(:,indxthre);
    tx(2,:)=tx(2,:)/sc;
    
    %% Plot the estimated value of the drift 
    figure(1)   
    scatter(tx(1,:), tx(2,:),70,[125/255,26/255,123/255],'p')
    xlabel('Bearing oscillation','fontsize',50)
    set(gca,'xtick',-0.6:0.3:0.6,'fontsize',24,'linewidth',1.2);
    set(gca,'ytick',-3:2:4,'fontsize',24,'linewidth',1.2)
    hold on        
    
%% Use one-tenth of dataset for BISDE
k=20;
X=x(k*10000+1:(k+5)*10000,:);
u=X(1:end-1);
Phi=[ones(size(u,1),1),u,u.^2,u.^3,exp(u),exp(2*u),exp(3*u)];
Phi_name={'1','u','u^2','u^3','exp(u)','exp(2u)','exp(3u)'};

%% Employ BISDE to identify the drift and the diffusion

[Drif,Diff]=BISDE(X,Phi,dt,sc);

%% Print the identification result of the drift term

threshold=10^-10;
fprintf('Drift: f(x)=',1);
for i = 1:size(Drif,1)
    if abs(Drif(i))<threshold
            ;
    else
       if Drif(i)<0
           fprintf('%.4f*%s', Drif(i),Phi_name{i});
       else
           fprintf('+');
           fprintf('%.4f*%s', Drif(i),Phi_name{i});
        end
    end
end
fprintf('\n')


%% Print the identification result of the diffusion term


fprintf('Diffusion: G(x)=',1,1);
for i = 1:size(Diff,1)
    if abs(Diff(i))<threshold
            ;
    else
       if Diff(i)<0
           fprintf('%.4f*%s', Diff(i),Phi_name{i});
       else
           fprintf('+');
           fprintf('%.4f*%s', Diff(i),Phi_name{i});
        end
    end
end
fprintf('\n')

    %% Comparison between the estimated values and the identified values
    
    uu=tx(1,:)';    
    XB=[ones(size(uu,1),1),uu,uu.^2,uu.^3,exp(uu),exp(2*uu),exp(3*uu)];%];%,];%,X.^5,X.^6,X.^7];
    Y1=sum(Drif'.*XB,2);
    colo=[217/255,83/255,25/255];
    plot(uu,Y1,':*','Color',colo,'linewidth',1.8)
    hh=legend('Estimated drift value','Identified drift');   
    set(hh,'Fontsize',16)
    errme1= mean((Y1'-tx(2,:)).^2);
    hold off
    
   %% Use the binning operation to estimate the drift
    
    for j=1:bins
    tx2(1,j)=xmin+j*binlen-1/2*binlen;
    num(j)=0;
    sumx(j)=0;
    for i=1:size(x,1)-1
        if x(i)>= xmin+(j-1)*binlen && x(i)< xmin+j*binlen
            num(j)=num(j)+1;
            sumx(j)=sumx(j)+(x(i+1)-x(i)-sum(Drif'.*PhiMatrix(x(i)),2)*dt).^2/dt;             
        else
            ;
        end
    end
    tx2(2,j)=sumx(j)/num(j);
end
    indxthre=find(num>1000);
    tx2=tx2(:,indxthre);
    tx2(2,:)= tx2(2,:)/sc;
    
    %% Plot the estimated values of diffusion
  
    figure(2)
    scatter(tx2(1,:),tx2(2,:),70,[125/255,26/255,123/255],'p')
    xlabel('Bearing oscillation','fontsize',36);
    hold on
    Y2=sum(Diff'.*XB,2);
    colo=[217/255,83/255,25/255];
    plot(uu,Y2,':*','Color',colo,'linewidth',1.8) 
    hh=legend('Estimated diffusion value','Identified diffusion');   
    set(hh,'Fontsize',16)
    errme2= mean((Y2'- tx2(2,:)).^2);
  
    %%  The employed library
    
    function M=PhiMatrix(x)
          M=[ones(size(x,1),1),x,x.^2,x.^3,exp(x),exp(2*x),exp(3*x)];
    end
    
 
