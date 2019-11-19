% close all
% mdl = fitcsvm(Xn,Yn);
% x = 5:0.05:20;
% f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
% y = f(x);
% 
% gscatter(Xn(:,1),Xn(:,2),Yn(:,1))
% hold on
% plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% hold off
% 
% close all
% mdl = fitcsvm(Xm,Ym);
% close all 
% x = 5:0.05:10;
% f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
% y = f(x);
% 
% gscatter(Xm(:,1),Xm(:,2),Ym(:,1))
% hold on
% plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% hold off 
% 
% close all 
% figure 
% 
% x = 6:0.05:10
% f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
% y = f(x)
% y = k*x+c
% hold on 
% 
% plot(EN(:,1),EN(:,2),'g')
% plot(x,y,'r--')
% hold off  
% 
x = linspace(0,20);
y = linspace(0,10);
[XX,YY] = meshgrid(x,y);
pred = [XX(:),YY(:)];
% p = predict(mdl,pred);
% gscatter(pred(:,1),pred(:,2),p);
% Zm = [Xm Ym]
% p1 = predict(mdl,EN);
% [m n] = size(p1);
% a = 0;
% for i=1:m
%     if p1(i) == -1
%         a = a+1
%     end
% end
% p2 = predict(mdl,EM);
% [m n] = size(p2);
% b = 0;
% for i=1:m
%     if p2(i) == -1
%         b = b+1
%     end
% end
%         
% 
% mdl = fitcsvm(XAL,YAL);
% close all 
% x = 5:0.05:20;
% f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
% y = f(x);
% 
% gscatter(XAL(:,1),XAL(:,2),YAL(:,1))
% hold on
% plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% hold off 
% p3 = predict(mdl,EN);
% [m n] = size(p3);
% a = 0;
% for i=1:m
%     if p3(i) == -1
%         a = a+1
%     end
% end
% p4 = predict(mdl,EAL);
% [m n] = size(p4);
% b = 0;
% for i=1:m
%     if p4(i) == 1
%         b = b+1
%     end
% end
% 
%    mdl1 = fitcsvm(Ori,OAL);  
%  f = @(x) -(x*mdl1.Beta(1) + mdl1.Bias)/mdl1.Beta(2);
%  x=6:0.5:15
% y = f(x);
% 
% gscatter(Ori(:,1),Ori(:,2),OAL(:,1))
% hold on
% plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% hold off
% 
% p3 = predict(mdl1,EN);
% [m n] = size(p3);
% a = 0;
% for i=1:m
%     if p3(i) == 1
%         a = a+1
%     end
% end
% p4 = predict(mdl1,[EA;EM;EAL]);
% [m n] = size(p4);
% b = 0;
% for i=1:m
%     if p4(i) == -1
%         b = b+1
%     end
% end
%  mdlx = fitcsvm(X,Y); 
%   f = @(x) -(x*mdlx.Beta(1) + mdlx.Bias)/mdlx.Beta(2);
%  x=7:0.5:8
% y = f(x);
% 
% gscatter(X(:,1),X(:,2),Y(:,1))
% hold on
% % plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% % hold off
%  f = @(x) -(x*LinearM.ClassificationSVM.Beta(1) + LinearM.ClassificationSVM.Bias)/LinearM.ClassificationSVM.Beta(2);
%  x=0:0.5:15
% y = f(x);
% 
%  gscatter(Z1(:,1),Z1(:,2),Z1(:,3))
% hold on
% plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
% hold off
% x = linspace(0,50);
% y = linspace(0,10);
% [XX,YY] = meshgrid(x,y);
% pred = [XX(:),YY(:)];
% p3 = LinearM.predictFcn(pred) ;
% 
% % Plot the data and the decision boundary
% 
% figure;
% gscatter(pred(:,1),pred(:,2),p3,'yc','.')
% hold on
% gscatter(Z1(:,1),Z1(:,2),Z1(:,3),'kb','.');
% hold off
X = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = -ones(m,1);

[m n] = size(data2);
theclass2 = ones(m,1);  
[m n] = size(data3);
theclass3 = ones(m,1);  
[m n] = size(data4);
theclass4 = ones(m,1);  
Y = [theclass1;theclass2;theclass3;theclass4];
figure('name','cumulative algorithm')
gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);

mdl = fitcsvm(X,Y);
x = 7.132:0.0005:7.14;
f = @(x) -(x*mdl.Beta(1) + mdl.Bias)/mdl.Beta(2);
y = f(x);

% plot(X(:,1),X(:,2))
gscatter(X(:,1),X(:,2),Y,['k' 'r' 'b' 'y'],['o' '+' '*' 's']);

hold on
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
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

%%
[trainedClassifier, validationAccuracy] = AB(ab);
x = linspace(0,20);
y = linspace(0,10);
[XX,YY] = meshgrid(x,y);
pred = [XX(:),YY(:)];
pab=trainedClassifier.predictFcn(pred);
gscatter(pred(:,1),pred(:,2),pab);
hold on 

f = @(x) -(x*trainedClassifier.ClassificationSVM.Beta(1) /trainedClassifier.ClassificationSVM.Beta(2)...
    + trainedClassifier.ClassificationSVM.Bias);
x = 0:0.05:40;
y =f(x)
plot(x,y,'b--','LineWidth',2,'DisplayName','Boundary')
hold off
