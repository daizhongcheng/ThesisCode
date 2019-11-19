close all;
%% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];

%% linear
[trainedClassifier_linear, validationAccuracy_linear]...
    = trainClassifier_linear(Z1)


p1 = trainedClassifier_linear.predictFcn(xGrid) ;

% Plot the data and the decision boundary

figure;
gscatter(xGrid(:,1),xGrid(:,2),p1,'yc','.')
hold on
gscatter(X(:,1),X(:,2),Y,'kbrg','.');
hold off

%% gaussian
[trainedClassifier_gaussian, validationAccuracy_gaussian] = ...
    trainClassifier_gaussian(Z1)
p2 = trainedClassifier_gaussian.predictFcn(xGrid) ;
figure;
gscatter(xGrid(:,1),xGrid(:,2),p2,'yc','.')
hold on
gscatter(X(:,1),X(:,2),Y,'kbrg','.');
hold off


