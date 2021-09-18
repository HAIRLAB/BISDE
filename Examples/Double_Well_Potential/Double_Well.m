tic
clc
clear
close all

%% Generate the data of the double-wll potential

randn('state',100)
T=1000;N=2.5*10^4;dt=T/N;X(1)=1; 
dw=sqrt(dt)*randn(1,N);      
for j=1:N                   
    X(j+1)=X(j)+dt*(X(j)-X(j)^3)+sqrt(1+X(j)^2)*dw(j);
end
t=[0:dt:T]; X=X';

%% Select basis functions to build the library

u=X(1:end-1);
Phi=[ones(size(u,1),1),u,u.^2,u.^3,u.^4,u.^5,u.^6,u.^7,u.^8,u.^9,u.^10,u.^11,u.^12,u.^13,u.^14,u.^15,u.^15,u.^16,u.^17,u.^18,u.^19,u.^20];%%
Phi_name={'1','u','u^2','u^3','u^4','u^5','u^6','u^7','u^8','u^9','u^10','u^11','u^12','u^13','u^14','u.^15','u.^16','u.^17','u.^18','u.^19','u.^20'};%;%

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

%% print the identification result of the diffusion

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