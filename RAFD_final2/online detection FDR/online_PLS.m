function [FDR,MT2FD] = online_PLS(data,fdata,Sample_size,PLS_para)
% onlinePLS: online fault detection by using the method of Partial Lest
%           Squares
% Call:
%        [FDR,MT2FD] = online_PLS(data,fdata,Sample_size,PLS_para)
%
% Inputs:
%            data - training data
%            fdata - fault data
%            Sample_size
%            PLS_para
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
FPLS_logical = zeros(Sample_size,k_stop);  % turn into Sample_size X 10 form
for t=1:k_stop
    fault_data=fdata{t}; % choose the fault data for the time

    %%% preprocess 
    [~,fdata_norm] = normalizedata(data,fault_data);

    %%% FDR
    for i = 1:Sample_size  
        if any(FPLS_logical(i,:))==0 % if any FGLR_logical(i,:) is one, then return 1. then with '==0', means the other side  
           FPLS_T2 = fdata_norm(:,i)'*PLS_para.assist1*fdata_norm(:,i);% calculate T2 index
           
           assist = PLS_para.assist2*fdata_norm(:,i);
           FPLS_SPE = assist'*assist; % calculate SPE index 
           FPLS_logical(i,t)=(FPLS_T2>PLS_para.J_PLS_T2)|(FPLS_SPE>PLS_para.J_PLS_SPE); % the logical matrix of FGLR
        end
    end
           
end

%% FDR
FDR_logical=FPLS_logical;
FDR_logical(all(FDR_logical == 0,2),:)=[]; % delete the line of all zeros
[row,~]=size(FDR_logical);
FDR = row/Sample_size; 

%% MT2FD
FPLS_logical(all(FPLS_logical == 0,2),1)=k_stop+1; % FD time is k_stop+1 for the line of all zeros
MT2FD_idx=[];
for k=1:k_stop
    MT2FD_idx(k)=k*sum(FPLS_logical(:,k));
end
MT2FD=sum(MT2FD_idx)/Sample_size;