close all ;
data1 = [J_t2' dis_Rim'] ;
data2 = [J_taf' dis_Rimadd'] ;
data3 = [J_tmf' dis_Rimmu'] ;
data4 = [J_talf' dis_Rimall'] ;

X = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = ones(m,1);% generate m numbers value 1
[m n] = size(data2);
theclass2 = 2*ones(m,1); % 
[m n] = size(data3);
theclass3 = 3*ones(m,1); % 
[m n] = size(data4);
theclass4 = 4*ones(m,1); %
Y = [theclass1;theclass2;theclass3;theclass4];
figure
gscatter(X(:,1),X(:,2),Y,['b' 'r' 'g' 'k']);
h = gca;
lims = [h.XLim h.YLim]; % Extract the x and y axis limits
title('{\bf Scatter Diagram of Iris Measurements}');
xlabel('Petal Length (cm)');
ylabel('Petal Width (cm)');
legend('Location','Northwest');