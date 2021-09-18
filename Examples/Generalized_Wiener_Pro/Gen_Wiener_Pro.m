tic
clc
clear
close all

%%  Generate the data of the generalized Wiener process

randn('state',100)
Xzero=0;  %Initial value
N=2.5*10^4;dt=0.04;T=dt*N;
dw=sqrt(dt)*randn(1,N);  
Xem=zeros(1,N);Xtemp=Xzero;   
for j=1:N                    % Use the E-M method to solve SDEs
   Xtemp=Xtemp+dt*(-3)+sqrt(100)*dw(j);
   Xem(j)=Xtemp;
end
t=[0:dt:T];X=[Xzero,Xem]';    % Data

%%  Select basis functions to build the library

u=X(1:end-1);
Phi=[ones(size(u,1),1),u,u.^2,u.^3,u.^4,u.^5,u.^6,u.^7,u.^8,u.^9,...
         u.^10,u.^11,u.^12,u.^13,u.^14,u.^15,u.^16,u.^17,u.^18,u.^19,u.^20];
Phi_name={'1','u','u^2','u^3','u^4','u^5','u^6','u^7','u^8','u^9','u^10',...
            'u.^11','u.^12','u.^13','u.^14','u.^15','u^16','u^17','u^18','u^19','u^20'};
        
%%  Employ BISDE to identify the drift and the diffusion

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