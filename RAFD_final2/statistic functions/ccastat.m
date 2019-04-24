function [P,P_res, L,L_res,Omega,n_o,S] = ccastat(Y_tr,U_tr)

% CCA calculate canonical correlations
%
% [U, S, V, P, L] = cca(Y_raw,U_raw) where P and L contains the canonical correlation
% matrices as columns and S is a matrix with corresponding canonical
% correlations. The correlations are sorted in descending order. Y_raw and
% U_raw are matrices where each column is a sample. Hence, Y_raw and X_raw must have
% the same number of columns.
%
% Example: If Y is M*K and U_raw is L*K there are rank=MIN(M,L) solutions. U is
% then M*M, V is L*L and S is M*L. P is M*rank, L is L*rank.
%
%
% © 2014 Zhiwen Chen, Duisburg-Essen universitet

% --- Calculate covariance matrices ---

[l,n_s]=size(U_tr);[m,~]=size(Y_tr);

%%
%CVA decomposition
[U,S,V]=svd((Y_tr*Y_tr')^(-0.5)*(Y_tr*U_tr')*(U_tr*U_tr')^(-0.5));
%%%%%%%%%%%%%%%%%%%%%%%% Determine the order 
n_o = rank(S);
% for i=1:size(S,2)
%     if sum(sum(S(1:i,1:i)))/sum(sum(S))>0.8
%         n_o=i;
%         break
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Get L,P,X,Q,Omega,X
P=(Y_tr*Y_tr')^(-0.5)*U(:,1:n_o);
P_res = (Y_tr*Y_tr')^(-0.5)*U(:,n_o+1:end);
L=(U_tr*U_tr')^(-0.5)*V(:,1:n_o);
L_res=(U_tr*U_tr')^(-0.5)*V(:,n_o+1:end);
Omega=S(1:n_o,1:n_o);