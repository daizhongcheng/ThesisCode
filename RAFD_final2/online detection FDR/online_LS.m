function [FDR,MT2FD] = online_LS(data,fdata,Sample_size,LS_para)
% onlineLS: online fault detection by using the method of Lest Squares
% Call:
%        [FDR,MT2FD] = online_LS(data,fdata,Sample_size,PLS_para)
%
% Inputs:
%            data - training data
%            fdata - fault data
%            Sample_size
%            LS_para
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
FLS_logical = zeros(Sample_size,k_stop);  % turn into Sample_size X 10 form
for t=1:k_stop
    fault_data=fdata{t}; % choose the fault data for the time

    %%% preprocess 
    [~,fdata_norm] = normalizedata(data,fault_data);

    %%% FDR
    for i = 1:Sample_size  
        if any(FLS_logical(i,:))==0 % if any FGLR_logical(i,:) is one, then return 1. then with '==0', means the other side  
           FLS_T2 = fdata_norm(:,i)'*LS_para.assist1*fdata_norm(:,i);% calculate T2 index
           FLS_SPE = fdata_norm(:,i)'*LS_para.assist2*fdata_norm(:,i); % calculate SPE index 
           FLS_logical(i,t) = (FLS_T2>LS_para.J_LS_T2)|(FLS_SPE>LS_para.J_LS_SPE); % the logical matrix of FGLR
        end
    end
           
end

%% FDR
FDR_logical=FLS_logical;
FDR_logical(all(FDR_logical == 0,2),:)=[]; % delete the line of all zeros
[row,~]=size(FDR_logical);
FDR = row/Sample_size; 

%% MT2FD
FLS_logical(all(FLS_logical == 0,2),1)=k_stop+1; % FD time is k_stop+1 delete the line of all zeros
MT2FD_idx=[];
for k=1:k_stop
    MT2FD_idx(k)=k*sum(FLS_logical(:,k));
end
MT2FD=sum(MT2FD_idx)/Sample_size;