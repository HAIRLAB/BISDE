%% The identification result shown in this paper
%%% is computed by transforming the identified parameters to the original
%%% ones 

clc
clear
close all

%% Load the data of  Tesla

randn('state',100)
load('Tesla_Stock_Price.mat');
X=log(TSP);N=size(X,1);tdt=252*390;dt=1/tdt;
%% Compute the volatility according to the reference [3]

X1=X(1:end-1);X2=X(2:end);
md=X2-X1; me=mean(md);
mu=me*(tdt);
ss=sum((md-0).^2);
ss=sqrt((1/(N-2))*ss);
sigma=ss*sqrt(tdt);sigma=sigma^2;

%% Select basis functions to build the library

u=X(1:end-1);
Phi=[ones(size(u,1),1),u.^3,u.^5,u.^7,u.^9,exp(u),exp(2*u),exp(3*u),exp(4*u),exp(5*u)];%rand(157),u.^7,u.^8,cos(2*u),cos(4*u),sin(2*u),];%%
Phi_name={'1','u^3','u^5','u^7','u^9','exp(u)','exp(2*u)',' exp(3*u)','exp(4*u)','exp(5*u)'};

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
