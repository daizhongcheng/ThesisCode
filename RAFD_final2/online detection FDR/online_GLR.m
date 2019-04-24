function [FDR,MT2FD] = online_GLR(data,fdata,Sample_size,GLR_para)
% onlineGLR: online fault detection by using the method of Generalized
%            Likelihood Ratio
% Call:
%        [FDR,MT2FD] = FDR_GLR(GLR_para,data,fdata,k_stop,Sample_size)
%
% Inputs:
%        sig_level - significance level (here is given FAR)
%             data - training data
%            fdata - fault data
%                t -
%            kstop - acceptable time limit of fault detection 
%
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


%%
[~,k_stop]=size(fdata);
%k_stop=10;
FGLR_logical = zeros(Sample_size,k_stop);  % turn into Sample_size X 10 form
for t=1:k_stop
    fault_data=fdata{t}; % choose the fault data for the time

    %%% preprocess 
    [~,fdata_norm] = normalizedata(data,fault_data);

    %%% FDR
    for i = 1:Sample_size  
        if any(FGLR_logical(i,:))==0 % if any FGLR_logical(i,:) is one, then return 1. then with '==0', means the other side
           FGLR = fdata_norm(:,i)'*GLR_para.assist*fdata_norm(:,i);
           FGLR_logical(i,t)=FGLR>=GLR_para.J_th_GLR; % the logical matrix of FGLR  
        end
    end
          
end

%% FDR
FDR_logical=FGLR_logical;
FDR_logical(all(FDR_logical == 0,2),:)=[]; % delete the line of all zeros
[row,column]=size(FDR_logical);
FDR = row/Sample_size; 

%% MT2FD
FGLR_logical(all(FGLR_logical == 0,2),1)=k_stop+1; % if no detection, then k_stop +1
MT2FD_idx=[];
for k=1:column
    MT2FD_idx(k)=k*sum(FGLR_logical(:,k));
end
MT2FD=sum(MT2FD_idx)/Sample_size;
