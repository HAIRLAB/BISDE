function [Drif,Diff]=BISDE(X,Phi,dt)
         % X:   N*1  N is the number of data
         % Phi: N*M  M us the number of basis functions

     [N,M]=size(Phi);
  
%% For the identification of the drift term
     dr.thre=0.05;
     dr.output=(X(2:end,:)-X(1:end-1,:))/dt;    
     Drif = MSBL(Phi,dr.output,1,1);
     Drif(abs(Drif)<dr.thre)=0;
%% For the identification of the diffusion term
     di.thre=0.05;
     di.output=(X(2:end,:)-X(1:end-1,:)-Phi*Drif*dt).^2/dt;
     Diff = MSBL(Phi,di.output,1,1); 
     Diff(abs(Diff)<dr.thre)=0;
   
end

    
     
         





