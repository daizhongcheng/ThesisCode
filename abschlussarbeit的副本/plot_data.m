
data1 = [J_N_data' dis_Rim'] ;
data2 = [J_N_addfault_data' A_dis_Rim'] ;
data3 = [J_mulfault_data' M_dis_Rim'] ;
data4 = [J_allfault_data' AM_dis_Rim'] ;

X = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = ones(m,1);  
[m n] = size(data4);
theclass4 = ones(m,1); 
Y = [theclass1;theclass2;theclass3;theclass4];
X1 = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = 2*ones(m,1);  
[m n] = size(data4);
theclass4 = 3*ones(m,1); 
Y1 = [theclass1;theclass2;theclass3;theclass4];

Z = [X Y]

figure
 gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' 'm'],['o' '+' '*' 's']);
figure
gscatter(X1(:,1),X1(:,2),Y1,['k' 'r' 'b' 'm'],['o' '+' '*' 's']);




