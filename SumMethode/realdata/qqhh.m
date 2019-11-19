load('exp8_005'); %%%%%az1=0.035
Q1 = [exp8_005.Y(1).Data];
Q2 = [exp8_005.Y(2).Data];
h1 = [exp8_005.Y(3).Data];
h2 = [exp8_005.Y(4).Data];
AD = [Q1;Q2;h1;h2];
plot(Q1)
hold on 
plot(Q2)
plot(h1)
plot(h2)
legend('Q1','Q2','h1','h2')
hold off
[adm adn] = size(AD);


FaultFree1 = AD(:,1:455699);
FaultFree2 = AD(:,1001001:1283999);
FaultFree3 = AD(:,1720999:adn);
FaultFree = [FaultFree1 FaultFree2 FaultFree3];
Faulty1 = AD(:,455700:1001000);
Faulty2 = AD(:,1284000:1721000);
% figure
% 
% plot(FaultFree(1,:));
% hold on
% plot(FaultFree(2,:));
% plot(FaultFree(3,:));
% plot(FaultFree(4,:));
% hold off

[N_data data_mean y_variance] = Nor_data(FaultFree) ;
[M N] = size(FaultFree);
sigma_y = N_data*N_data'/(N-1);
inv_Sigma_y = inv(sigma_y) ;
% calculate the karcher mean, because it needs too time to calculate,so  I
% save the value of X
%  X = mean_matrix(FaultFree) ; 
load X;
J_N_data = T_evaluation(N_data,inv_Sigma_y) ;
[dis_Rim C_data] = R_evaluation(FaultFree,X);
NorJ = [J_N_data ;dis_Rim];
% gscatter(J_N_data,dis_Rim);


N_Faulty1_data = y_variance*(Faulty1 - data_mean) ;
J_N_Faulty1_data = T_evaluation(N_Faulty1_data,inv_Sigma_y) ;
[F1_dis_Rim A_C_data] = R_evaluation(Faulty1,X) ;

N_Faulty2_data = y_variance*(Faulty2 - data_mean) ;
J_N_Faulty2_data = T_evaluation(N_Faulty2_data,inv_Sigma_y) ;
[F2_dis_Rim A_C_data] = R_evaluation(Faulty2,X) ;

FJ2 = [J_N_Faulty2_data ;F2_dis_Rim];
FJ1 = [J_N_Faulty1_data ;F1_dis_Rim];
[m n] = size(NorJ);
numL1 = -ones(n,1);
[m n] = size(FJ1);
numL2 = ones(n,1);
[m n] = size(FJ2);
numL3 = 2*ones(n,1);
label = [numL1;numL2;numL3];
data = [NorJ';FJ1';FJ2'];
MData = mean(data);
VarData = var(data);
[m n] = size(data);
Ndata1 = ((data(:,1)-MData(1))./VarData(1));
Ndata2 = ((data(:,2)-MData(2))./VarData(2));
Ndata = [Ndata1 Ndata2];

%   mdl1 = fitcsvm(Ndata,label);
% f = @(x) -(x*mdl1.Beta(1) + mdl1.Bias)/mdl1.Beta(2);
% y = f(x);

figure
gscatter(data(:,1),data(:,2),label,['k' 'r'  'g']);
% gscatter(Ndata(:,1),Ndata(:,2),label,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);
hold on 
% aver = trainedClassifier.ClassificationSVM.Mu;
%  si = trainedClassifier.ClassificationSVM.Sigma
%  s = trainedClassifier.ClassificationSVM.KernelParameters.Scale;
%  beta = trainedClassifier.ClassificationSVM.Beta;
%  b = trainedClassifier.ClassificationSVM.Bias;
aver = [33.2703    5.1741];
si = [29.3026    0.8610];
                    sig =[1/29.3026 1/0.8610];
                    dsig = [0.0341 0;0 1.1614];
beta = [0.3770 ;1.9886];
b =  7.33853;
s = 0.2894;
f = @(x) (-b*s*si(1)*si(2)+aver(1)*beta(1)*si(2)-x*beta(1)*si(2))...
    /(beta(2)*si(1))+aver(2);
% r = @(x,y)beta'*diag(sig)*([x;y]-aver')/s + b   %([(x-aver(1)) ;(y-arver(2))])

x = 0:0.05:1000;
y =f(x);
plot(x,y,'b-','LineWidth',2,'DisplayName','Boundary')
hold off

 f =@(x,y1) (-b*s*si(1)*si(2)+aver(1)*beta(1)*si(2)-x*beta(1)*si(2))...
    /(beta(2)*si(1))+aver(2)-y1;
fdata = [FJ1';FJ2'];
ndata = NorJ';
% x = fdata(:,1);
% y1 = fdata(:,2);
% z = f(x,y1);
% [m n] = size(fdata);
% fn =0;
% fdn = 0;
% for i = 1:m
%     if z(i) < 0
%         fn = fn + 1;
%     else
%         rdn = fdn + 1;
%     end
% end
% ndata = NorJ';
% nn = 0;
% nan = 0;
% x = ndata(:,1);
% y1 = ndata(:,2);
% z = f(x,y1);
% [m n] = size(ndata);
% for i = 1:m
%     if z(i) < 0
%         nan = nan + 1;
%     else
%         nn = nn + 1;
%     end
% end
%%
r = @(c)beta'*diag(sig)*(c-aver')/s+b
fdata = [FJ1';FJ2'];
c = fdata';
tr = r(c);
[m n] = size(fdata);
fn =0;
fdn = 0;
for i = 1:m
    if tr(i) < 0
        fn = fn + 1;
    else
        fdn = fdn + 1;
    end
end
ndata = NorJ';
nn = 0;
nan = 0;
x = ndata(:,1);
y1 = ndata(:,2);
z = f(x,y1);
c = ndata';
tr = r(c);
[m n] = size(ndata);
for i = 1:m
    if tr(i) < 0
        nan = nan + 1;
    else
        nn = nn + 1;
    end
end

%%
w = [0.0481; 5.2780];
b = -23.5837;
x = -500:0.05:1000;
f = @(x) -(x*w(1) + b)/w(2);
y=f(x);
figure
gscatter(data(:,1),data(:,2),label,['k' 'r'  'g']);
hold on
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
%%
r = @(c) w'*c+b;
c  = fdata';
tr = r(c);
[m n] = size(fdata);
fn =0;
fdn = 0;
for i = 1:m
    if tr(i) < 0
        fn = fn + 1;
    else
        fdn = fdn + 1;
    end
end
ndata = NorJ';
nn = 0;
nan = 0;
c = ndata';
tr = r(c);
[m n] = size(ndata);
for i = 1:m
    if tr(i) < 0
        nan = nan + 1;
    else
        nn = nn + 1;
    end
end



