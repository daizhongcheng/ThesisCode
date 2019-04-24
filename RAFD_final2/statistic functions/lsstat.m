function [LS]=lsstat(Y,Theta)
% lsstat:  calculates the frequently used statistics for LS-based process
%          monitoring method (online)
% Call:
%          [LS]=lsstat(Y,Theta)
%
% Inputs:
%              Y - 
%          Theta - 
% Outputs:
%             LS -
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


Psi = Theta*Y'/(Y*Y');

[Q,R]=qr(Psi');

LS.Q1 = Q(:,1:rank(R));
LS.Q2 = Q(:,rank(R)+1:end);
LS.l = rank(LS.Q1');

% LS.Covq=cov(Theta);
% LS.Psi = Psi;
