function [SREN]= SlideWeight(OrData,Wh,n)
SREN = [];
[a b] = size(OrData) ;

    for i = 1:a-n+1
    SREN = [SREN ; sum(Wh*OrData(i:i+n-1,1:2))] ;
    end
    SREN = SREN/n
end