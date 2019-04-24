function [A,B,C,D] = random_Sys_c2( N,ni,no,lamda )
%   Function 'rondom_Sys_c2' is to generate random continuous system which
%   H2-norm smaller than lamda.
%   for the method 'bounded real lemma method' celection.
%
%   Declaration about the instructions for users.
%
%   Call:
%   [A B C D] = rondom_Sys_c2( N,ni,no,lamda )
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
%   for example: rondom_Sys_c2( N ) then the default value is 
%   ni=1, no=1 and lamda=1
%
%   When there are two input variables 
%   for example: rondom_Sys_c2( N,ni ) then the default value is 
%   no=1 and lamda=1
%
%   When there are three input variables 
%   for example: rondom_Sys_c2( N,ni,no ) then the default value is 
%   lamda=1
%
%   When there are four input variables, every variable is set by user
%   but to be point out the value of 4 inputs should bigger than 0 ( N>0,ni>0,no>0,lamda>0 )
%   for example: rondom_Sys_c2( N,ni,no,lamda )
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
sp =1; %If strictly proper transfer matrix is required sp = 1


%%
% % N=6;
% % lamda = 5;

%-----------------------------Step 1
%--------------a
r1 = randn(N); % random matrix r1
U = orth(r1);

%--------------b
ksi = abs(randn(N,1)); % Absolute value
l = ksi/norm(ksi);
L = diag(l);
Z = U*L*U';
Z_inv = inv(Z);

%--------------c
ksi = randn(N*(N-1)/2,1);
ksi = ksi';
X = zeros(N,N); 
position = 1;
for i=1:N
    a1 = zeros(1,i);
    a2 = ksi( position:(position+N-i-1) );
    a = [a1 a2];
    X(i,:) = a;
    position = N-i+1;
end
X = -X' + X;
X = X / norm(X,'fro');

%--------------d
u = rand;
w = rand;
afa = 2 * lamda * w^(1/N^2) * sqrt(u);
beita = lamda * w^(1/N^2) * sqrt(1-u);

%--------------e
A = -0.5 * afa * Z + beita *X;



%-----------------------------Step 2
if sp == 1
    D = zeros(no,ni);
else
    D = randn(no,ni);
    D = D / norm(D,2) * gamma;
end

%-----------------------------Step 3
Y1 = randn(N,no+ni);
Y1 = Y1 / norm(Y1,'fro');

if sp == 1
    alpha = sqrt(gamma)*eye(no+ni);
else
    r2 = diag(randn(ni+no,1)); % random matrix r2
    r3 = orth(randn(ni+no,ni+no)); % random matrix r3
    alpha = r3' * r2 * r3;
end


alpha_inv = inv(alpha);
W = (1/afa) * alpha_inv * (Y1'*Z_inv*Y1)* alpha_inv;
w = rand;
z = w^( 1/(N*(ni+no)) );
r = z / sqrt( max(eig(W)) );
Y = r * Y1;
B = Y(:,1:ni);
C = Y(:,(ni+1):(ni+no));
C = C';


end
