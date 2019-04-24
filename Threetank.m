%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Matlab 3-Tank System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

Task9=0;

%--------------------------------------------------------------------------
% system parameters:
%--------------------------------------------------------------------------
A     = 0.0154;   %m^2
Sn    = 0.00005;  %m^2
Hmax  = 0.62;     %m
Q1max = 0.0001;   %m^3/sec
Q2max = 0.0001;   %ltr/sec
az1   = 0.46;     %1
az2   = 0.60;     %1
az3   = 0.45;     %1
g     = 9.81;     %m/s^2

%--------------------------------------------------------------------------
% nonlinear system:
%--------------------------------------------------------------------------
syms f1 f2 f3 h1 h2 h3 Q1 Q2 t1 t2 t3 t4 t5 t6

f1=1/A*(Q1-az1*Sn*sqrt(2*g*(h1-h3))-t1*sqrt(2*g*h1)+t4*az1*Sn*sqrt(2*g*(h1-h3)));
f2=1/A*(Q2+az3*Sn*sqrt(2*g*(h3-h2))-az2*Sn*sqrt(2*g*h2)-t2*sqrt(2*g*h2)-t6*az3*Sn*sqrt(2*g*(h3-h2))+t5*az2*Sn*sqrt(2*g*h2));
f3=1/A*(az1*Sn*sqrt(2*g*(h1-h3))-az3*Sn*sqrt(2*g*(h3-h2))-t3*sqrt(2*g*h3)-t4*az1*Sn*sqrt(2*g*(h1-h3))+t6*az3*Sn*sqrt(2*g*(h3-h2)));

%--------------------------------------------------------------------------
% linearization
%--------------------------------------------------------------------------
a11=diff(f1,h1);a12=diff(f1,h2);a13=diff(f1,h3);a21=diff(f2,h1);a22=diff(f2,h2);
a23=diff(f2,h3);a31=diff(f3,h1);a32=diff(f3,h2);a33=diff(f3,h3);

b11=diff(f1,Q1);b12=diff(f1,Q2);b21=diff(f2,Q1);
b22=diff(f2,Q2);b31=diff(f3,Q1);b32=diff(f3,Q2);

h1=0.45;        %m  it must be: x10>x30>x20 for idle state
h2=0.15;        %m
h3=0.30;        %m

t1=0;t2=0;t3=0;t4=0;t5=0;t6=0;

%nominal model
A=[eval(a11),eval(a12),eval(a13);eval(a21),eval(a22),eval(a23);eval(a31),eval(a32),eval(a33)];
B=[eval(b11),eval(b12);eval(b21),eval(b22);eval(b31),eval(b32)];
C=eye(3);
D=zeros(3,2);

%faulty model
syms t1 t2 t3 t4 t5 t6
DA1 = [eval(diff(a11,t1)),0,0;0,0,0;0,0,0];
DA2 = [0,0,0;0,eval(diff(a22,t2)),0;0,0,0];
DA3 = [0,0,0;0,0,0;0,0,eval(diff(a33,t3))];
DA4 = [eval(diff(a11,t4)),0,eval(diff(a13,t4));0,0,0;eval(diff(a31,t4)),0,eval(diff(a33,t4))];
DA5 = [0,0,0;0,eval(diff(a22,t5)),0;0,0,0];
DA6 = [0,0,0;0,eval(diff(a22,t6)),eval(diff(a23,t6));0,eval(diff(a32,t6)),eval(diff(a33,t6))];

Ef = [zeros(3,3),B];            % influence of actuator faults
Ff = [eye(3),zeros(3,2)];       % influence of sensor faults
Ed = zeros(3,2);                % disturbance on states
Fd = [1,0;0,1;0,0];             % disturbance on sensors

sys=ss(A,B,C,D);

% fault detection filter design
L_FDF=place(A',C',[1.5*eig(A)])';

% discretization
sysd=c2d(sys,0.03,'zoh');

Ef_d = [zeros(3,3),sysd.b];
Ff_d = [eye(3),zeros(3,2)];

Ed_d = zeros(3,3);
Fd_d = eye(3);

% Parity Space approach

s=1; %s >= sigma_min

% compute Hos
Hos = [];
for i = 0:s
    Hos = [Hos ; sysd.C * sysd.A^i];
end

% compute Hus
[r,c]=size(sysd.C*sysd.B);
Hus = sysd.D;
for i = 1:s
    Hus = [Hus,zeros(i*r,c)];
    help=[];
    for k = 1:i
        help = [help , sysd.C * sysd.A^(k-i) * sysd.B];
    end
    help = [help, sysd.D];
    Hus = [Hus;help];
end
 
% compute Hfs
[r,c]=size(Ff);
Hfs = Ff;
for i = 1:s
    Hfs = [Hfs,zeros(i*r,c)];
    help=[];
    for k = 1:i
        help = [help , sysd.C * sysd.A^(k-i) * Ef];
    end
    help = [help, Ff];
    Hfs = [Hfs;help];
end

% compute Hds
[r,c]=size(Fd);
Hds = Fd;
for i = 1:s
    Hds = [Hds,zeros(i*r,c)];
    help=[];
    for k = 1:i
        help = [help , sysd.C * sysd.A^(k-i) * Ed];
    end
    help = [help, Fd];
    Hds = [Hds;help];
end

% compute the left Nullspace of Hos and build parity vector
N = null(Hos')';
vs = [1 2 3]*N;

% check if PUID possible
if rank([Hfs Hos Hds])>rank([Hos Hds])
    disp('PUID possible')
else
    disp('PUID impossible')
end

% calculate DO from parity vector (for s=1)
if s==1
   vs0 = vs(1:3);
   vs1 = vs(4:6);
   G=0;
   H=vs1*sysd.c*sysd.b;
   Q=[0,0];
   L=-vs0;
   W=1;
   V=vs1;
end

% norm based evaluation (Task9)
if Task9
    FAR = 0.0; %choose [0...1]
    MDR = 0.0; %choose [0...1]
    delta_d = 0.1;

    Ed_d = [0.1 0;0,0.1;0,0];
    Fd_d = zeros(3,2);

    if s==1
       Gn=0.1;
       Hn=(vs0+G*vs1)*sysd.d;
       Qn=[0,0];
       Ln=-vs0-Gn*vs1;
       Wn=1;
       Vn=vs1;
       Tn = vs1;
    end

    %steady state transfer function.
    B_tilde = [Tn*Ed_d-Ln*Fd_d,Tn*Ef_d-Ln*Ff_d];
    Bd=[Tn*Ed_d-Ln*Fd_d];
    Bf=[Tn*Ef_d-Ln*Ff_d];
    D_tilde = [Wn*Vn*Fd_d,Wn*Vn*Ff_d];
    Dd=[Wn*Vn*Fd_d];
    Df=[Wn*Vn*Ff_d];
    
    Wo = gram(ss(Gn,Bd,W,Dd,0.03),'o');
    gamma = sqrt(Bd'*Wo*Bd);
    gamma = norm(gamma);
    
    Jth = (1-FAR) * gamma * delta_d;
    
    
    %in the special case that only one fault occurs simultanously:
    %xi_special = abs(min(steadyAmpl(3:end)));
    %xi_special = min(abs(steadyAmpl(3:end)));
    
    %delta_fmin_special = Jth*(1-MDR)/xi_special
    
end