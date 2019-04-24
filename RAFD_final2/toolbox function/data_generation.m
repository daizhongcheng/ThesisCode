function [data_with_uncertainty,quality_with_uncertainty] = data_generation(a,Sample_Size,d,data_para,kpi)
% 
% data_geneartion: Data geneartion with uncertainties by given parameters(dimension of the
%                  covariance matrix,sample size and uncertainty type indicator 'd', data_para and KPI )
%
% Call:
%         [data_with_uncertainty,quality_with_uncertainty] = data_generation(a,Sample_Size,d,data_para,kpi)
% 
% Inputs: 
%         case 1 (4 parameters)
%          a - dimension_Covariance - dimension of the covariance matrix
%          Sample_Size              - sample size
%          d                        - uncertainty selction matrix,   such as d=1, only uncertainties in lambda
%          data_para                - some process parameters during data generation, which
%                                     will be used for later programming
%         case 2 (5 parameters)
%          a - dimension_Covariance - dimension of the covariance matrix
%          Sample_Size              - sample size
%          d                        - uncertainty selction matrix,   such as d=1, only uncertainties in lambda
%          data_para                - some process parameters during data generation, which
%                                     will be used for later programming
%          kpi                      - Key Performance Indicators
% Outputs:
%          data_with_uncertainty-
%          quality_with_uncertainty- 
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
data_with_uncertainty=[];
Sigma = data_para.Sigma;
U = data_para.U;
Mu=data_para.Mu;
% calculate data with uncertainty

    if d==1 % Sigma uncertainty is selected
       delta_sigma=Sigma.*diag(0.5.*rand(1,a));
       Sigma_uncertainty=Sigma+randsrc*delta_sigma;
       Covariance = U*Sigma_uncertainty*U';
       if nargin==4
          data_with_uncertainty = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==5
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty = Psi*data_with_uncertainty'+epsilon';
          quality_with_uncertainty = quality_with_uncertainty';
       end
    end
    
    if d==2 % uncertainty in direction matrix U is selected
       %[Q R] = qr(randn(a));     % get Haar orthogonal matrix 
       %U = Q*diag(diag(sign(R)));  % get direction matrix
       [Q, R] = qr(randn(ceil(0.2*a)));
       U = [Q*diag(diag(sign(R))),zeros(ceil(0.2*a),a-ceil(0.2*a));zeros(a-ceil(0.2*a),ceil(0.2*a)),eye(a-ceil(0.2*a))];% Haar unitary matrix
       Covariance = U*Sigma*U';
       if nargin==4
          data_with_uncertainty = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==5
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty = Psi*data_with_uncertainty'+epsilon';
          quality_with_uncertainty = quality_with_uncertainty';
       end
    end 
    
    if d==3 % uncertainties both Sigma and in direction matrix U are selected
       %Eignvalues_uncertainty=Eignvalues*(0.5+rand(1));  %Eignvalues_uncertainty=Eignvalues+Eignvalues*(-0.5+(0.5-(-0.5)).*rand(1));
       delta_sigma=Sigma.*diag(0.5.*rand(1,a));
       Sigma_uncertainty=Sigma+randsrc*delta_sigma;
       %[Q R] = qr(randn(a));     % get Haar orthogonal matrix
       %U = Q*diag(diag(sign(R)));  % get direction matrix
       [Q, R] = qr(randn(ceil(0.2*a)));
       U = [Q*diag(diag(sign(R))),zeros(ceil(0.2*a),a-ceil(0.2*a));zeros(a-ceil(0.2*a),ceil(0.2*a)),eye(a-ceil(0.2*a))];% Haar unitary matrix
       Covariance = U*Sigma_uncertainty*U';
       if nargin==4
          data_with_uncertainty = mvnrnd(Mu,Covariance,Sample_Size);
       elseif nargin==5
          Mean = zeros(1,a+kpi);
          Cov1 = rand(kpi,1)*1e-2;
          Cov1 = blkdiag(Covariance,diag(Cov1)); % generate the noise in Theta which is uncorrelated with y
          data_with_uncertainty1 = mvnrnd(Mean,Cov1,Sample_Size);
          data_with_uncertainty = data_with_uncertainty1(:,1:end-kpi);
          epsilon = data_with_uncertainty1(:,end-kpi+1:end);
          Psi = randn(kpi,a);
          quality_with_uncertainty = Psi*data_with_uncertainty'+epsilon';
          quality_with_uncertainty = quality_with_uncertainty';
       end
    end
end