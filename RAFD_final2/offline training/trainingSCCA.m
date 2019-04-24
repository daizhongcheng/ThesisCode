function [SCCA_para] = trainingSCCA(data,quality,far_matix)
% trainingSCCA: offline training by using Statistic Canonical Variate
% Analysis Method
% Call:
%        [SCCA_para] = trainingSCCA(data,quality,far_matix)
%
% Inputs:
%             data     - original data
%             far_matix - the custom given paramter matrix to estimate FAR
%                         (in which such as acceptable FAR is given)
% Outputs: 
%            SCCA_para - the process paramters to do fault detection
% Notes: NONE

% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
[samplesize,~] = size(data);

%% preprocess 
data_norm = (data-repmat(mean(data),samplesize,1))';
quality_norm = (quality-repmat(mean(quality),samplesize,1))';

[~,SCCA_para.P_res, ~,~,~,~,~] = ccastat(data_norm,quality_norm);
SCCA_para.assist = (SCCA_para.P_res'*(data_norm*data_norm')*SCCA_para.P_res*(size(data_norm,2)-1)^-1)^-1;
%% threshold calculation T2
% J_th_CCA = (n_occa*(samplesize^2-1))/(samplesize*(samplesize-n_occa))...
%     *icdf('f',1-sig_level,n_occa,samplesize-n_occa); % threshold calculation for T2

if far_matix(1,2)==0;
   sig_level=far_matix(1,1)/100;
   SCCA_para.J_th_SCCA = chi2inv(1-sig_level,size(SCCA_para.P_res,2)); 
else
   SCCA_para.J_th_SCCA = far_matix(1,2);
end   