clc;
clear;

normdata = [15;30;45];
ch_to = unifrnd(-0.2,0.2,3,30000);%sensor range
normdata = normdata + [0.001 0 0;0 0.001 0;0 0 0.001]*randn(3,30000);
normdata = normdata + ch_to;
% ch_beto = unifrnd(4,10,3,30000);
addfault_data = normdata+[1;1;1];
% data_nor_add = [normdata addfault_data];
sigma_y = normdata*normdata'/(30000-1);
% sigma_y = data_nor_add*data_nor_add'/(1000-1);
rand_vec = unifrnd(-0.1,0.1,3,1);
rand_cor = rand_vec*rand_vec';
sigma_m = sigma_y+rand_cor;

% multifault_data = [4;6;10]+(normcdf(mvnrnd([4 6 10], sigma_m, 30000)))';%generate the uniform distribution(0,1)
multifault_data = (mvnrnd([15;30;45], sigma_m, 30000))';
ch_beto2 = unifrnd(1,10,3,30000);
addfault_data2 = normdata+ch_beto2;
allfault = multifault_data+addfault_data2;


% T2 evaluation data generate
afor = addfault_data ;
ffor = normdata ;
addfault = addfault_data ;
faultfree = normdata ;
[m,n] = size(faultfree) ;
%%  data is falut free T2
% calculate the variances.   data is fault free
ff = [0;0;0] ; 
for i =1:n
    sf = faultfree(:,i).^2;
    ff = ff + sf;
end 
 
ffsigma = 1./sqrt(ff/(n-1)) ;
ffsigmad = diag(ffsigma) ;
% calculate the mean.    data is fault free
 ff = [0;0;0] ;
 for i = 1:n
        sf = faultfree(:,i) ;
        ff = sf + ff ;
 end
 Eyobs = ff / n ;
% Normalization 
for i = 1:n
%    faultfree(:,i) = ffsigmad * (faultfree(:,i)-Eyobs);
faultfree(:,i) = faultfree(:,i)-Eyobs;%测试
end
% calculate Covariance and evalue function
Sigma_y = faultfree*faultfree'/(n-1) ;
inv_Sigma_y = inv(Sigma_y) ;
faultfree(:,i) = ffsigmad*faultfree(:,i); %测试

J_t2 = ones(1,n);
for i = 1:n 
J_t2(i) =  faultfree(:,i)'*inv_Sigma_y* faultfree(:,i);
end

% Riemann Distance
R_faultfree = ffor ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_faultfree = cell(1,n) ;
for i = 1:n 
    C_R_faultfree(i) = mat2cell(R_faultfree(:,i)*R_faultfree(:,i)'+Dis,3) ;
end
    X = karcher(C_R_faultfree{1:n}) ;% mean value
    dis_Rim = ones(1,n) ;
for i = 1:n
    dis_Rim(i) = distance_riemann(C_R_faultfree{i},X) ;
end

%% data is additive faulty

% calculate the variances. 
[m,n] = size(addfault) ;
adf = [0;0;0] ; 
for i = 1:n
    af = addfault(:,i).^2 ;
    adf = af + adf ;
end
afsigma = 1./sqrt(adf/(n-1)) ;
afsigmad = diag(afsigma) ; % calculate the mean.    data is fault
 adf = [0;0;0] ;
 for i = 1:n
        af = addfault(:,i) ;
        adf = af + adf ;
 end
Eyobs_F = adf / n ; 
% Normalization  
for i = 1:n
   addfault(:,i) = afsigmad * (addfault(:,i)-Eyobs_F);
end 
J_taf = ones(1,n);
for i = 1:n 
J_taf(1,i) =  addfault(:,i)'*inv_Sigma_y* addfault(:,i);
end

% Riemann Distance
R_addfault = afor ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_addfault = cell(1,n) ;
for i = 1:n 
    C_R_addfault(i) = mat2cell(R_addfault(:,i)*R_addfault(:,i)'+Dis,3) ;
end
   X = karcher(C_R_addfault{1:n}) ;% mean value
    dis_Rimadd = ones(1,n) ;
for i = 1:n
    dis_Rimadd(i) = distance_riemann(C_R_addfault{i},X) ;
end

%% multi_fault 
mulf = multifault_data ;
[m,n] = size(mulf) ;
muf = [0;0;0] ; 
for i = 1:n
    mf = mulf(:,i).^2 ;
    muf = mf + muf ;
end
mfsigma = 1./sqrt(muf/(n-1)) ;
mfsigmad = diag(mfsigma) ; % calculate the mean.    data is fault
 muf = [0;0;0] ;
 for i = 1:n
        mf = mulf(:,i) ;
        muf = mf + muf ;
 end
Eyobs_mF = muf / n ; 
% Normalization  
for i = 1:n
   mulf(:,i) = mfsigmad * (mulf(:,i)-Eyobs_mF);
end 
J_tmf = ones(1,n);
for i = 1:n 
J_tmf(1,i) =  mulf(:,i)'*inv_Sigma_y* mulf(:,i);
end
% multi_fault Riemann Distance
R_mulfault = multifault_data ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_mulfault = cell(1,n) ;
for i = 1:n 
    C_R_mulfault(i) = mat2cell(R_mulfault(:,i)*R_mulfault(:,i)'+Dis,3) ;
end
   X = karcher( C_R_mulfault{1:n}) ;% mean value
    dis_Rimmu = ones(1,n) ;
for i = 1:n
    dis_Rimmu(i) = distance_riemann(C_R_mulfault{i},X) ;
end
%%all fault
allf = allfault ;
[m,n] = size(allf) ;
alf = [0;0;0] ; 
for i = 1:n
    al_f = allf(:,i).^2 ;
    alf = alf + al_f ;
end
allfsigma = 1./sqrt(alf/(n-1)) ;
allfsigmad = diag(allfsigma) ; % calculate the mean.    data is fault
 alf = [0;0;0] ;
 for i = 1:n
        af = allf(:,i) ;
        alf = af + alf ;
 end
Eyobs_alF = alf / n ; 
% Normalization  
for i = 1:n
   allf(:,i) = allfsigmad * (allf(:,i)-Eyobs_alF);
end 
J_talf = ones(1,n);
for i = 1:n 
J_talf(1,i) =  allf(:,i)'*inv_Sigma_y* allf(:,i);
end
%  Riemann Distance
R_allf = allfault ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_allf = cell(1,n) ;
for i = 1:n 
    C_R_allf(i) = mat2cell(R_allf(:,i)*R_allf(:,i)'+Dis,3) ;
end
   X = karcher( C_R_allf{1:n}) ;% mean value
    dis_Rimall = ones(1,n) ;
for i = 1:n
    dis_Rimall(i) = distance_riemann(C_R_allf{i},X) ;
end

