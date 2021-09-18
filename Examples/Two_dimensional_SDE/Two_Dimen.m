clear
clc
close

%% Generate the data of the synthetic two-dimensional SDE

randn('state',100)
X(1)=1;Y(1)=1;
T=2000;N=8*10^4;dt=T/N;t=[0:dt:T];
dw1=sqrt(dt)*randn(1,N);
dw2=sqrt(dt)*randn(1,N);
for i=1:N
    X(i+1)=X(i)+(X(i)-X(i)^3-X(i)*Y(i)^2-Y(i))*dt+(1+Y(i)^2)^0.5*dw1(i);
    Y(i+1)=Y(i)+(Y(i)-Y(i)*X(i)^2-Y(i)^3+X(i))*dt+(1+X(i)^2)^0.5*dw2(i);
end
X=X';Y=Y';

%% Select basis functions to build the library

xd=X(1:end-1);yd=Y(1:end-1);
 Phi =[ones(size(xd,1),1),xd,yd,xd.^2,yd.^2,xd.*yd,xd.^3,xd.^2.*yd,xd.*yd.^2,yd.^3,1./xd,1./yd,1./(xd.*yd),...
       exp(xd),exp(yd),exp(xd.*yd)];
 Phi_name={'1','X','Y','X^2','Y^2','XY','X^3','X^2Y','XY^2','Y^3','1/x','1/y','1/xy','e^x','e^y','e^xy'};

 %% Employ BISDE to identify the drift and the diffusion
 
 XY=[X,Y];
for j=1:size(XY,2)
    
 [Drif,Diff]=BISDE(XY(:,j),Phi,dt);

%% Print the identification result of the drift term

threshold=10^-10;
fprintf('This is the %d-th entry of the drift: f(x)=',j);
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

fprintf('This is the %d%d-th entry of the diffusion: G(x)=',j,j);
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
end

