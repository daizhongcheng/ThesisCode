function [GLR_para] = trainingGLR(data,far_matix)
% trainingGLR: offline training by using Generalized Likelihood Ratio FD
%              method
%              
% Call:
%        [GLR_para] = trainingGLR(data,far_matix)
%
% Inputs:
%             data     - original data
%            far_matix - the custom given paramter matrix to estimate FAR
%                        (in which such as acceptable FAR is given)
% Outputs: 
%         GLR_para - the process paramters to do fault detection
% Notes: NONE

% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
[~,dimension] = size(data);

%% preprocess 

data_norm = normalizedata(data);
%------ parameters for GLR ------------------------------------------------
[USV.U,USV.S,~] = svd(cov(data_norm'));
GLR_para.assist = USV.U/(USV.S)*USV.U';
%% threshold calculation
if far_matix(1,2)==0;
   sig_level=far_matix(1,1)/100;
   GLR_para.J_th_GLR = icdf('chi2',1-sig_level,dimension);
else
   GLR_para.J_th_GLR= far_matix(1,2);
end
