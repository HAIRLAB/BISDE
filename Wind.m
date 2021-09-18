
clc
clear
close all

%% Load the data of wind speed 

randn('state',100)
load('WS01010630.mat');
XX=WS01010630;
indd=find(isnan(XX));XX(indd)=[];
X=XX(2:end)-XX(1:end-1); dt=1/6;

%% Select basis functions to build the library

u=X(1:end-1);
Phi=[ones(size(u,1),1),u,u.^2,u.^3,u.^4,u.^5,u.^6,u.^7,u.^8,u.^9,u.^10,exp(u),exp(2*u),exp(3*u),exp(4*u),exp(5*u)];
Phi_name={'1','u','u.^2','u^3','u^4','u^5','u^6','u^7','u^8','u^9','u^10','exp(u)','exp(2u)','exp(3u)','exp(4u)','exp(5u)'};

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


