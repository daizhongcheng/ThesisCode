function [P,P_res, L,L_res,Omega,n_sys] = ccastat_new(U,Y)
% ccastat:  calculates the frequently used statistics for CCA-based process
%           monitoring method (online)
% Call:
%           [P,P_res, L,L_res,Omega,n_sys] = ccastat_new(U,Y)
% Inputs:
%              U - input data
%              Y - output data
% Outputs:
%              P -
%          P_res -
%              L -
%          L_res -
%          Omega -
%          n_sys - system order
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
%
% -------------------------------------------------------------------------


% %% computation of canonical correlation vectors and variables
% [samplesize,dimensionU] = size(U);
% [~,dimensionY] = size(Y);
% U=zscore(U);Y=zscore(Y);
% Kappa = (U'*U)^(-0.5)*(U'*Y)*(Y'*Y)^(-0.5);
% [R,S,V] = svd(Kappa);
% kappa = rank(Kappa);
% 
% % combination matrices calculation
% J = (U'*U/(samplesize-1))^(-0.5)*R;
% L = (Y'*Y/(samplesize-1))^(-0.5)*V;


[R,S,V] = svd((U*U')^(-0.5)*(U*Y')*(Y*Y')^(-0.5));
%%%%%%%%%%%%%%%%%%%%%%%% Determine the order 
n_sys = rank(S);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Get L,P,X,Q,Omega,X
P = (U*U')^(-0.5)*R(:,1:n_sys);
P_res = (U*U')^(-0.5)*R(:,n_sys+1:end);
L = (Y*Y')^(-0.5)*V(:,1:n_sys);
L_res = (Y*Y')^(-0.5)*V(:,n_sys+1:end);
Omega = S(1:n_sys,1:n_sys);