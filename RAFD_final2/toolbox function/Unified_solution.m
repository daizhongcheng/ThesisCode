function [Lopt,Vopt] = Unified_solution(f_parameter)
% discrete time version of the unified solution
%
%   Inputs: [f_parameter ]
%   f_parameter    - data stored in fileData.mat
% 
%   Output
%   L              - optimal filter gain
%   V              - post filter

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
   B=f_parameter.Sys_matrix{2}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(2));
   C=f_parameter.Sys_matrix{3}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(1));
   Ed=f_parameter.Sys_matrix{4}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(4));
   Fd=f_parameter.Sys_matrix{5}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(4));
   
% if custom load the system model   
elseif c_parameter.Choice(1,1)==1
   % get system matrix A,B,C,D,Ed,Fd
   A=c_parameter.Process_model{1};
   B=c_parameter.Process_model{2};
   C=c_parameter.Process_model{3};
            
   %%%%%%%%%%%%%%------------  re-check here --------------------------------
   % what happends if the custom does not load Ed or Fd. default
   % value is, if there is no, then it will be an empty matrix.
   Ed=c_parameter.Process_model{5};
   Fd=c_parameter.Process_model{6};
   % -----------------------------------------------------------------------
   if (isempty(Ed)& isempty(Fd))==1 % if Ed and Fd are both empty
      if (f_parameter.FAR_estimation{2}(1,1)==1 | f_parameter.FAR_estimation{2}(3,1)==1)==1
         % if FAR estimation under disturbance situation is selected
         disp('Erro. There are no ''Ed'' and ''Fd'', but FAR estimation under disturbance situation is selected. ')
         return
      end
   else
      if isempty(Ed)==1 % if Ed is empty
         Ed=zeros(size(A,1),size(Fd,2));
      elseif isempty(Fd)==1 % if Fd is empty
         Fd=zeros(size(C,1),size(Ed,2));
      end
   end
end
    
Ad = A;
%Bd = B;
Cd = C;
% Dd = zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2));
%Ed = f_parameter.Sys_matrix{4};
%Fd = f_parameter.Sys_matrix{5};

%% Loese Riccati Gleichung 
[Xd,L,G] = dare(Ad',Cd',Ed*Ed',Fd*Fd',Ed*Fd',eye(size(A,1)));
% Ad*Xd*Ad'-Xd+Ed*Ed'-(Ed*Fd'+Ad*Xd*Cd')*inv(Fd*Fd'+Cd*Xd*Cd')*(Cd*Xd*Ad'+Fd*Fd')=0

%% Loese Gleichung 7.272
Ld = -inv(Cd*Xd*Cd'+Fd*Fd')*(Cd*Xd*Ad'+Fd*Ed')*eye(size(A,1));
temp = Cd*Xd*Cd'+Fd*Fd';
Hd = chol(temp);
Wd = inv(Hd'*Hd)*Hd';
disp('Unified Solution:')
Lopt = -Ld'
Vopt = Wd