function [L_kalman] = Kalman_filter(f_parameter)
% kalman gain generation
%
%   Inputs: [f_parameter]
%   f_parameter    - data stored in fileData.mat
% 
%   Output
%   L            - Kalman filter gain
%
% Notes: NONE
%
% Required M-files: NONE
%
% Reference: NONE
%
% Global Variables:
%        Name                   Type                          Usage  Description
% 
%
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany
load('fileData.mat');   
load('customData.mat'); 


% if custom uses the GUI to type in the system model
if c_parameter.Choice(1,2)==1
   A=f_parameter.Sys_matrix{1}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(1));
   C=f_parameter.Sys_matrix{3}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(1));
   
% if custom load the system model   
elseif c_parameter.Choice(1,1)==1
   % get system matrix A,B,C,D,Ed,Fd
   A=c_parameter.Process_model{1};
   C=c_parameter.Process_model{3};
end


m_var = 0.001;
Sigma_nu = m_var*eye(size(A,1));
Sigma_eta = m_var*eye(size(A,1));


%--------------------------------------------------------------------------
% Kalman Filter
%--------------------------------------------------------------------------

% compute kalman gain(gleichung 7.67)
E_eta = eye(size(A,1));
A3_dre=A';
B3_dre=C';
R3_dre=Sigma_nu';
Q3_dre=E_eta*Sigma_eta*E_eta';
[X3_dre,L3_dre,G3_dre]=dare(A3_dre,B3_dre,Q3_dre,R3_dre);

L_kalman = G3_dre'
