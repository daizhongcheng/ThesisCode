function [data data_mean inv_y_variance] = Nor_data(origin_data) 
[m,n] = size(origin_data) ;
data_mean = (mean(origin_data'))' ;
y2 = origin_data.^2 ;
inv_y_variance = diag(1./sqrt(sum(y2,2)/(n-1))) ;
data = inv_y_variance*(origin_data-data_mean) ;

end
