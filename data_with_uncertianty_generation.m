function [data,data_with_uncertainty,quality_with_uncertainty] = data_with_uncertianty_generation(a,b,c,Sample_Size,d,kpi)
% 
% data_geneartion: Data geneartion by given parameters(dimension of the
%         covariance matrix, the max and min eigenvalue of the covariance
%         matrix,sample size and uncertainty selction matrix )
%
% Call:
%         [data,data_with_uncertianty] = data_geneartion(a,b,c,Sample_Size,d)
% 
% Inputs: 
%         case 1 (4 parameters)
%          a - dimension_Covariance - dimension of the covariance matrix
%          b -                      - lambda_Max 
%          c -                      - lambda_Min 
%          Sample_Size-             - sample size
%         case 2 (3 parameters)
%          a - dimension_Covariance - dimension of the covariance matrix
%          b -                      - lambda_Max 
%          c -                      - lambda_Min 
%          Sample_Size-             - sample size
%          d -                      - uncertainty selction matrix,   such as d=1, only uncertainties in lambda
% 
% Outputs:
%          data: data without uncertainty
%          data_with_uncertianty: data with uncertianty
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%???????????????????  
quality_with_uncertainty={};
% calculate data without uncertainty
[Q R] = qr(randn(a));     % get Haar orthogonal matrix 
U = Q*diag(diag(sign(R)));  % get direction matrix
Mu=zeros(a,1);
if c>b  
   error('the first eigenvalue must smaller than the second');
else
   power_ = unifrnd(c,b,1,a); %Continuous uniform random numbers
   power = sort(power_,'descend');
   if power(1) < 0.8*b
      power(1) = b*(1+0.1*randn(1));
   end
end
Eignvalues=10.^power(:);
Sigma = diag(Eignvalues);
Covariance = U*Sigma*U';
data = mvnrnd(Mu,Covariance,Sample_Size);

% calculate data with uncertainty
%Setting wait bar
H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
    'WindowStyle','Modal');
for i=1:Sample_Size
    if d==1 % Sigma uncertainty is selected
       str = ['Generating ''Sigma'' type uncertainty...', num2str(round((i-1)/Sample_Size*100)), '%'];
       if ishandle(H)
          waitbar((i-1)/Sample_Size,H,str);
       else
          return;
       end
       delta_sigma=Sigma.*diag(0.5.*rand(1,a));
       Sigma_uncertainty=Sigma+randsrc*delta_sigma;
       Covariance = U*Sigma_uncertainty*U';
       if nargin==5
          data_with_uncertainty{i} = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==6
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty{i} = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty2 = Psi*data_with_uncertainty{i}'+epsilon';
          quality_with_uncertainty{i} = quality_with_uncertainty2';
       end
    end
    
    if d==2 % uncertainty in direction matrix U is selected
       str = ['Generating ''U'' type uncertainty...', num2str(round((i-1)/Sample_Size*100)), '%'];
       if ishandle(H)
          waitbar((i-1)/Sample_Size,H,str);
       else
          return;
       end
       [Q R] = qr(randn(a));     % get Haar orthogonal matrix 
       U = Q*diag(diag(sign(R)));  % get direction matrix
       Covariance = U*Sigma*U';
       if nargin==5
          data_with_uncertainty{i} = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==6
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty{i} = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty2 = Psi*data_with_uncertainty{i}'+epsilon';
          quality_with_uncertainty{i} = quality_with_uncertainty2';
       end
    end 
    
    if d==3 % uncertainties both Sigma and in direction matrix U are selected
       str = ['Generating ''Sigma'' and ''U'' type uncertainty...', num2str(round((i-1)/Sample_Size*100)), '%'];
       if ishandle(H)
          waitbar((i-1)/Sample_Size,H,str);
       else
          return;
       end
       delta_sigma=Sigma.*diag(0.5.*rand(1,a));
       Sigma_uncertainty=Sigma+randsrc*delta_sigma;
       [Q R] = qr(randn(a));     % get Haar orthogonal matrix 
       U = Q*diag(diag(sign(R)));  % get direction matrix
       Covariance = U*Sigma_uncertainty*U';
       if nargin==5
          data_with_uncertainty{i} = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==6
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty{i} = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty2 = Psi*data_with_uncertainty{i}'+epsilon';
          quality_with_uncertainty{i} = quality_with_uncertainty2';
       end
    end
end
if ishandle(H)
   delete(H);
end
end
