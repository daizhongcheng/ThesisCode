function [PCA_para]=trainingPCA(data,far_matix)
% trainingPCA: offline training by using Principle Component Analysis FD method 
%             
% Call:
%        [PCA_para]=trainingPCA(data,far_matix)
%
% Inputs:
%        data     - original data
%       far_matix - the custom given paramter matrix to estimate FAR
%                   (in which such as acceptable FAR is given)
% Outputs: 
%         GLR_para - the process paramters to do fault detection
%
% Notes: NONE
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
%[samplesize,~] = size(data);

%% preprocess 
data_norm = normalizedata(data);
%------ parameters for PCA ------------------------------------------------
[USV.U,USV.S,~] = svd(cov(data_norm'));
[PCAS,l] = pcastat(0.9,USV); % 90percent as the pricipal component
PCA_para.assist1=PCAS.P_PCA/(PCAS.Sigma)*PCAS.P_PCA';
PCA_para.assist2 = PCAS.P_tilde*PCAS.P_tilde';
%% threshold calculation
if far_matix(1,2)==0;
   sig_level=far_matix(1,1)/100;
   PCA_para.J_PCA_T2 = icdf('chi2',1-sig_level,l);% threshold for PCA_T2
   PCA_para.J_PCA_SPE = PCAS.para_SPE(2)*(norminv((1-sig_level),0,1)*sqrt(2*PCAS.para_SPE(3)*PCAS.para_SPE(1)^2)...
                        /PCAS.para_SPE(2)+1+PCAS.para_SPE(3)*PCAS.para_SPE(1)*(PCAS.para_SPE(1)-1)...
                        /PCAS.para_SPE(2)^2)^(1/PCAS.para_SPE(1));% threshold for PCA_SPE
else
   PCA_para.J_PCA_T2= far_matix(1,2);
   PCA_para.J_PCA_SPE= far_matix(1,2);
end