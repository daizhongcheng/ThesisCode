function [FAR] = FAR_PLS(data,PLS_para)
% FAR_PLS: False Alarm Rate calculation for Partial Least Square method
% Call:
%        [FAR] = FAR_PLS(data,PLS_para)
%
% Inputs:
%            data - original data
%            PLS_para- some process parameters during data generation, which
%                      will be used for later programming, for PLS
% Outputs: 
%              FAR - false alarm rate
%         GLR_para - fault detection rate
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
PLS_T2 = zeros(1,samplesize);  
PLS_SPE = zeros(1,samplesize); 

for i =1:samplesize
    PLS_T2(i) = data_norm(:,i)'*PLS_para.assist1*data_norm(:,i);
    assist = PLS_para.assist2*data_norm(:,i);
    PLS_SPE(i) = assist'*assist;
end

FAR = length(find(PLS_T2>PLS_para.J_PLS_T2|PLS_SPE>PLS_para.J_PLS_SPE))/samplesize;