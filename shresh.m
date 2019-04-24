n = 300;
m = 5;
a = 0.95;
jth = m*(n^2-1)/(n*(n-m))*finv(a,m,n-m);
%% 自由度m
 x = chi2inv(0.95,3)