function [SEN SDEN SREN]= Cumulative(EN,n)
[a b] = size(EN) ;
x = a/n ;
j = 1 ;
SEN = [] ;
SDEN = [] ;
SREN = [] ;
    for i = 1:x
    Sum_J = sum(EN(j:j+n-1,1:2)) ;
    SEN = [SEN ; Sum_J] ;
    c = [Sum_J(1)*ones(n,1) Sum_J(2)*ones(n,1)];
    SDEN = [SDEN;c] ;
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
    SDEN = SDEN/n;
end
 