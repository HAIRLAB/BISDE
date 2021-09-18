clc
clear
close all

%%  Generate the  data of the Langevin equation
randn('state',100)
Xzero=1;
T=1000;N=25000;dt=T/N;       % interval;number of data
dw=sqrt(dt)*randn(1,N);      % generate stochastic path
Xem=zeros(1,N);Xtemp=Xzero; Y(1)=1;  Z(1)=0;
for j=1:N                    % the E-M method to solve SDE  
     Xtemp=Xtemp+dt*(-3*Xtemp)+3*dw(j);
     Xem(j)=Xtemp;
end
t=[0:dt:T];X=[Xzero,Xem]';    

%% Select basis functions to build the library

u=X(1:end-1);
Phi=[ones(size(u,1),1),u,u.^2,u.^3,u.^4,u.^5,u.^6,u.^7,u.^8,u.^9,u.^10,u.^10,u.^11,u.^12,u.^13,u.^14,u.^15,...
     exp(u),exp(2*u),exp(3*u),exp(4*u),exp(5*u),exp(6*u),exp(7*u),exp(8*u),exp(9*u),exp(10*u)];
Phi_name={'1','u','u^2','u^3','u^4','u^5','u^6','u^7','u^8','u^9','u^10','u.^11','u.^12','u.^13','u.^14','u.^15',...
          'exp(u)','exp(2*u)','exp(3*u)','exp(4*u)','exp(5*u)','exp(6*u)','exp(7*u)','exp(8*u)','exp(9*u)','exp(10*u)'};


%% Employ BISDE to identify the drift and the diffusion

[Drif,Diff]=BISDE(X,Phi,dt);

%% Print the identification result of the drift term

threshold=10^-10;
fprintf('Drift: f(x)=');
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

%% Print the identification result of the diffusion

fprintf('Diffusion: G(x)=');
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