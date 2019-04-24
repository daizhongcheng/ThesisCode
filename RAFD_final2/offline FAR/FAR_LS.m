function [FAR] = FAR_LS(data,LS_para)
% FAR_PLS: False Alarm Rate calculation for Least Square method
% Call:
%        [FAR] = FAR_LS(data,LS_para)
%
% Inputs:
%            data - original data
%            LS_para- some process parameters during data generation, which
%                      will be used for later programming, for LS
% Outputs: 
%              FAR - false alarm rate
%
% Notes: NONE

% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
[samplesize,~] = size(data);
data_norm = normalizedata(data);
%% FAR
LS_T2 = zeros(1,samplesize);
LS_SPE = zeros(1,samplesize);
for i = 1:samplesize
    LS_T2(i) = data_norm(:,i)'*LS_para.assist1*data_norm(:,i);
     LS_SPE(i) = data_norm(:,i)'*LS_para.assist2*data_norm(:,i);
end

FAR = length(find(LS_T2>LS_para.J_LS_T2|LS_SPE>LS_para.J_LS_SPE))/samplesize;