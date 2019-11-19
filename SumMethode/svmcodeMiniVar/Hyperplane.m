
%%

load xD.mat;
load yDf.mat;
load yDl.mat;
load data1.mat;
load data2.mat;
load data3.mat;
load data4.mat;
load data5.mat;
load EA.mat;
load EN.mat;
load EM.mat;
load EAL.mat;
load Emini.mat;
load xd_noVar.mat;
load ydf_noVar.mat;
load ydl_noVar.mat;
Z = [xD yDf];
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    Linear SVM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainedClassifier, validationAccuracy] = svmLinear(Z);
x = linspace(0,20);
y = linspace(0,10);
[XX,YY] = meshgrid(x,y);
pred = [XX(:),YY(:)];
aver = trainedClassifier.ClassificationSVM.Mu;
si = trainedClassifier.ClassificationSVM.Sigma
s = trainedClassifier.ClassificationSVM.KernelParameters.Scale;
beta = trainedClassifier.ClassificationSVM.Beta;
b = trainedClassifier.ClassificationSVM.Bias;
pab=trainedClassifier.predictFcn(pred);
% gscatter(pred(:,1),pred(:,2),pab);
gscatter(xD(:,1),xD(:,2),yDl);
hold on 
f = @(x) (-b*s*si(1)*si(2)+aver(1)*beta(1)*si(2)-x*beta(1)*si(2))...
    /(beta(2)*si(1))+aver(2);
%y =f(x) %standard is trun, there are average and variance

% f = @(x) -(x*trainedClassifier.ClassificationSVM.Beta(1) /trainedClassifier.ClassificationSVM.Beta(2)...
%     + trainedClassifier.ClassificationSVM.Bias); % standard:fause
x = 0:0.05:100;
y =f(x);
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% 
% ry = -0.0057*x-1.5021*1000;
% plot(x,ry)
hold off      
%%

p3 = trainedClassifier.predictFcn(data1) ;

[m n] = size(p3);
a = 0;
for i=1:m
    if p3(i) ==- 1
        a = a+1
    end
end
p4 = trainedClassifier.predictFcn([data2;data3;data4;data5]);
[m n] = size(p4);
b = 0;
for i=1:m
    if p4(i) == 1
        b = b+1
    end
end

% 
 mdl1 = fitcsvm(xD,yDf);
 x = 0:0.05:100;
f = @(x) -(x*mdl1.Beta(1) + mdl1.Bias)/mdl1.Beta(2);
y = f(x);
figure
gscatter(xD(:,1),xD(:,2),yDl);
hold on
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              SVM WITHOUT THE MINI var     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    KERNEL SVM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainedClassifier, validationAccuracy] = svmGaussian(Z);
x = linspace(0,100);
y = linspace(1,8);
[XX,YY] = meshgrid(x,y);
pred = [XX(:),YY(:)];
pab=trainedClassifier.predictFcn(pred);
gscatter(pred(:,1),pred(:,2),pab,'ry');
hold on 
 gscatter(xD(:,1),xD(:,2),yDl);
 hold off

% f = @(x) (-b*s*si(1)*si(2)-x*beta(1)*si(2)+aver(1)*beta(1)*si(2))/(beta(2)*si(1))+aver(2)
% y =f(x) %standard is trun, there are average and variance
% f = @(x) -(x*trainedClassifier.ClassificationSVM.Beta(1) /trainedClassifier.ClassificationSVM.Beta(2)...
%     + trainedClassifier.ClassificationSVM.Bias); % standard:fause
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nomal data and the maltiplicative fault data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] = size(EN);
class1 = -ones(m,1);
[m n] = size(EM);
class2 = ones(m,1);
Y = [class1;class2];
X = [EN;EM];
mdl = fitcsvm(X,Y);

%% hyperplane 
close all

x = 4:0.05:10;
f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
y = f(x);
gscatter(EN(:,1),EN(:,2),class1,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);
hold on
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
figure
gscatter(EM(:,1),EM(:,2),class2,[ 'r' 'b' 'y'],['o' '+' '*' 's']);
hold on
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
%%

ab = [X Y]

p3 = predict(mdl,data1);
[m n] = size(p3);
a = 0;
for i=1:m
    if p3(i) == 1
        a = a+1
    end
end
p4 = predict(mdl,[data2;data3;data4]);
[m n] = size(p4);
b = 0;
for i=1:m
    if p4(i) == -1
        b = b+1
    end
end
