function [FAR]=FAR_DPCA(input,output,DPCA_para)
% onlineDPCA: FAR estimation by using the method of Dynamic
%             Principal Component Analysis
%              
% Call:
%        [FAR]=FAR_DPCA(input,output,DPCA_para)
%
% Inputs:
% Inputs:
%             input     - input data
%             output    - output data
%            DPCA_para- some process parameters during data generation, which
%                      will be used for later programming, for DPCA
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

%% preprocess
% Hankel matrix generated 
X = [input,output];
h = DPCA_para.h;    % the time lag
w = DPCA_para.w;      % (w <= N-h)
N = DPCA_para.N;
X_H = X(N-w+1:N,:);
for i = 1:h
    X_H = [X_H, X(N-w+1-i:N-i,:)];
end

% normalization
[data_norm] = normalizedata(X_H);
[~,samplesize] = size(data_norm);
%% FAR
DPCA_T2 = zeros(1,samplesize);
DPCA_SPE = zeros(1,samplesize);


for i=1:samplesize
    DPCA_T2(i) = data_norm(:,i)'*DPCA_para.assist1*data_norm(:,i);% calculate T2 index 
    DPCA_SPE(i) = data_norm(:,i)'*DPCA_para.assist2*data_norm(:,i);% calculate SPE index 

end
% FAR_PCA_T2 = length(find(PCA_T2>J_PCA_T2))/samplesize;

% FAR_PCA_SPE = length(find(PCA_SPE>J_PCA_SPE))/samplesize;

FAR = length(find((DPCA_SPE>DPCA_para.J_PCA_SPE)|(DPCA_T2>DPCA_para.J_PCA_T2)))/samplesize;
