function er = variance(normdata) 
[n m] = size(normdata);
data_mean = (mean(normdata'))' ;
ab = normdata - data_mean ;
ab = ab.^2;
er = sum(ab,2)/m;
end