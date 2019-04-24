function [FDR,MT2FD] = online_SCCA(data,fdata,Sample_size,SCCA_para)
% onlineSCCA: online fault detection by using the method of Statistic
%             Canonical Correlation Analysis for fault in u and y subapces
% Call:
%        [FDR,MT2FD] = online_SCCA(data,fdata,Sample_size,SCCA_para)
%
% Inputs:
%            data - training data
%            fdata - fault data
%            Sample_size
%            SCCA_para
% Outputs: 
%              FDR - fault detection rate
%        MT2FD_idx - mean time to fault detection calculation auxiliary
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

[samplesize,~] = size(data);
%%
[~,k_stop]=size(fdata);
FSCCA_logical = zeros(Sample_size,k_stop);  % turn into Sample_size X 10 form
for t=1:k_stop
    fault_data=fdata{t}; % choose the fault data for the time

    %%% preprocess 
    %[~,fdata_norm] = normalizedata(data,fault_data);
    fdata_norm = (fault_data-repmat(mean(fault_data),samplesize,1))';
    %%% FDR
    for i = 1:Sample_size  
        if any(FSCCA_logical(i,:))==0 % if any FGLR_logical(i,:) is one, then return 1. then with '==0', means the other side  
           FSCCA = fdata_norm(:,i)'*SCCA_para.P_res*SCCA_para.assist*SCCA_para.P_res'*fdata_norm(:,i); %%Q ?
           FSCCA_logical(i,t) = (FSCCA>=SCCA_para.J_th_SCCA);  % the logical matrix of FGLR
        end
    end
           
end

%% FDR
FDR_logical=FSCCA_logical;
FDR_logical(all(FDR_logical == 0,2),:)=[]; % delete the line of all zeros
[row,~]=size(FDR_logical);
FDR = row/Sample_size; 

%% MT2FD
FSCCA_logical(all(FSCCA_logical == 0,2),1)=k_stop+1; % FD time is k_stop+1 delete the line of all zeros
MT2FD_idx=[];
for k=1:k_stop
    MT2FD_idx(k)=k*sum(FSCCA_logical(:,k));
end
MT2FD=sum(MT2FD_idx)/Sample_size;