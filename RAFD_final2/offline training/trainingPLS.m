function [PLS_para] = trainingPLS(data,quality,far_matix)
% trainingPLS: offline training by using Partial Least Square method
% Call:
%        [PLS_para] = trainingPLS(data,quality,far_matix)
%
% Inputs:
%             data     - original data
%             far_matix - the custom given paramter matrix to estimate FAR
%                         (in which such as acceptable FAR is given)
% Outputs: 
%            PLS_para - the process paramters to do fault detection
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
% find gamma
[~,~,~,~,~,PCTVAR] = plsregress(data_norm',quality_norm',dimension);
gamma_aid = find(cumsum(PCTVAR(2,:)/sum(PCTVAR(2,:)))>0.9);
gamma = gamma_aid(1);
 
[PLS] = plsstat(data_norm,quality_norm,gamma);                                                 
PLS_para.assist1 = PLS.R/(PLS.T'*PLS.T/(samplesize-1))*PLS.R';
PLS_para.assist2 = eye(dimension)-PLS.P*PLS.R';
%% threshold calculation
if far_matix(1,2)==0;
   sig_level=far_matix(1,1)/100;
   PLS_para.J_PLS_T2 = (gamma*(samplesize^2-1))/(samplesize*(samplesize-gamma))*icdf('f',1-sig_level,gamma,samplesize-gamma);
   
   % Jth of SPE
   Y_e= PLS.Y_d;
   for i=1:size(Y_e,2)
       SPE(i)=Y_e(:,i)'*Y_e(:,i);
   end
   a=mean(SPE);
   b=var(SPE);
   PLS_para.J_PLS_SPE=(b/(2*a))*chi2inv(1-sig_level,2*(a^2)/b);
else
   PLS_para.J_PLS_T2= far_matix(1,2);
   PLS_para.J_PLS_SPE= far_matix(1,2);
end