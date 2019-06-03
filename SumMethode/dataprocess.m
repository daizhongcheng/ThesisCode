close all ;
load matdata/J_N_data;
load matdata/J_N_addfault_data;
load matdata/J_mulfault_data;
load matdata/J_allfault_data;
load matdata/dis_Rim;
load matdata/A_dis_Rim;
load matdata/M_dis_Rim;
load matdata/AM_dis_Rim;
n1 = 10;
EN = [J_N_data' dis_Rim'] ;
EA = [J_N_addfault_data' A_dis_Rim'] ;
EM = [J_mulfault_data' M_dis_Rim'] ;
EAL = [J_allfault_data' AM_dis_Rim'] ;
Ori_data = [EN;EA;EM;EA] ;


[data1 SdEN SrEN] = Cumulative(EN,n1) ;
[data2 SdEA SrEA] = Cumulative(EA,n1) ;
[data3 SdEM SrEM] = Cumulative(EM,n1) ;
[data4 SdEAL SrEAL]= Cumulative(EAL,n1) ;
X = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = 2*ones(m,1);  
[m n] = size(data4);
theclass4 = 3*ones(m,1);  
Y = [theclass1;theclass2;theclass3;theclass4];
figure('name','cumulative algorithm')
gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);



X1 = [SdEN;SdEA;SdEM;SdEAL];
[m n] = size(SdEN);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(SdEA);
theclass2 = ones(m,1);  
[m n] = size(SdEM);
theclass3 = 2*ones(m,1);  
[m n] = size(SdEAL);
theclass4 = 3*ones(m,1);  
Y1 = [theclass1;theclass2;theclass3;theclass4];
figure('name','expand mean of cumulative algorithm')
gscatter(X1(:,1),X1(:,2),Y1,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);


X2 = [SrEN;SrEA;SrEM;SrEAL];
[m n] = size(SrEN);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(SrEA);
theclass2 = ones(m,1);  
[m n] = size(SrEM);
theclass3 = 2*ones(m,1);  
[m n] = size(SrEAL);
theclass4 = 3*ones(m,1);  
Y2 = [theclass1;theclass2;theclass3;theclass4];
figure('name','mean of cumulative algorithm')
gscatter(X2(:,1),X2(:,2),Y2,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);

%%
X3 = [Ori_data(:,1) X1(:,2)];
X4 = [ X1(:,2) Ori_data(:,2)];
figure('name','mean of cumulative algorithm not for Jt2')
gscatter(X3(:,1),X3(:,2),Y1,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);

figure('name','mean of cumulative algorithm not for JR')
gscatter(X4(:,1),X4(:,2),Y1,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);

%%
Y = double((Y == -1));
Y1 = double((Y1 == -1));
Y2 = double((Y2 == -1));
Z1 = [X Y];
Z2 = [X1 Y1];
Z3 = [X2 Y2];
Z4 = [X3 Y1];
Z5 = [X4 Y1];


