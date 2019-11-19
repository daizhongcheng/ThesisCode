load level_faultfree.mat
load level_Afault.mat
load level_MF.mat
load temp_faultfree.mat
load temp_Afault.mat
load temp_MF.mat
n = 12;
level_faultfree = level_faultfree(1300:end)
level_Afault = level_Afault(1300:end)
level_MF = level_MF(1300:end);
temp_faultfree = temp_faultfree(1300:end);
temp_Afault = temp_Afault(1300:end);
temp_MF = temp_MF(1300:end);

CsthN = [level_faultfree temp_faultfree];
CsthA = [level_Afault temp_Afault];
CsthM = [level_MF temp_MF];
CsthF = [CsthA;CsthM];
CsthF = CsthF';
LevelAll = [level_faultfree;level_Afault;level_MF];
TempAll = [ temp_faultfree;temp_Afault;temp_MF];

plot(LevelAll)
hold on
plot(TempAll)
hold off

[N_data data_mean y_variance] = Nor_data(CsthN') ;
[M N] = size(CsthN');
sigma_y = N_data*N_data'/(N-1);
inv_Sigma_y = inv(sigma_y) ;
J_N_data = T_evaluation(N_data,inv_Sigma_y) ;


load X.mat
% X = mean_matrix(CsthN') ; 
[dis_Rim C_data] = R_evaluation(CsthN',X);
Jn = [J_N_data ; dis_Rim];
[SEN SDEN SREN]= Cumulative(Jn',n);
[m n] = size(Jn);
label1 = -ones(1,n);


N_Faulty1_data = y_variance*(CsthF - data_mean) ;
J_N_Faulty1_data = T_evaluation(N_Faulty1_data,inv_Sigma_y) ;
[F1_dis_Rim A_C_data] = R_evaluation(CsthF,X) ;
Jf = [J_N_Faulty1_data;F1_dis_Rim];
[SENf SDENf SRENf]= Cumulative(Jf',10);
[m n] = size(Jf);
label2 = ones(1,n);

gscatter(Jn(1,:),Jn(2,:),label1,['k']);
hold on 
gscatter(Jf(1,:),Jf(2,:),label2,'r');
hold off
[m n] = size(SEN);
label3 = -ones(m,1);
% gscatter(SEN(:,1),SEN(:,2),label3,['k']);
% hold on 
[m n] = size(SENf);
label4 = ones(m,1);
% gscatter(SENf(:,1),SENf(:,2),label4,'r');
% hold off
%%
CsthJ = [SEN;SENf];
Csthl = [label3;label4]
gscatter(CsthJ(:,1),CsthJ(:,2),Csthl,['k','r']);
hold on 
mdl = fitcsvm(CsthJ,Csthl);
x = 0:0.05:50;
f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
y = f(x);
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
w = [0.1775;
    2.2058];
b= -7.1464;
r = @(c) w'*c+b;
c  = SENf';
tr = r(c);
[m n] = size(SENf);
fn =0;
fdn = 0;
for i = 1:m
    if tr(i) < 0
        fn = fn + 1;
    else
        fdn = fdn + 1;
    end
end
ndata = SEN';
nn = 0;
nan = 0;
c = ndata;
tr = r(c);
[m n] = size(SEN);
for i = 1:m
    if tr(i) < 0
        nan = nan + 1;
    else
        nn = nn + 1;
    end
end
