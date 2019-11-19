close all ;
load matdata/J_N_data;
load matdata/J_N_addfault_data;
load matdata/J_mulfault_data;
load matdata/J_allfault_data;
load matdata/dis_Rim;
load matdata/A_dis_Rim;
load matdata/M_dis_Rim;
load matdata/AM_dis_Rim;
load matdata/NS_Rim;
load matdata/AS_Rim;
load matdata/MS_Rim;
load matdata/AMs_Rim;

n1 = 11;
J_N_data = SlideCumulative(J_N_data,n1);
J_N_addfault_data = SlideCumulative(J_N_addfault_data,n1);
J_mulfault_data = SlideCumulative(J_mulfault_data,n1);
J_allfault_data = SlideCumulative(J_allfault_data,n1);

EN = [J_N_data NS_Rim'] ;
EA = [J_N_addfault_data AS_Rim'] ;
EM = [J_mulfault_data MS_Rim'] ;
EAL = [J_allfault_data AMs_Rim'] ;


X = [EN;EA;EM;EAL];
[m n] = size(EN);
theclass1 = -ones(m,1); % generate m numbers value 1
[m n] = size(EA);
theclass2 = ones(m,1);  
[m n] = size(EM);
theclass3 = 2*ones(m,1);  
[m n] = size(EAL);
theclass4 = 3*ones(m,1);  
Y = [theclass1;theclass2;theclass3;theclass4];
figure('name','cumulative algorithm')
gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);





%%
Y = double((Y == -1));
Z1 = [X Y];
