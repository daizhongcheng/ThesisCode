function [FAR,J_th]=MBFAR_eachsample(sys,u,t,f_parameter,indicator)
% MBFAR_eachsample: model based false alarm rate for each sample 
% Call:
%        [FAR,J_th]=MBFAR_eachsample(sys,u,t,f_parameter)
%
% Inputs:
%            sys - system 
%            u   - input data
%            t   - sample time
%            f_parameter - design parameters
% Outputs: 
%           FAR - false alarm rate 
%           J_th - max thereshold
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

%Sim_N=f_parameter.Input_data{1};
if indicator==1
   Sim_N=size(u,1);
elseif indicator==0
   Sim_N=size(u,2);
end
r=lsim(sys,u,t);

%signal morm
    for i=1:Sim_N
        r_norm(i)=r(i,:)*r(i,:)';
    end
    
    r_RMS=[];
    if f_parameter.Residual{2}(2,1)==1
       far=0;
       for i=1:Sim_N-f_parameter.Residual{2}(2,2)
           r_RMS(i)= sqrt(sum(r_norm(i:i+f_parameter.Residual{2}(2,2)-1))/f_parameter.Residual{2}(2,2));
           %%%%%%%%%%%%%%
           % FAR estimation
           if r_RMS(i) >f_parameter.FAR_estimation{1}
              far=far+1;
           end
       end  
       FAR=far/(Sim_N-f_parameter.Residual{2}(2,2))*100;
       J_th=max(r_RMS);
    end
   
    
    r_peak=[];
    if f_parameter.Residual{2}(1,1)==1
       far=0;
       for i=1:Sim_N
           %r_peak(i) = r_norm(i);
           %%%%%%%%%%%%%%
           % FAR estimation
           if sqrt(r_norm(i)) >f_parameter.FAR_estimation{1}
              far=far+1;
           end
       end
       FAR=far/Sim_N*100;
       J_th=max(r_norm);
    end

end