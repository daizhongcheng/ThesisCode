n = 15000;
m = 3;
a = 0.95;
jth = m*(n^2-1)/(n*(n-m))*finv(a,m,n-m)
%% free degree m
 x = chi2inv(0.96,3)