function [data,data_para,quality] = original_data_generation(a,b,c,Sample_Size,kpi)
% 
% original_data_generation: Data geneartion by given parameters(dimension of the
%         covariance matrix, the max and min eigenvalue of the covariance
%         matrix,sample size and uncertainty selction matrix )
%
% Call:
%         [data,data_para,quality] = original_data_generation(a,b,c,Sample_Size,kpi)
% 
% Inputs: 
%         case 1 (4 parameters)
%          a -                      - dimension of the covariance matrix
%          b -                      - lambda_Max 
%          c -                      - lambda_Min 
%          Sample_Size-             - sample size
%         case 2 (5 parameters)
%          a - dimension_Covariance - dimension of the covariance matrix
%          b -                      - lambda_Max 
%          c -                      - lambda_Min 
%          Sample_Size-             - sample size
%          kpi -                    - Key Performance Indicators
% 
% Outputs:
%          data: data without uncertainty
%          data_para: some process parameters during data generation, which
%                     will be used for later programming
%          quality: if there are 5 input parameters, then also return the quality of data  
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
data=[];
quality=[];
%[Q R] = qr(randn(a));     % get Haar orthogonal matrix 
%U = Q*diag(diag(sign(R)));  % get direction matrix
Mu=zeros(a,1);
[Q, R] = qr(randn(ceil(0.2*a)));
U = [Q*diag(diag(sign(R))),zeros(ceil(0.2*a),a-ceil(0.2*a));zeros(a-ceil(0.2*a),ceil(0.2*a)),eye(a-ceil(0.2*a))];% Haar unitary matrix
if c>b
   error('the first value must smaller than the second');
else
   power_ = unifrnd(c,b,1,a); %Continuous uniform random numbers
   power = sort(power_,'descend');
   if power(1) < 0.8*b
      power(1) = b*(1+0.1*randn(1));
   end
end
Sigma = diag(10.^power(:));
Covariance = U*Sigma*U';
data_para.Sigma=Sigma;
data_para.U=U;
data_para.Mu=Mu;

if nargin==4
   data = mvnrnd(Mu,Covariance,Sample_Size);
elseif nargin==5
   Mean = zeros(1,a+kpi);
   Cov1 = rand(kpi,1)*1e-2;
   Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
   data1 = mvnrnd(Mean,Cov1,Sample_Size);
   data = data1(:,1:end-kpi);
   epsilon = data1(:,end-kpi+1:end);
   Psi = randn(kpi,a);
   quality = Psi*data'+epsilon';
   quality = quality';
end
