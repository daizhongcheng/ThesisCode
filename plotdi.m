close all;
d = 1 ;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(cl,xGrid);

% Plot the data and the decision boundary
figure;
h(1:2) = gscatter(X(:,1),X(:,2),Y,'rb','.');
hold on
ezpolar(@(x)1);
h(3) = plot(X(trainedClassifier.ClassificationSVM.SupportVectors,1),X(trainedClassifier.ClassificationSVM.SupportVectors,2),'ko');
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');
legend(h,{'-1','+1','Support Vectors'});
axis equal
hold off