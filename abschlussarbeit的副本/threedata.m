


n1 = 10;

EN = [J_N_data' dis_Rim'] ;
EA = [J_N_addfault_data' A_dis_Rim'] ;
EAL = [J_allfault_data' AM_dis_Rim'] ;
Ori_data = [EN;EA;EAL];

[m n] = size(EN);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(EA);
theclass2 = 2*ones(m,1);  
[m n] = size(EAL);
theclass3 = 3*ones(m,1);
Ori_label = [theclass1;theclass2;theclass3];
gscatter(Ori_data(:,1),Ori_data(:,2),Ori_label,...
    ['k' 'r' 'b' 'm'],['o' '+' '*' 's']);
Z0 = [Ori_data Ori_label];
[data1 SrEN] = Cumulative(EN,n1) ;
[data2 SrEA] = Cumulative(EA,n1) ;
[data3  SrEAL]= Cumulative(EAL,n1) ;
X = [data1;data2;data3];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = 2*ones(m,1);  
Y = [theclass1;theclass2;theclass3];
gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' ],['o' '+'  's']);
X1 = [SrEN;SrEA;SrEAL];
[m n] = size(SrEN);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(SrEA);
theclass2 = ones(m,1);  
[m n] = size(SrEAL);
theclass3 = ones(m,1);  
Y1 = [theclass1;theclass2;theclass3];
Z1 = [X Y];
Z2 = [X1 Y1];
Testdata = [J_mulfault_data' M_dis_Rim'] ;
[Testdata ST]= Cumulative(Testdata,n1) ;

