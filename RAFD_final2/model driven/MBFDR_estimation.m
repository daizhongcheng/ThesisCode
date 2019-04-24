function [FDR,MT2FD]=MBFDR_estimation(sys,u,t,f_parameter,k_stop)
% MBFDR_eachsample: model based fault detection for each sample 
% Call:
%        [FAR,J_th]=MBFDR_eachsample(sys,u,t,f_parameter)
%
% Inputs:
%            sys - system 
%            u   - input data
%            t   - sample time
%            f_parameter - design parameters
%            k_stop - max. detection sample
% Outputs: 
%           FDR - fault detection rate 
%           MT2FD - mean time to fault detection calculation auxiliary
%                    index
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

%% -------------------------------------------------------------------------

Sim_N=size(u,1);
r=lsim(sys,u,t);

%k_stop=100;

% choose the threshold
if f_parameter.Threshold_chosen(1)==1
    jth=f_parameter.FAR_estimation{1};
elseif f_parameter.Threshold_chosen(2)==1
    jth=f_parameter.Result_mbFAR{2};
end


%signal morm
for i=1:Sim_N % given L or kalman L
    r_norm(i)=r(i,:)*r(i,:)';
end



    r_RMS=[];
    if f_parameter.Residual{2}(2,1)==1
       fdr=0;
       for i=1:Sim_N
           if i < f_parameter.Residual{2}(2,2)
              r_RMS(i)= sqrt(sum(r_norm(1:i))/i);
           else 
              r_RMS(i)= sqrt(sum(r_norm(i+f_parameter.Residual{2}(2,2)+1:i))/f_parameter.Residual{2}(2,2));
           end
           %%%%%%%%%%%%%%
           % FDR estimation
           if r_RMS(i) > jth
              fdr=fdr+1;
           end
       end  
       FDR=fdr/Sim_N;
       
       % MT2FD estimation
           %index=[];
           %MT2FD=zeros(k_stop+1,1);
           %index =find(r_RMS>jth);
           %if min(size(index))==0
           %   index(1)= k_stop+1;
           %elseif index(1)> k_stop
           %   index(1)= k_stop+1;
           %end
           %MT2FD(index(1)) = MT2FD(index(1))+ 1;
       index=[];
       index =find(r_RMS>jth);
       if min(size(index))==0
          MT2FD = k_stop+1;
       elseif index(1)> k_stop
          MT2FD = k_stop+1;
       else
          MT2FD = index(1);
       end
    end
   
    
    r_peak=[];
    if f_parameter.Residual{2}(1,1)==1
       fdr=0;
       for i=1:Sim_N
           %r_peak(i) = r_norm(i);
           %%%%%%%%%%%%%%
           % FDR estimation
           if sqrt(r_norm(i)) > jth
              fdr=fdr+1;
           end
       end
       FDR=fdr/Sim_N;
       
       % MT2FD estimation
           %index=[];
           %MT2FD=zeros(k_stop+1,1);
           %index=find(r_norm >jth);
           %if min(size(index))==0
           %   index(1)= k_stop+1;
           %elseif index(1)> k_stop
           %   index(1)= k_stop+1;
           %end
           %MT2FD(index(1)) = MT2FD(index(1))+ 1;
       index=[];
       index =find(r_norm>jth);
       if min(size(index))==0
          MT2FD = k_stop+1;
       elseif index(1)> k_stop
          MT2FD = k_stop+1;
       else
          MT2FD = index(1);
       end
   end
    
end