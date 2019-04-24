function [DPCA_para]=trainingDPCA(input,output,far_matix)
% training DPCA: online fault detection by using the method of Dynamic
%             Principal Component Analysis
%              
% Call:
%        [DPCA_para]=trainingDPCA(input,output,far_matix)
%
% Inputs:
%             input     - input data
%             output    - output data
%            far_matix - the custom given paramter matrix to estimate FAR
%                        (in which such as acceptable FAR is given)
% Outputs: 
%         DPCA_para - the process paramters to do fault detection
% Notes: NONE

% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
%% preprocess
% Hankel matrix generated 
X = [input,output];
% [Xn,Xmean,Xsigma] = zscore(X);
N = size(X,1);
D = diag(X'*X);
[ACF, lags] = autocorr(D);
lag_max = 20;
for ii=1:lag_max
    if ACF(ii)<=0.05 %Box & Jenkins
       break 
    end
end

h = lags(ii);    % the time lag
w = N-h;      % (w <= N-h)

X_H = X(N-w+1:N,:);
for i = 1:h
    X_H = [X_H, X(N-w+1-i:N-i,:)];
end

DPCA_para.h=h;
DPCA_para.w=w;
DPCA_para.N=N;
% normalization
data_norm = normalizedata(X_H);
[USV.U,USV.S,~] = svd(cov(data_norm'));
[PCAS,l] = pcastat(0.9,USV); % 90percent as the pricipal component
% [P,Sigma] = eig(1/(N-1)*(X_Hn'*X_Hn)); 
% var = diag(Sigma);
% [var,idx] = sort(var,'descend');
% P = P(:,idx);
% T = X_Hn*P;
%[~,samplesize] = size(data_norm);

%% threshold
    if far_matix(1,2)==0;
        sig_level=far_matix(1,1)/100;

        % J_PCA_T2 = (l*(samplesize^2-1)/samplesize/(samplesize-l))*icdf('f',1-sig_level,l,samplesize-l);
        DPCA_para.J_PCA_T2 = icdf('chi2',1-sig_level,l);% threshold for PCA_T2
        DPCA_para.J_PCA_SPE = PCAS.para_SPE(2)*(norminv((1-sig_level),0,1)*sqrt(2*PCAS.para_SPE(3)*PCAS.para_SPE(1)^2)...
            /PCAS.para_SPE(2)+1+PCAS.para_SPE(3)*PCAS.para_SPE(1)*(PCAS.para_SPE(1)-1)...
            /PCAS.para_SPE(2)^2)^(1/PCAS.para_SPE(1));% threshold for PCA_SPE
    else
       DPCA_para.J_PCA_T2= far_matix(1,2);
       DPCA_para.J_PCA_SPE= far_matix(1,2);
    end
DPCA_para.assist1=PCAS.P_PCA/(PCAS.Sigma)*PCAS.P_PCA';
DPCA_para.assist2 = PCAS.P_tilde*PCAS.P_tilde';
end