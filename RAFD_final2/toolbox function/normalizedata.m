function [data_norm,fdata_norm]=normalizedata(data,fdata)
% normalizedata: 
%
% Call:
%          [data_norm,fdata_norm]=normalizedata(data,fdata)
%
% Inputs:
%              data - 
%             fdata - 
% Outputs:
%             data_norm -
%            fdata_norm -
%         
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
if nargin<2
    data_used = 1;
else
    data_used = 2;
end 

switch data_used
    case 1
        % data normalization
        [data_norm,~] = zscore(data);
        data_norm = data_norm';
        
    case 2
        fsamplesize = size(fdata,1);
        
        % data normalization
        [data_norm,data_mean,data_sigma] = zscore(data);
        data_norm = data_norm';
        
        % fault data normalization
        fdata_norm = diag(data_sigma')^(-1)*(fdata'-repmat(data_mean',1,fsamplesize));
end