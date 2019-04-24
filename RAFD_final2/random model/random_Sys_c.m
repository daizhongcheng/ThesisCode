function [A,B,C,D] = random_Sys_c( N,ni,no,lamda)
%   Function 'rondom_Sys_c' is to generate random continuous system which
%   is also norm-bounded by lamda.
%
%   for pole placement method
%
%   Declaration about the instructions for users.
%
%   Call:
%   [A B C D] = rondom_Sys_c( N,ni,no,lamda )
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
%   for example: rondom_Sys_c( N ) then the default value is 
%   ni=1, no=1 and lamda=1
%
%   When there are two input variables 
%   for example: rondom_Sys_c( N,ni ) then the default value is 
%   no=1 and lamda=1
%
%   When there are three input variables 
%   for example: rondom_Sys_c( N,ni,no ) then the default value is 
%   lamda=1
%
%   When there are four input variables, every variable is set by user
%   but to be point out the value of 4 inputs should bigger than 0 ( N>0,ni>0,no>0,lamda>0 )
%   for example: rondom_Sys_c( N,ni,no,lamda )
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
%gamma = 1;
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
% % N=6;
% % lamda = 5;

r1 = rand(N); % random matrix r1
U = orth(r1);


% eigen vaule must be real or conjugate complex number
l = zeros(N,1);

if mod(N,2) == 0
    for i = 1:1:(N/2)
        l(i) = -abs(randn) + randn*1j;
        l(N-i+1) = conj(l(i));
    end
else
    for i = 1:1:((N-1)/2)
        l(i) = -abs(randn) + randn*1j;
        l(N-i+1) = conj(l(i));
    end
    l(round(N/2))=-abs(randn);
end
        
L = diag(l);
A = U*L*U';
% % w = rand;
% % alpha = w^( 1/ (N^2) );
%%
% % 
% % Z = randn(N);
% % [U,S,V] = svd(Z);
% % A = U* A * V';
A = A/norm(A)*rand*lamda;
% norm2z1=min(eig(A));
% norm_2_z1=[norm_2_z1,norm2z1];


%-----------------------------Step 2
% % % no = 1; ni = 1; N=3;

B = randn([N,ni]);
C = randn([no,N]);
D = randn([no,ni]);
bnz = (rand(size(B))<0.75);      % mask for nonzero entries in B
zerob = all(all(~bnz,1),2);      % resulting zero B matrices
B = B .* (bnz+repmat(zerob,[N ni]));
cnz = (rand(size(C))<0.75);
zeroc = all(all(~cnz,1),2);
C = C .* (cnz+repmat(zeroc,[no N]));
D = D .* (rand(size(D))<0.5);


end
