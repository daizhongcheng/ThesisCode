%% data is additive faulty

% calculate the variances. 
[m,n] = size(multfault) ;
adf = [0;0;0] ; 
for i = 1:n
    af = multfault(:,i).^2 ;
    adf = af + ff ;
end
afsigma = 1./sqrt(adf/(n-1)) ;
afsigmad = diag(afsigma) ; % calculate the mean.    data is fault
 adf = [0;0;0] ;
 for i = 1:n
        af = multfault(:,i) ;
        adf = af + adf ;
 end
Eyobs_F = adf / n ; 
% Normalization  
for i = 1:n
   multfault(:,i) = afsigmad * (multfault(:,i)-Eyobs_F);
end 
J_tf2 = ones(1,n);
for i = 1:n 
J_tf2(1,i) =  multfault(:,i)'*inv_Sigma_y* multfault(:,i);
end

% Riemann Distance
R_multfault = afor ;
Dis = [0.05 0 0;0 0.05 0;0 0 0.05];
C_R_multfault = cell(1,n) ;
for i = 1:n 
    C_R_multfault(i) = mat2cell(R_multfault(:,i)*R_multfault(:,i)'+Dis,3) ;
end
   X = karcher(C_R_multfault{1:n}) ;% mean value
    dis_Rimadd = ones(1,n) ;
for i = 1:n
    dis_Rimadd(i) = distance_riemann(C_R_multfault{i},X) ;
end