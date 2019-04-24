function [data,quality,t_steady] = datagenDynamic(Dpmodel,sys)
% dynamic data generation
%
%       Call: [data,quality,t_steady] = datagenDynamic(Dpmodel,sys)
%
% Inputs:
%        Dpmodel - parameters unit to build dynamic model, including such
%                  as inputs, outputs dimension
%            sys - created system 
%     
%   Outputs
%           data - input data set (without fault)
%        quality - output data set without fault
%       t_steady - steady point
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

%%
%N=Dpmodel(1,1);
ni=Dpmodel(1,2);
no=Dpmodel(1,3);
%method=Dpmodel(1,3);
%% training data generation
ts = 0.01;% sample time

% training data generation
U = zeros(2500,ni);            % input is a lang vector, 2500 samples
%Ynoise = zeros(samplesize,no);%
Ynoise = zeros(2500,no);       % output is also 2500 samples
Umean = ones(ni,1);%2*rand(model_dim(3),1);%%%%%%%%%%%%%%%%%%%%
% noise = 4e-3*randn(samplesize,1);
for j=1:ni
    U(:,j)=Umean(j)+4e-3*randn(2500,1);
end
for j=1:no
    Ynoise(:,j)=1e-3*randn(2500,1);
end
% U = ones(Sample_Size,1)*1+4e-3*randn(Sample_Size,1);
t = (0:ts:ts*(2500-1))';  % simulation time
Y = lsim(sys,U,t);
Y = Y+Ynoise;
%Y_aim1 = [Y(2:end,:);Y(end,:)];
%Y_aim2 = Y_aim1-Y;
%t_aim = find(abs(Y_aim2(:,:))<0.01);  %%%%%%%%%%
% Yfinal = mean(Y(end-100:end,:));
% t_aim = find(abs(Y(:,1)-ones(Sample_Size,1)*Yfinal(1))<=0.05*Yfinal(1)...
% & abs(Y(:,2)-ones(Sample_Size,1)*Yfinal(2))<=0.05*Yfinal(2));

%t_steady = t_aim(1);
t_steady=100;  % choos the t_steady=100, to make sure the choosing point is in the stable state
data = U(t_steady+1:t_steady+600,:); % choose 600 samples to do fault detection
quality = Y(t_steady+1:t_steady+600,:);
%X = [data,quality];