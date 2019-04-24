close all ;
data1 = [J_t2' dis_Rim'] ;
data2 = [J_taf' dis_Rimadd'] ;
data3 = [J_talf' dis_Rimall'] ;
data4 = [J_tmf' dis_Rimmu'] ;
train = [data1;data2;data3;data4];
[m n] = size(data1);
theclass1 = ones(m,1);% generate m numbers value 1
[m n] = size(data2);
theclass2 = -1*ones(m,1); % 
[m n] = size(data3);
theclass3 = -1*ones(m,1); % 
[m n] = size(data4);
theclass4 = -1*ones(m,1); %
group=[theclass1;theclass2;theclass3;theclass4]; %训练数据已知分类情况
                                                                            %与train顺序对应
% test=[3 2;4 8;6 5;7 6;2 5;5 2];                                                    %测试数据

%训练分类模型
svmModel = svmtrain(train,group,'kernel_function','polynomial','showplot',true);

% %分类测试
% classification=svmclassify(svmModel,test,'Showplot',true);
