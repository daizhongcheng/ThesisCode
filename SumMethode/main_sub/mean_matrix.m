function X = mean_matrix(data)
[m n] = size(data);
Dis = diag(ones(m,1)*0.05) ;
C_data = cell(1,n) ;
for i = 1:n 
    C_data(i) = mat2cell(data(:,i)*data(:,i)'+Dis,3) ;
end
   X = karcher(C_data{1:n}) ;% mean value
   
end