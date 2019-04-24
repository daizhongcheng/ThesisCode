function [FDR,MT2FD] = online_PCA(data,fdata,Sample_size,PCA_para)
% onlineGLR: online fault detection by using the method of Principal
%            Component Analysis
% Call:
%        [FDR,MT2FD] = online_PCA(data,fdata,Sample_size,PCA_para)
%
% Inputs:
%            data - training data
%            fdata - fault data
%            Sample_size
%            PCA_para
%
% Outputs: 
%              FDR - fault detection rate
%        MT2FD - mean time to fault detection calculation auxiliary
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


%%
[~,k_stop]=size(fdata);
FPCA_logical = zeros(Sample_size,k_stop);  % turn into Sample_size X 10 form
for t=1:k_stop
    fault_data=fdata{t}; % choose the fault data for the time

    %%% preprocess 
    [~,fdata_norm] = normalizedata(data,fault_data);

    %%% FDR
    for i = 1:Sample_size  
        if any(FPCA_logical(i,:))==0 % if any FGLR_logical(i,:) is one, then return 1. then with '==0', means the other side  
           FPCA_T2= fdata_norm(:,i)'*PCA_para.assist1*fdata_norm(:,i);% calculate T2 index
           FPCA_SPE = fdata_norm(:,i)'*PCA_para.assist2*fdata_norm(:,i); % calculate SPE index 
           FPCA_logical(i,t)=(FPCA_T2>=PCA_para.J_PCA_T2)|(FPCA_SPE>=PCA_para.J_PCA_SPE); % the logical matrix of FGLR
        end
    end
           
end

%% FDR
FDR_logical=FPCA_logical;
FDR_logical(all(FDR_logical == 0,2),:)=[]; % delete the line of all zeros
[row,~]=size(FDR_logical);
FDR = row/Sample_size; 

%% MT2FD
FPCA_logical(all(FPCA_logical == 0,2),1)=k_stop+1; % all zero lines to be k_stop+1
MT2FD_idx=[];
for k=1:k_stop
    MT2FD_idx(k)=k*sum(FPCA_logical(:,k));
end
MT2FD=sum(MT2FD_idx)/Sample_size;