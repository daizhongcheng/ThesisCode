close all;
load matdata/J_N_data;
load matdata/J_N_addfault_data;
load matdata/J_mulfault_data;
load matdata/J_allfault_data;
load matdata/dis_Rim;
load matdata/A_dis_Rim;
load matdata/M_dis_Rim;
load matdata/AM_dis_Rim;
load matdata/J_miniF;
load matdata/R_miniF;

n1 = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% let the data be 2 dimension
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EN = [J_N_data' dis_Rim'] ;             %normal data
EA = [J_N_addfault_data' A_dis_Rim'] ;  %additive fault data
EM = [J_mulfault_data' M_dis_Rim'] ;    %multiplicative fault data
EAL = [J_allfault_data' AM_dis_Rim'] ;  %additive and multiplicative fault data
Emini = [J_miniF' R_miniF'] ;           %mini variance multipicative fault data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% original 2 dimension data, data label process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] =size(EN);
theclass1 = -ones(m,1);
[m n] =size(EA);
theclass2=ones(m,1);
[m n] = size(EM);
theclass3 = 2*ones(m,1);
[m n] = size(EAL);
theclass4 = 3*ones(m,1);
[m n] = size(Emini);
theclass5 = 4*ones(m,1);
Ori = [EN;EA;EM;EAL;Emini] ;
labelOri= [theclass1;theclass2;theclass3;theclass4;theclass5];
featureOri = [theclass1;theclass2;theclass3/2;theclass4/3;theclass5/4]; 
xO = Ori;
yOf = featureOri;
yOl = labelOri;
%%%%%%%%%%%%%%%%%%%%%
% data1-data5:every n1 sample as the new data group
% Sd***:expand the data group to the original dimension
% Sr***: slide window
%%%%%%%%%%%%%%%%%%%%%
[data1 SdEN      SrEN] = Cumulative(EN,n1) ;
[data2 SdEA      SrEA] = Cumulative(EA,n1) ;
[data3 SdEM      SrEM] = Cumulative(EM,n1) ;
[data4 SdEAL    SrEAL] = Cumulative(EAL,n1) ;
[data5 Sdmini  Srmini] = Cumulative(Emini,n1) ;
%%%%%%%%%%%%%%%%%%%%%
%data1-data5 lable process
%%%%%%%%%%%%%%%%%%%%%
[m n] =size(data1);
theclass1 = -ones(m,1);
[m n] =size(data2);
theclass2=ones(m,1);
[m n] = size(data3);
theclass3 = 2*ones(m,1);
[m n] = size(data4);
theclass4 = 3*ones(m,1);
[m n] = size(data5);
theclass5 = 4*ones(m,1);
dataAll = [data1;data2;data3;data4;data5] ;
labelData = [theclass1;theclass2;theclass3;theclass4;theclass5];
featureData = [theclass1;theclass2;theclass3/2;theclass4/3;theclass5/4]; 
xD = dataAll;
yDl = labelData;
yDf = featureData;

xd = [data1;data2;data3;data4];
ydl = [theclass1;theclass2;theclass3;theclass4];
ydf = [theclass1;theclass2;theclass3/2;theclass4/3];

%%%%%%%%%%%%%%%%%%%%%%
%Sd*** label process
% SdEN   SdEA    SdEM    SdEAL   Sdmini 
%%%%%%%%%%%%%%%%%%%%%%

[m n] =size(SdEN);
theclass1 = -ones(m,1);
[m n] =size(SdEA);
theclass2=ones(m,1);
[m n] = size(SdEM);
theclass3 = 2*ones(m,1);
[m n] = size(SdEAL);
theclass4 = 3*ones(m,1);
[m n] = size(Sdmini);
theclass5 = 4*ones(m,1);
SdAll = [SdEN;SdEA;SdEM;SdEAL;Sdmini] ;
labelSd = [theclass1;theclass2;theclass3;theclass4;theclass5];
featureSd = [theclass1;theclass2;theclass3/2;theclass4/3;theclass5/4]; 
xSd = SdAll;
ySdl = labelSd;
ySdf = featureSd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   SrEN
%   SrEA
%   SrEM
%  SrEAL
% Srmini
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m n] =size(SrEN);
theclass1 = -ones(m,1);
[m n] =size(SrEA);
theclass2=ones(m,1);
[m n] = size(SrEM);
theclass3 = 2*ones(m,1);
[m n] = size(SrEAL);
theclass4 = 3*ones(m,1);
[m n] = size(Srmini);
theclass5 = 4*ones(m,1);
SrAll = [SrEN;SrEA;SrEM;SrEAL;Srmini] ;
labelSr = [theclass1;theclass2;theclass3;theclass4;theclass5];
featureSr = [theclass1;theclass2;theclass3/2;theclass4/3;theclass5/4]; 
xSr = SrAll;
ySrl = labelSr;
ySrf = featureSr;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%xO   xD    xSd   xSr  
%yOl  yDl   ySdl  ySrl 
%yOf  yDf   ySdf  ySrf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','original data') 
gscatter(xO(:,1),xO(:,2),yOl,['k' 'r' 'b' 'y' 'c'],['o' '+' '*' 's']); 
hold on 


figure('name',' data') 
gscatter(xD(:,1),xD(:,2),yDl,['k' 'r' 'b' 'y' 'c'],['o' '+' '*' 's']); 


figure('name',' Sd data') 
gscatter(xSd(:,1),xSd(:,2),ySdl,['k' 'r' 'b' 'y' 'c'],['o' '+' '*' 's']); 

figure('name',' Sr data') 
gscatter(xSr(:,1),xSr(:,2),ySrl,['k' 'r' 'b' 'y' 'c'],['o' '+' '*' 's']); 
hold off

