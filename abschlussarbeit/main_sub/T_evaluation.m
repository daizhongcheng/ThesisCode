function J = T_evaluation(data,inv_Sigma_y)
[m n] = size(data) ;
J = ones(1,n);
for i = 1:n 
J(i) =  data(:,i)'*inv_Sigma_y* data(:,i);
end
end