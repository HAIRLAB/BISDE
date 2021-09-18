
clc
clear
close all

%% Load the data of the oil price

randn('state',100)
[NUM]=xlsread('oilprice');
b=NUM(1:end,2);bn=isnan(b);ind=find(bn==1);b(ind)=[];
dt=1;X=b(2:end)-b(1:end-1);[f,xi] = ksdensity(X);
 
%% Select the basis functions to build the library

u=X(1:end-1);
Phi=[u,u.^2,u.^3,u.^4,u.^5,u.^6,u.^7,u.^8,sin(2*u),cos(2*u)];
Phi_name={'u','u^2','u^3','u^4','u^5','u^6','u^7','u^8','sin(2*u)','cos(2*u)'};

%% Employ BISDE to identify the drift and the diffusion

[Drif,Diff]=BISDE(X,Phi,dt);

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



