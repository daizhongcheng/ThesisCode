function [LS_para] = trainingLS(data,quality,far_matix)
% trainingLS: offline training by using Least Square method
% Call:
%        [LS_para] = trainingLS(data,quality,far_matix)
%
% Inputs:
%             data     - original data
%             far_matix - the custom given paramter matrix to estimate FAR
%                         (in which such as acceptable FAR is given)
% Outputs: 
%            LS_para - the process paramters to do fault detection
% Notes: NONE

% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------

[samplesize,dimension] = size(data);
%% preprocess 
data_norm = normalizedata(data);
quality_norm = normalizedata(quality);

[LS] = lsstat(data_norm,quality_norm);
LS_para.assist1 = LS.Q1/(LS.Q1'*(data_norm*data_norm')*LS.Q1/(samplesize-1))*LS.Q1';
LS_para.assist2 = LS.Q2/(LS.Q2'*(data_norm*data_norm')*LS.Q2/(samplesize-1))*LS.Q2';
%% threshold calculation
if far_matix(1,2)==0;
   sig_level=far_matix(1,1)/100;
   LS_para.J_LS_T2=LS.l*(samplesize^2-1)/(samplesize*(samplesize-LS.l))*icdf('f',1-sig_level,LS.l,samplesize-LS.l);
   LS_para.J_LS_SPE = (dimension-LS.l)*(samplesize^2-1)/(samplesize*(samplesize-dimension+LS.l))*icdf('f',1-sig_level,dimension-LS.l,samplesize-dimension+LS.l);
else
   LS_para.J_LS_T2= far_matix(1,2);
   LS_para.J_LS_SPE= far_matix(1,2);
end   