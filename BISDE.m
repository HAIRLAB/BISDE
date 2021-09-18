function [Drif,Diff]=BISDE(X,Phi,dt,sc)
         % X:   N*D  N is the number of data points and D is the
         % dimensionality of SDEs
         % Phi: N*M  M us the number of basis functions
[N,M]=size(Phi);
%%%% For the identification of the drift term
     dr.thre=0.05;
     dr.output=(X(2:end,:)-X(1:end-1,:))/dt; 
     dr.output=dr.output/sc;
     Drif = MSBL(Phi,dr.output,1,1);
     Drif(abs(Drif)<0.05)=0;
     
    
      
%%% For the identification of the drift term
     di.thre=0.05;
     di.output=(X(2:end,:)-X(1:end-1,:)-Phi*Drif*dt).^2/dt;
     di.output=di.output/sc;
     Diff = MSBL(Phi,di.output,1,1); 
     Diff(abs(Diff)<di.thre)=0;
     
end

    
     
         





