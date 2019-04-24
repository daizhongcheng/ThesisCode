function [PCAS,l]=pcastat(per_limit,USV)
% pcastat:  calculates the frequently used statistics for PCA-based process
%           monitoring method (online)
%
% Call:
%           [Idx] = pcastat(x,P,var,nn,stype)
%
% Inputs:   
%      per_limit - lower limit for percentage variance described by principal components
%           USV  - USV.U unitary matrix of normalized training data
%                  USV.S singular value diagonal matrix of normalized training data
% 
% 
% Outputs:  
%          PCAS  - statistics for PCA-based method
%             l  - number of principle components
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



l=1; 
% var_per_limit = 0.9; 
%percentage variance
diagS = diag(USV.S);
var_per = diagS/sum(diagS);

%increase l until percentage variance is reached
while(sum(var_per(1:l)) < per_limit)
    l = l+1;
end
% l = l-1;
m = size(USV.S,1);
% Decompose into principle and residual components
PCAS.P_PCA = USV.U(:,1:l);
PCAS.P_tilde = USV.U(:,l+1:end);
PCAS.Sigma = USV.S(1:l,1:l);
PCAS.Sigma_Tilde = USV.S(l+1:end,l+1:end);
%parameters for PCA_SPE
theta = zeros(1,3);

for i=1:3
    SUM=0;
    for j=l+1:m
        SUM = SUM+diagS(j)^i;
    end
    theta(i) = SUM;
end
h0 = 1-(2*theta(1)*theta(3)/(3*(theta(2)^2)));
PCAS.para_SPE = [h0,theta];
