function [FAR] = FAR_PCA(data,PCA_para)
% FAR_PCA: False Alarm Rate calculation for Principle Component Analysis FD method 

% Call:
%        [FAR] = FAR_PCA(data,PCA_para)
%
% Inputs:
%            data - original data
%            PCA_para- some process parameters during data generation, which
%                      will be used for later programming, for PCA
% Outputs: 
%              FAR - false alarm rate
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
data_norm = normalizedata(data);

% ---------- FAR ----------------------------------------------------------
PCA_T2 = zeros(1,samplesize);
PCA_SPE = zeros(1,samplesize);

for i=1:samplesize
    PCA_T2(i) = data_norm(:,i)'*PCA_para.assist1*data_norm(:,i);% FAR_PCA_T2 = length(find(PCA_T2>J_PCA_T2))/samplesize;
    PCA_SPE(i) = data_norm(:,i)'*PCA_para.assist2*data_norm(:,i);% FAR_PCA_SPE = length(find(PCA_SPE>J_PCA_SPE))/samplesize;
end

FAR = length(find(PCA_SPE>PCA_para.J_PCA_SPE|PCA_T2>PCA_para.J_PCA_T2))/samplesize;