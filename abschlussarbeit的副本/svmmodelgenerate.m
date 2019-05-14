close all;
[trainedClassifier0, validationAccuracy0] = trainClassifier(Z0)
[trainedClassifier1, validationAccuracy1] = trainClassifier(Z1)
[trainedClassifier2, validationAccuracy2] = trainClassifier(Z2)

% Predict scores over the grid
d = 0.05;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];

p = trainedClassifier.predictFcn(xGrid) ;
p1 = trainedClassifier1.predictFcn(xGrid) ;
% Plot the data and the decision boundary

figure;
gscatter(xGrid(:,1),xGrid(:,2),p,'ry')
hold on
gscatter(X(:,1),X(:,2),Y,'kb','.');
px = trainedClassifier.predictFcn(Testdata) ;
gscatter(Testdata(:,1),Testdata(:,2),px,'gc','.');
hold off



figure;
gscatter(xGrid(:,1),xGrid(:,2),p1,'ry')
hold on 
px1 = trainedClassifier1.predictFcn(ST) ;
gscatter(X1(:,1),X1(:,2),Y1,'kb','.') ;
gscatter(ST(:,1),ST(:,2),px1,'gc','.') ;
hold off


