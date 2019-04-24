function [A,B,C,D] = random_Sys_d2( N,ni,no,lamda )
%   Function 'rondom_Sys_d2' is to generate random discrete system which
%   H2-norm smaller than lamda.
%
%   for the method 'bounded real lemma method' celection.
%
%   Declaration about the instructions for users.
%
%   Call:
%   [A B C D] = rondom_Sys_d( N,ni,no,lamda )
%
%   Inputs: [ N,ni,no,lamda ]
%   N           - the oder of the random system 
%   ni          - the number of the inputs
%   no          - the number of the outputs  
%   lamda       - the upper bound of the H2-norm of the random system
%
%   Outputs:  [A B C D]
%   A           - system matrix, a N-by-N matrix 
%   B           - input matrix, a N-by-ni matrix 
%   C           - output matrix, a no-by-N matrix
%   D           - feedthrough matrix, a no-by-ni matrix
%   The number of input variables can be 1,2,3 or 4
%
%   When just a input variable  
%   for example: rondom_Sys_d2( N ) then the default value is 
%   ni=1, no=1 and lamda=1
%
%   When there are two input variables 
%   for example: rondom_Sys_d2( N,ni ) then the default value is 
%   no=1 and lamda=1
%
%   When there are three input variables 
%   for example: rondom_Sys_d2( N,ni,no ) then the default value is 
%   lamda=1
%
%   When there are four input variables, every variable is set by user
%   but to be point out the value of 4 inputs should bigger than 0 ( N>0,ni>0,no>0,lamda>0 )
%   for example: rondom_Sys_d2( N,ni,no,lamda )
%
%
%   Version 1.1
%
%   The function is eidt by Peifeng LIU


if nargin<4
    lamda = 1;
end 
if nargin<3
    no = 1;
end 
if nargin<2
    ni = 1;
end 


% % lamda = 1;
gamma = 1;
%sp =1; %If strictly proper transfer matrix is required sp = 1


%-----------------------------Step 1
%--------------a
% Z = randn(N); % random matrix Z
% Z = Z/norm(Z);
% Z_inv = inv(Z);
% Z1 = Z'*Z;
% % norm2z1=max(eig(Z1));
% % norm_2_z1=[norm_2_z1,norm2z1];
% w = rand;
% alpha = w^( 1/ (N^2) );
% scale_w=[scale_w,w];
% AT_A = -alpha * Z1 + eye(N); 
% 
% A = chol(AT_A); % R = chol(A) produces an upper triangular R so that R'*R = A.
% norm2z1=max(eig(A));
% norm_2_z1=[norm_2_z1,norm2z1];

%%
r1 = randn(N); % random matrix r1
U = orth(r1);

ksi = abs(randn(N,1));
l = ksi/max(ksi);
L = diag(l);
A = U*L*U';
w = rand;
alpha = w^( 1/ (N^2) );
A=alpha*A;
%%

Z = randn(N);
[U,S,V] = svd(Z);
A = U* A * V';
% norm2z1=min(eig(A));
% norm_2_z1=[norm_2_z1,norm2z1];


%-----------------------------Step 2
%if sp == 1
%    D = zeros(no,ni);
%else
    D = randn(no,ni);
    D = D / norm(D,2) * gamma;
%end

%-----------------------------Step 3
B_tilda = randn(N,ni);
C_tilda_t = randn(N,no);
Y1 = [B_tilda zeros(N,no); zeros(N,ni) C_tilda_t];
Y1 = Y1 / norm(Y1); %,'fro');

%if sp == 1
%    alpha = sqrt(gamma)*eye(no+ni);
%else
    r2 = diag(randn(ni+no,1)); % random matrix r2
    r3 = orth(randn(ni+no,ni+no)); % random matrix r3
    alpha = r3' * r2 * r3;
%end

X = [-eye(N) A; A' -eye(N)];
X_inv = inv(X);
alpha_inv = inv(alpha);
W = -alpha_inv * (Y1'*X_inv*Y1)* alpha_inv;
w = rand;
z = w^( 1/(N*(ni+no)) );
r = z / sqrt( max(eig(W)) );
Y = r * Y1;
B = Y(1:N,1:ni);
C = Y( (N+1):2*N , (ni+1):(ni+no) );
C = C';




end
