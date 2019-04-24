clc;
clear;

normdata = [4;6;10];
ch_to = unifrnd(-0.25,0.25,3,10000);
normdata = normdata + [0.01 0 0;0 0.01 0;0 0 0.01]*randn(3,10000);
normdata = normdata + ch_to;
ch_beto = unifrnd(2,8,3,10000);
addfault_data = normdata+ch_beto+randn(3,10000)*.03;
% data_nor_add = [normdata addfault_data];
sigma_y = normdata*normdata'/(10000-1);
% sigma_y = data_nor_add*data_nor_add'/(10000-1);
rand_vec = unifrnd(0,3,3,1);
rand_cor = rand_vec*rand_vec';
sigma_m = sigma_y+rand_cor;

multifault_data = normcdf(mvnrnd([0 0 0], sigma_m, 10000));%generate the uniform distribution(0,1)
n = unifrnd(0,10,10000,1);
multifault_data = (multifault_data.*n)';%0-10 uniform distribution

allfault = multifault_data+unifrnd(10,20,3,10000);


% T2 evaluation data generate
afor = addfault_data ;
ffor = normdata ;
addfault = addfault_data ;
faultfree =normdata ;
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
   faultfree(:,i) = ffsigmad * (faultfree(:,i)-Eyobs);
end
% calculate Covariance and evalue function
Sigma_y = faultfree*faultfree'/(n-1) ;
inv_Sigma_y = inv(Sigma_y) ;
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
    adf = af + ff ;
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
J_tf2 = ones(1,n);
for i = 1:n 
J_tf2(1,i) =  addfault(:,i)'*inv_Sigma_y* addfault(:,i);
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


    
