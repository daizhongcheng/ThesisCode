clc
clear all
format long       % set Output format

% set initial value of three tank system 
As=154; Sn=0.5; g=980; az1=0.46; az2=0.6; az3=0.45;
F=1; % sensor fault
s1=30; % set 
s2=30;
a11=-0.01;
a22=-0.01;
v1=1.13;v2=1.13;
delt_T=0.1; %线性化时的系统仿真步长
Q1=37; Q2=28; %系统线性化的工作
Q=[Q1 Q2]';  %正常工作点
Q1u=[];%CONTROL
Q2u=[];
Q20=[];%out
%h0 = [ 50.934981871911020, 23.943763956328834,  37.734616288703009 ]';%45,15,30
h0=[45,15,30]';%[23.255161689811242,   21.751272055926734,  22.290738301923536]';
h(:,1)=h0;
y(:,1) = h(1:2,1);
t(1,1)=delt_T;
Qf=zeros(3,1);
w1 = 0.01; w2 = 0.01; w3 = 0.01;
v = 0.1;

%%% initial conditions of the IPF
%%%%%%%%%%%%%%%%%%%%%%

N_max=500; %%定义系统的仿真次数
for n=2:N_max
    t(1,n)=n*delt_T;
    %%%%%% system 
    %%%%%% additional fault
    fault_sensor = 0.0;
    zerofault=1;%faultfree=1,fault=0
   if F>0
    if F==1
    if n>(N_max/2)
       fault_sensor = 20.0;
    end
    if n>(3*N_max/5)
       fault_sensor =0;
    end
    end
    if F==2
    if n>(N_max/2)
       fault_sensor = (n-(N_max/2))*0.3;
    end
    if n>(3*N_max/5)
       fault_sensor =0;
    end
    end
    if F==3
    if n>(N_max/2)
       zerofault=0;
    end
    if n>(3*N_max/5)
       zerofault=1;
    end
    end
   end
    %%%%%%%%%%%%%%%%%%%%%%%%
    Q13=az1*Sn*sign(h(1,n-1)-h(3,n-1))*sqrt(2*g*abs(h(1,n-1)-h(3,n-1)));
    Q32=az3*Sn*sign(h(3,n-1)-h(2,n-1))*sqrt(2*g*abs(h(3,n-1)-h(2,n-1)));
    Q20(n)=az2*Sn*sqrt(2*g*h(2,n-1));
    Q1u(n)=Q13+As*(a11*y(1,n-1)+v1*(s1-y(1,n-1)));%feedback control
    Q2u(n)=Q20(n)-Q32+As*(a22*y(2,n-1)+v2*(s2-y(2,n-1)));
    dh(1)=(-Q13+Q1u(n)-Qf(1))/As + randn*sqrt(w1);
    dh(2)=(Q32-Q20(n)+Q2u(n)-Qf(2))/As + randn*sqrt(w2);
    dh(3)=(Q13-Q32-Qf(3))/As + randn*sqrt(w3);
    K=dh';
    h(:,n)=h(:,n-1)+delt_T*K;
    y(:,n) = [h(1,n) +  sqrt(v)*randn; zerofault*(h(2,n) +  sqrt(v)*randn + fault_sensor)];
    

    
%%%%%  dynamical figure  %%%%%%%%%%%%
end
figure
plot(t(1,:),y(1,:),'r-',t(1,:),y(2,:),'b-', t(1,:),h(3,:),'g-',t(1,:),h(2,:),'y')
legend('y1','y2','h3','h2')
title('h1,h2,h3的变化曲线');
% legend('h1','h2','h3');
xlabel('仿真时间/s（步长是0.01秒）','FontWeight','bold');
ylabel('液位/cm','FontWeight','bold');

%save threetankfaultfree.mat h y Q1u Q2u Q20
save threetankfault1.mat h y Q1u Q2u Q20




