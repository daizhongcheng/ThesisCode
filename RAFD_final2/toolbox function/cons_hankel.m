function [Uf,Yf,Up,Yp] = cons_hankel(y,u,n,k)
% cons_hankel:  this program construct hankel input output data matrix
% Call:
%          [Uf,Yf,Up,Yp] = cons_hankel(y,u,n,k)
%
% Inputs:
%              y - 
%              u - 
%              n - 
%              k - 
% Outputs:
%             Uf -
%             Yf -
%             Up -
%             Yp -
%
% Notes: NONE
%
% Required M-files: NONE
%
% Reference: NONE
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------
[p,Ndata] = size(y); [m,Ndata] = size(u); N = Ndata-2*k;
ii = 0;
for i = 1:m:2*k*m-m+1
    ii = ii+1; U(i:i+m-1,:)=u(:,ii:ii+N-1); % Data matrix
end
ii = 0;
for i = 1:p:2*k*p-p+1
    ii = ii+1;
    Y(i:i+p-1,:) = y(:,ii:ii+N-1); % data matrix
end
Uf = U(k*m+1:2*k*m,:); Yf = Y(k*p+1:2*k*p,:);
Up = U(1:k*m,:); Yp = Y(1:k*p,:); Wp = [Up;Yp];