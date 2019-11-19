function [dis_Rim dis_SRim C_data] = R_evaluation(data,mean_matrix,sw)
[m n] = size(data) ;
Dis = diag(ones(m,1)*0.05) ;
C_data = cell(1,n) ;
sw=sw-1;
for k = 1:(n-sw)
    y(k)= mat2cell((data(:,(k:1:(k+sw))))*(data(:,(k:1:(k+sw))))'+Dis,m);  % each array is M*M  
end
for i = 1:n-sw
    dis_SRim(i) = sqrt(sum(log(eig(y{i},mean_matrix)).^2));
end
for i = 1:n 
    C_data(i) = mat2cell(data(:,i)*data(:,i)'+Dis,m) ;
end
dis_Rim = ones(1,n) ;
for i = 1:n
    dis_Rim(i) = sqrt(sum(log(eig(C_data{i},mean_matrix)).^2));
end
end