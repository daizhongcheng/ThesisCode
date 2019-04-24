function [FDR,MT2FD] = online_DCCA(input,output,inputf,outputf,DCCA_para,k_stop)
% onlineGLR: online fault detection by using the method of Dynamic
%            Canonical Correlation Analysis
% Call:
%        [FDR,MT2FD] = online_DCCA(input,output,inputf,outputf,DCCA_para)
%
% Inputs:
%            input     - input data
%            output    - output data
%            inputf    - input fault data
%            outputf   - output fault data
%            DCCA_para - some process parameters during data generation, which
%                        will be used for later programming, for DCCA
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


s_f=DCCA_para.s_f;
P=DCCA_para.P;
L=DCCA_para.L;
Omega=DCCA_para.Omega;

k = 2*s_f-1;
[input_f,output_f,input_p,output_p] = cons_hankel(output',input',s_f,k);
[finput_f,foutput_f,finput_p,foutput_p] = cons_hankel(outputf',inputf',s_f,k);

% normalization
[input_f_norm,finput_f_norm] = normalizedata(input_f',finput_f');
[input_p_norm,finput_p_norm] = normalizedata(input_p',finput_p');
[output_f_norm,foutput_f_norm] = normalizedata(output_f',foutput_f');
[output_p_norm,foutput_p_norm] = normalizedata(output_p',foutput_p');

%Z_p = [output_p_norm;input_p_norm];
fZ_p = [foutput_p_norm;finput_p_norm];
[~,samplesize] = size(fZ_p);
%% FDR

FCCA = zeros(1,samplesize); 

% calculate T2 index 

for i=1:samplesize % 10=k_stop
    temp2 = L'*foutput_f_norm(:,i)-Omega*P'*fZ_p(:,i);
    FCCA(i) = temp2'*temp2;
    %if (FCCA(i)>=DCCA_para.J_th_CCA)
    %    FDR=1;
    %    MT2FD=i-50;
    %    break
    %else
    %    FDR=0;
    %    MT2FD=100+1;
    %end
end
fdr=find(FCCA>DCCA_para.J_th_CCA);
FDR=length(fdr)/samplesize;
if isempty(fdr)==1;
   MT2FD=k_stop+1;
else
   MT2FD=fdr(1);
end



