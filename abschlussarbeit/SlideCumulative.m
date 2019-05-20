function [SREN]= SlideCumulative(EN,nSh,n)
[a b] = size(EN) ;
x = a/n ;
j = 1 ;

SREN = [];
c = nSh ;
    x = c(1)*ones(n-1,1);
    y = c(2)*ones(n-1,1);
    z = [x y] ;

    for i = 1:a-n+1
    SREN = [SREN ; sum(EN(i:i+n-1,1:2))] ;
    end
    
    
    SREN = [z,SREN];
  
    SREN = SREN/n;
   
 end