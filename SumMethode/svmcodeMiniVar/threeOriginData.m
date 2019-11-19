load normdata.mat;
load addfault_data.mat;
load multifault_data.mat;
load allfault_data.mat;
load miniF.mat;
load data1;
load data2;
load data3;
load data4;
load data5;
tdata = [data1;data2;data3;data4;data5];
Odata = [normdata addfault_data multifault_data allfault_data miniF];
plot(Odata(1,:))
hold on
plot(Odata(2,:))
plot(Odata(3,:))
hold off
figure
hold on
plot(tdata(:,1))
x = 0:0.5:15000;
y = 7.8181*ones(1,30001);
plot(x,y)
hold off
