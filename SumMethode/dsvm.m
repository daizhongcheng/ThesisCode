close all;
%% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X3(:,1)):d:max(X3(:,1)),...
    min(X3(:,2)):d:max(X3(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];

[x1Grid,x2Grid] = meshgrid(min(X4(:,1)):d:max(X4(:,1)),...
    min(X4(:,2)):d:max(X4(:,2)));
xGrid1 = [x1Grid(:),x2Grid(:)];

[xx,yy] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
pred = [xx(:),yy(:)];
%% linear

%%
aver = trainedClassifier_linear.ClassificationSVM.Mu
si = trainedClassifier_linear.ClassificationSVM.Sigma
s = trainedClassifier_linear.ClassificationSVM.KernelParameters.Scale
beta = trainedClassifier.ClassificationSVM.Beta
b = trainedClassifier_linear.ClassificationSVM.Bias
[trainedClassifier_linear, validationAccuracy_linear]...
    = AB(ab)


p1 = trainedClassifier_linear.predictFcn(pred) ;

% Plot the data and the decision boundary

figure;
% gscatter(pred(:,1),pred(:,2),p1,'yc','.')
hold on
gscatter(X(:,1),X(:,2),Y,'kb','.');

x = 0:0.05:40;
y = -0.1123*x+4.98;
% f = @(x) (-b*s*si(1)*si(2)-x*beta(1)*si(2)+aver(1)*beta(1)*si(2))/(beta(2)*si(1))+aver(2)
% y =f(x)
% y = f(x);
plot (x,y)
hold off
p3 = trainedClassifier_linear.predictFcn(data1) ;

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



%%

f = @(x) (-b*s*si(1)*si(2)-x*beta(1)*si(2)+aver(1)*beta(1)*si(2))/(beta(2)*si(1))+aver(2)
y =f(x)

plot (x,y)

%% gaussian
[trainedClassifier_gaussian, validationAccuracy_gaussian] = ...
    trainClassifier_gaussian(Z4)
p2 = trainedClassifier_gaussian.predictFcn(xGrid) ;
figure;
gscatter(xGrid(:,1),xGrid(:,2),p2,'yc','.')
hold on
gscatter(X3(:,1),X3(:,2),Y1,'kbrg','.');
hold off


%% linear
[trainedClassifier_linear2, validationAccuracy_linear]...
    = trainClassifier_linear(Z5)


p3 = trainedClassifier_linear2.predictFcn(xGrid1) ;

% Plot the data and the decision boundary

figure;
gscatter(xGrid1(:,1),xGrid1(:,2),p3,'yc','.')
hold on
gscatter(X4(:,1),X4(:,2),Y1,'kbrg','.');
hold off

%% gaussian
[trainedClassifier_gaussian2, validationAccuracy_gaussian] = ...
    trainClassifier_gaussian(Z5)
p4 = trainedClassifier_gaussian2.predictFcn(xGrid1) ;
figure;
gscatter(xGrid1(:,1),xGrid1(:,2),p4,'yc','.')
hold on
gscatter(X4(:,1),X4(:,2),Y1,'kbrg','.');