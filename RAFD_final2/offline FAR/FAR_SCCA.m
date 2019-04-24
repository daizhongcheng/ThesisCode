function [FAR] = FAR_SCCA(data,SCCA_para)
% FAR_SCCA: False Alarm Rate calculation for Statistic Canonical Variate
% Analysis Method
%
% Call:
%        [FAR] = FAR_SCCA(data,SCCA_para)
%
% Inputs:
%        data - original data
%        SCCA_para- some process parameters during data generation, which
%                   will be used for later programming, for SCCA
% 
% Outputs: 
%              FAR - false alarm rate
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
[samplesize,~] = size(data);

%% preprocess 
data_norm = (data-repmat(mean(data),samplesize,1))';

%% FAR
SCCA = zeros(1,samplesize);  
for i =1:samplesize
    SCCA(i) = data_norm(:,i)'*SCCA_para.P_res*SCCA_para.assist*SCCA_para.P_res'*data_norm(:,i); 
end
FAR = length(find(SCCA>SCCA_para.J_th_SCCA))/samplesize;