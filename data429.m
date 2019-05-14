clc ;
clear ;
close all ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialise the condision
M = 3 ;
N = 3000 ; %Generation the number of data
AN = 3000 ;%Generation the number of additive fault data
MN = 3000 ; %Generation the number of maltiplicative fault data
AllN = 3000 ; %Generation the number of additive fault and maltiplicative fault data
S_data = [45;15;30] ; %stable operating point
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ch_to = unifrnd(-0.2,0.2,M,N); %disturbance
normdata = S_data + randn(3,N) ;
ch_beto  = unifrnd(-5,5,M,AN); %disturbance
addfault_data = S_data+ch_beto+randn(M,AN) ;


[N_data data_mean y_variance] = Nor_data(normdata) ;
% Sigma_y = N_data*N_data'/(N-1) ;
sigma_y = (normdata - data_mean)*(normdata - data_mean)'/(N-1); 
inv_Sigma_y = inv(sigma_y) ;
% J_N_data = T_evaluation(N_data,inv_Sigma_y) ;
X = mean_matrix(normdata) ;
J_data = T_evaluation(normdata - data_mean,inv_Sigma_y) ;
% J_N_data = T_evaluation(N_data,inv_Sigma_y) ;
[dis_Rim C_data] = R_evaluation(normdata,X);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% additive fault
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N_addfault_data = y_variance*(addfault_data - data_mean) ;
J_N_addfault_data = T_evaluation(addfault_data - data_mean,inv_Sigma_y) ;

[A_dis_Rim A_C_data] = R_evaluation(addfault_data,X);
x = 1:(N+AN);
 
plot(x,[J_data J_N_addfault_data])
figure
plot(x,[dis_Rim A_dis_Rim])
figure
plot(x,[normdata addfault_data])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maltiplicative fault
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rand_vec = unifrnd(5,6,3,1);
rand_cor = rand_vec*rand_vec';
sigma_m = sigma_y+rand_cor;
C = chol(sigma_m);
R = randn(M,MN);
multifault_data=C*R+diag(data_mean)*ones(M,MN);
J_mulfault_data = T_evaluation(multifault_data - data_mean,inv_Sigma_y) ;
[M_dis_Rim M_data] = R_evaluation(multifault_data,X);

% 
% plot(x,[dis_Rim M_dis_Rim])
% figure
% plot(x,[J_N_data J_mulfault_data])
% figure
% plot(x,[normdata multifault_data])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maltiplicative and additive fault
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ch_to = unifrnd(-0.2,0.2,M,N); %disturbance
% normdata = S_data + randn(3,N) ;
% rand_vec = unifrnd(5,6,3,1);
% rand_cor = rand_vec*rand_vec';
% sigma_m = sigma_y+rand_cor;
% C = chol(sigma_m);
% R = randn(M,MN);
% allfault_data=C*R+diag(data_mean)*ones(M,MN)+ch_beto+randn(M,AN) ;
% J__allfault_data = T_evaluation(allfault_data - data_mean,inv_Sigma_y) ;
% [A_dis_Rim A_data] = R_evaluation(allfault_data,X);
% plot(x,[dis_Rim A_dis_Rim])

% figure
% % plot(x,[normdata multifault_data])
% plot(x,[J_N_data J__allfault_data])
% figure
% plot(x,[normdata allfault_data])



