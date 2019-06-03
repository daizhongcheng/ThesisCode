function [dis_Rim C_data] = R_evaluation(data,mean_matrix)
[m n] = size(data) ;
Dis = diag(ones(m,1)*0.05) ;
C_data = cell(1,n) ;
for i = 1:n 
    C_data(i) = mat2cell(data(:,i)*data(:,i)'+Dis,m) ;
end
dis_Rim = ones(1,n) ;
for i = 1:n
    dis_Rim(i) = sqrt(sum(log(eig(C_data{i},mean_matrix)).^2));
end
end