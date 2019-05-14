function [SEN SREN]= Cumulative(EN,n)
[a b] = size(EN) ;
x = a/n ;
j = 1 ;
SEN = [] ;
SREN = [] ;
    for i = 1:x
    SEN = [SEN ; sum(EN(j:j+n-1,1:2))] ;
    j = j+n ;
    end
    
    for i = 1:a-n+1
    SREN = [SREN ; sum(EN(i:i+n-1,1:2))] ;
    end
    c = SREN(a-n+1,:) ;
    x = c(1)*ones(n-1,1);
    y = c(2)*ones(n-1,1);
    z = [x y] ;
    SREN = [SREN;z];
    SEN = SEN/n;
    SREN = SREN/n;
 end