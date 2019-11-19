close all
%% Predict scores over the grid
d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(Xn(:,1)):d:max(Xn(:,1)),...
    min(Xn(:,2)):d:max(Xn(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
%% linear
[trainedClassifier, validationAccuracy_linear]...
    = trainClassifier(Zn)


p1 = trainedClassifier.predictFcn(xGrid) ;


% Plot the data and the decision boundary

figure;
gscatter(xGrid(:,1),xGrid(:,2),p1,'yc','.')
hold on
gscatter(Xn(:,1),Xn(:,2),Yn,'kb','.');
hold off
