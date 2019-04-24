function [FAR] = FAR_GLR(data,GLR_para)
% FAR_GLR: False Alarm Rate calculation for Generalized Likelihood
%              Ratio method
%              
% Call:
%        [FAR] = FAR_GLR(data,GLR_para)
%
% Inputs:
%            data - original data
%            GLR_para- some process parameters during data generation, which
%                      will be used for later programming, for GLR
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

% ----- FAR ---------------------------------------------------------------
GLR = zeros(1,samplesize);  

for i =1:samplesize
    GLR(i) = data_norm(:,i)'*GLR_para.assist*data_norm(:,i);
end
FAR = length(find(GLR>GLR_para.J_th_GLR))/samplesize;

