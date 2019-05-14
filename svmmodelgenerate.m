
 %Train the SVM Classifier
% cMdl = fitcsvm(X,Y,'KernelFunction','rbf');gaussian
 Mdl = fitcsvm(X,Y,'KernelFunction','gaussian')
 [trainedClassifier, validationAccuracy] = trainClassifier(Z)
 Mdl = trainedClassifier
% Predict scores over the grid
d = 0.05;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
p = predict(Mdl,xGrid);
p = trainedClassifier.predictFcn(xGrid) 

% Plot the data and the decision boundary
figure;
gscatter(X(:,1),X(:,2),Y,'kb','.');
hold on
gscatter(xGrid(:,1),xGrid(:,2),p,'ry')

