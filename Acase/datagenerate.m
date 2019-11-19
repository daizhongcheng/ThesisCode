
    Xy = [
            2 0.5 0.4;
          0.5   1 0.3;
          0.4 0.3 0.5
         ]
    Xys = [
            2 0.5 0.4;
          0.5   1 0.3;
          0.4 0.3 0.2
         ]
     Xyl = [
            2 0.5 0.4;
          0.5   1 0.3;
          0.4 0.3 5
         ]
     R = randn(3,1);
     cXy  = chol(Xy);
     Dxy=cXy*R+[1 0 0;0 1 0;0 0 1]*ones(3,1000);
     cXys = chol(Xys);
     Dxys = cXys*R+[1 0 0;0 1 0;0 0 1]*ones(3,1000);
     cXyl = chol(Xyl);
     Dxyl = cXyl*R+[1 0 0;0 1 0;0 0 1]*ones(3,1000);
     [N_data data_mean y_variance] = Nor_data(Dxy) ;
     sigma_y = N_data*N_data'/(1000-1);
     inv_Sigma_y = inv(sigma_y) ;
     Jn = T_evaluation(N_data,inv_Sigma_y) ;
     Js = y_variance*(Dxys - data_mean) ;
     Jds = T_evaluation(Js,inv_Sigma_y) ;
     
     Jl = y_variance*(Dxyl - data_mean) ;
     Jdl = T_evaluation(Jl,inv_Sigma_y) ;
     x = 1:1:3000
     y = [Jn Jds Jdl]
     plot(x,y)
     hold on
n = 1000;
m = 3;
a = 0.95;
jth = m*(n^2-1)/(n*(n-m))*finv(a,m,n-m)
y1 = jth*ones(3000,1)
plot(x,y1)
hold off
x1=1:1:1000
plot(x1,Dxy)

