function [FDR,MT2FD] = online_DPCA(input,output,inputf,outputf,DPCA_para,k_stop)
% onlineGLR: online fault detection by using the method of Principal
%            Component Analysis
% Call:
%        [FDR,MT2FD] = online_DPCA(input,output,inputf,outputf,DPCA_para)
%
% Inputs:
%            input     - input data
%            output    - output data
%            inputf    - input fault data
%            outputf   - output fault data
%            DPCA_para - some process parameters during data generation, which
%                        will be used for later programming, for DPCA
% Outputs: 
%           FDR - fault detection rate
%           MT2FD - mean time to fault detection calculation auxiliary
%                    index
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
fdata=[inputf,outputf];
fdata_H =fdata(N-w+1:N,:);
for i = 1:h
    fdata_H = [fdata_H, fdata(N-w+1-i:N-i,:)];
end

% normalization
[data_norm,fdata_norm] = normalizedata(X_H,fdata_H);
%[USV.U,USV.S,~] = svd(cov(data_norm'));
[~,samplesize] = size(data_norm);

%% FDR
FPCA_T2 = zeros(1,samplesize);
FPCA_SPE = zeros(1,samplesize);


% calculate T2 index 

for i=1:samplesize % 100=k_stop
    FPCA_T2(i) = fdata_norm(:,i)'*DPCA_para.assist1*fdata_norm(:,i);
    FPCA_SPE(i) = fdata_norm(:,i)'*DPCA_para.assist2*fdata_norm(:,i);
    %if (FPCA_T2(i)>=DPCA_para.J_PCA_T2)||(FPCA_SPE(i)>=DPCA_para.J_PCA_SPE)
    %    FDR=1;
    %    MT2FD=i-50;
    %    break
    %else
    %    FDR=0;
    %    MT2FD=100+1;
    %end
end

fdr=find((FPCA_T2>=DPCA_para.J_PCA_T2)|(FPCA_SPE>=DPCA_para.J_PCA_SPE));
FDR=length(fdr)/samplesize;
if isempty(fdr)==1;
    MT2FD=k_stop+1;
else
   MT2FD=fdr(1);
end


