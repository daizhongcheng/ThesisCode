%SPE_threshold = get_SPE_threshold(SS,size(SS,2),a); % threshold of SPE statistic

function[SPE_threshold]=SPE_Schwellwert_zw(EValue,num_col_X,NumberUsedPC,alpha)

%calculate SPE threshold 
% EValue diagonal matrix of e- Values
% num_col_X number observation variables
% NumberUsedPC number of principle components used for T-square

theta_1 = [];
theta_2 = [];
theta_3 = [];
h_0 = [];
c_a = [];
a=NumberUsedPC;

theta_1 = sum(diag(EValue(a+1:num_col_X,a+1:num_col_X))); % variable for SPE threshold computation
theta_2 = sum(diag(EValue(a+1:num_col_X,a+1:num_col_X)).^2); % variable for SPE threshold computation
theta_3 = sum(diag(EValue(a+1:num_col_X,a+1:num_col_X)).^3); % variable for SPE threshold computation
h_0 = 1-2*theta_1*theta_3/(3*theta_2^2); % variable for SPE threshold computation
c_a = norminv(1-alpha); % normal deviate
SPE_threshold = theta_1*(c_a*sqrt(2*theta_2*h_0^2)/theta_1 + 1 + theta_2*h_0*(h_0-1)/(theta_1^2))^inv(h_0);

end