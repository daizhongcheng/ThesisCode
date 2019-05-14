data1 = [J_N_data' dis_Rim'] ;
data2 = [J_N_addfault_data' A_dis_Rim'] ;
data3 = [J_allfault_data' AM_dis_Rim'] ;

X = [data1;data2;data3];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = ones(m,1);  
Y = [theclass1;theclass2;theclass3];
X1 = [data1;data2;data3];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = 2*ones(m,1);  
Y1 = [theclass1;theclass2;theclass3];
Z = [X Y];

Testdata = [J_mulfault_data' M_dis_Rim'] ;
