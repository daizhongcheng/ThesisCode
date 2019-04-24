function [PLS]=plsstat(Y,Theta,A)
% plsstat:  calculates the frequently used statistics for PLS-based process
%           monitoring method (online)
% Call:
%          [PLS]=plsstat(Y,Theta,A)
%
% Inputs:
%              Y - 
%          Theta - 
%              A -
% Outputs:
%            PLS -
%         
% Notes: NONE
%
% Required M-files: NONE
%
% Reference: NONE
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------


Y_d(:,:,1)=Y;
for i=1:A
  [U,~]=svd(Y_d(:,:,i)*Theta');
   PLS.W(:,i)=U(:,1); 
   PLS.T(:,i)=Y_d(:,:,i)'*PLS.W(:,i); 
   PLS.P(:,i)=Y_d(:,:,i)*PLS.T(:,i)/norm(PLS.T(:,i))^2; 
   PLS.Q(:,i)=Theta*Y_d(:,:,i)'*PLS.W(:,i)/(norm(PLS.T(:,i))^2);
   Y_d(:,:,i+1)=Y_d(:,:,i)-PLS.P(:,i)*PLS.T(:,i)'; 
%    testval = @(Y_d(:,:,i),Y_d(:,:,i+1));
%    vals(i) = crossval(testval,Y_d(:,:,i));
end
PLS.R=PLS.W*inv(PLS.P'*PLS.W);
PLS.Y_d=Y_d(:,:,i+1);
% PLS.val = vals;
%%Threshold
% Y_e= Y_d(:,:,A+1);
% 
% for i=1:size(Y,2)
%     SPE(i)=Y_e(:,i)'*Y_e(:,i);
% end
% a=mean(SPE);
% b=var(SPE);
% PLS.J_PLS_SPE=(b/(2*a))*chi2inv(1-alpha,2*(a^2)/b);
% 
% PLS.J_PLS_T2= (A*(N^2-1))/(N*(N-A))*icdf('f',1-alpha,A,N-A);
