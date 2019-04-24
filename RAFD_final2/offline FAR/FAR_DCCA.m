function [FAR]=FAR_DCCA(input,output,DCCA_para)
% training DPCA: offline FAR by using the method of  Dynamic
%             Canonical Correlation Analysis
% Call:
%        [FAR]=FAR_DPCA(input,output,DPCA_para)
%
% Inputs:
% Inputs:
%             input     - input data
%             output    - output data
%            DCCA_para- some process parameters during data generation, which
%                      will be used for later programming, for DCCA
% Outputs: 
%              FAR - false alarm rate
% Notes: NONE

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


% normalization
[input_f_norm] = normalizedata(input_f');
[input_p_norm] = normalizedata(input_p');
[output_f_norm] = normalizedata(output_f');
[output_p_norm] = normalizedata(output_p');

Z_p = [output_p_norm;input_p_norm];
[~,samplesize] = size(Z_p);
%% FAR
CCA = zeros(1,samplesize);  

for i =1:samplesize
    temp1 = L'*output_f_norm(:,i)-Omega*P'*Z_p(:,i);
    CCA(i) = temp1'*temp1;
end

FAR = length(find(CCA>DCCA_para.J_th_CCA))/samplesize;

end