function [data,quality] = datagenDynamic_un(Dpmodel,sys,t_steady)
% dynamic data generation
%   Inputs
%         
%      model_dim - dimesion of the system matrices=[n,no,ni] (n-dim of A,
%                  no-output number,ni-input number)
%     samplesize - sample size
%              t - fault occurrence point
%         ftrial - the order of the fault
% 
%   Outputs
%           data - input data set (without fault)
%          fdata - input data set with fault
%        quality - output data set without fault
%       fquality - output data set with fault
% Notes: NONE
%
% Required M-files: NONE
%
% Reference: NONE
%
% Global Variables:
%        Name                   Type                          Usage  Description
% Data_Type                     double                  00
% Fault_Details                 double                  00
%
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany


%N=Dpmodel(1,1);
ni=Dpmodel(1,2);
no=Dpmodel(1,3);
%method=Dpmodel(1,3);
%% training data generation
ts = 0.01;% sample time

% training data generation
U = zeros(2500,ni); %%%%%%%%%%%%%
%Ynoise = zeros(samplesize,no);%
Ynoise = zeros(2500,no);
Umean = zeros(ni,1);%2*rand(model_dim(3),1);%%%%%%%%%%%%%%%%%%%%
% noise = 4e-3*randn(samplesize,1);
for j=1:ni
    U(:,j)=Umean(j)+4e-3*randn(2500,1);
    
end
for j=1:no
    Ynoise(:,j)=1e-3*randn(2500,1);
    
end
% U = ones(Sample_Size,1)*1+4e-3*randn(Sample_Size,1);
Time = (0:ts:ts*(2500-1))';
[Y, ~ ] = lsim(sys,U,Time);
Y = Y+Ynoise;

data = U(t_steady+1:t_steady+600,:); % % choose 600 samples to do fault detection
quality = Y(t_steady+1:t_steady+600,:);
%X = [data,quality];