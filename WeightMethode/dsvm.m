close all;
%% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X3(:,1)):d:max(X3(:,1)),...
    min(X3(:,2)):d:max(X3(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];

[x1Grid,x2Grid] = meshgrid(min(X4(:,1)):d:max(X4(:,1)),...
    min(X4(:,2)):d:max(X4(:,2)));
xGrid1 = [x1Grid(:),x2Grid(:)];
%% linear
[trainedClassifier_linear, validationAccuracy_linear]...
    = trainClassifier_linear(Z4)


p1 = trainedClassifier_linear.predictFcn(xGrid) ;

% Plot the data and the decision boundary

figure;
gscatter(xGrid(:,1),xGrid(:,2),p1,'yc','.')
hold on
gscatter(X3(:,1),X3(:,2),Y1,'kbrg','.');
hold off

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