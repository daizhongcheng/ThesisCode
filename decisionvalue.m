%% J_t2  dis_Rim       are fault free
%% J_tf2 dis_Rimadd    are additive faulty





% T2 evaluation data generate
load addfault.mat ;
load faultfree.mat ;
afor = addfault ;
ffor = faultfree ;
addfault = addfault' ;
faultfree = faultfree' ;
[m,n] = size(faultfree) ;
St = 1500 ;
%%  data is falut free T2
% calculate the variances.   data is fault free
ff = [0;0;0] ; 
for i = St:n
    sf = faultfree(:,i).^2 ;
    ff = sf + ff ;
end

ffsigma = 1./sqrt(ff/(n-St-1)) ;
ffsigmad = diag(ffsigma) ;
% calculate the mean.    data is fault free
 ff = [0;0;0] ;
 for i = St:n
        sf = faultfree(:,i) ;
        ff = sf + ff ;
 end
 Eyobs = ff / n ;
% Normalization 
a1 = St-1 ;
for i = 1:n
   faultfree(:,i) = ffsigmad * (faultfree(:,i)-Eyobs);
end
% calculate Covariance and evalue function
Sigma_y = faultfree*faultfree'/(n-1) ;
inv_Sigma_y = inv(Sigma_y) ;
J_t2 = ones(1,n-St);
for i = St:n 
J_t2(i-a1) =  faultfree(:,i)'*inv_Sigma_y* faultfree(:,i);
end

% Riemann Distance
R_faultfree = ffor' ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_faultfree = cell(1,n) ;
for i = 1:n 
    C_R_faultfree(i) = mat2cell(R_faultfree(:,i)*R_faultfree(:,i)'+Dis,3) ;
end
    X = karcher(C_R_faultfree{St:n}) ;% mean value
    dis_Rim = ones(1,n-St) ;
    a2 = St - 1;
for i = St:n
    dis_Rim(i-a2) = distance_riemann(C_R_faultfree{i},X) ;
end

%% data is additive faulty

% calculate the variances. 
[m,n] = size(addfault) ;
adf = [0;0;0] ; 
for i = St:n
    af = addfault(:,i).^2 ;
    adf = af + ff ;
end
afsigma = 1./sqrt(adf/(n-St-1)) ;
afsigmad = diag(afsigma) ;
% calculate the mean.    data is fault
 adf = [0;0;0] ;
 for i = St:n
        af = addfault(:,i) ;
        adf = af + adf ;
 end
 Eyobs_F = adf / n-St ; 
% Normalization  
a3 = St-1;
for i = St:n
   addfault(:,i) = afsigmad * (addfault(:,i)-Eyobs_F);
end 
J_tf2 = ones(1,n-St);
for i = St:n 
J_tf2(1,i-a3) =  addfault(:,i)'*inv_Sigma_y* addfault(:,i);
end

% Riemann Distance
R_addfault = afor' ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_addfault = cell(1,n) ;
a4 = St-1;
for i = 1:n 
    C_R_addfault(i) = mat2cell(R_addfault(:,i)*R_addfault(:,i)'+Dis,3) ;
end
%     X = karcher(C_R_addfault{St:n}) ;% mean value
    dis_Rimadd = ones(1,n-St) ;
for i = St:n
    dis_Rimadd(i-a4) = distance_riemann(C_R_addfault{i},X) ;
end


    
