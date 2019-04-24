function [fault_f,Pro_f] = fault_data_gen_save(f_parameter,c_parameter,Sample_Size,k_stop,Ts)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %%%%%%%%%% this is a function to genereate fault data, based on the fault 
 %%%%%%%%%% design parameters saved in the 'f_parameter', 'k_stop' and Ts. 
 %%%%%%%%%% this function is used for the selection of save fault data. 
 %%%%%%%%%% it is used for to generate the fault data, which is not added to the
 %%%%%%%%%% original data yet.
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Call:
%         [fault_f,Pro_f] = fault_data_gen_save(f_parameter,k_stop)
% 
% Inputs: 
%         f_parameter-       generate fault parameters
%         k_stop -           stop time     
%         Ts-                sample time
%         
% Outputs:
%          fault_f: the value of each kind combination of each fault
%          Pro_f: the probability of each kind combination of each fault
%         
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
%% Initialization
% if the custom use GUI to generate fault model
if c_parameter.Choice(5,3)==1 
   faultnumber = size(f_parameter.Fault_Pattern,2); % depending on fault pattern to see how many faults exists
   Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
   Cause_Nr = f_parameter.Cause_Nr; % get the cause number of each fault
   Fault_function = f_parameter.Fault_function; % get the fault function of each cause
   Fault_range = f_parameter.Fault_range; % get the defined fault range of each cause
   Hidden_pro = f_parameter.Hidden_pro; % get the hidden probability matrix
   
% if the custom load fault model    
elseif c_parameter.Choice(5,1)==1
   faultnumber = size(c_parameter.Fault_Pattern,2); % depending on fault pattern to see how many faults exists
   Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
   Cause_Nr = c_parameter.Cause_Nr; % get the cause number of each fault
   Fault_function = c_parameter.Fault_function; % get the fault function of each cause
   Fault_range = c_parameter.Fault_range; % get the defined fault range of each cause
   Hidden_pro = c_parameter.Hidden_pro; % get the hidden probability matrix 
else 
    disp('Error. Please generate or upload fault model.')
    return
end
 

%% generate fault data
    for fault_number=1:faultnumber  % most outside cycle, each fault,
        if any(Fault_Pattern(:,fault_number))% to check if the fault exists, exist: 1 no exist: 0
           for cause_number=1:Cause_Nr(fault_number) % each fault has at most 3 causes of fault
               fault_hidden={};
               fault_kind=find(Fault_function(cause_number,:,fault_number)~=0); % find the position of existing fault form
               if isempty(fault_kind)==0 % fault_kind is not empty 
                  cell_number=1;
               for k_kind=1:length(fault_kind)      
                   if fault_kind(k_kind)==1
                      theta1=Fault_range(cause_number,1,fault_number)+(Fault_range(cause_number,2,fault_number)-...
                             Fault_range(cause_number,1,fault_number))*rand(Sample_Size,1);
                      for t=0:Ts:(k_stop-1)*Ts
                          fault_constant(:,fix(t/Ts+1))=theta1;
                      end
                      fault_hidden{cell_number}=fault_constant; % constant fault
                      cell_number=cell_number+1;
                   end
                   if fault_kind(k_kind)==2
                      theta2=Fault_range(cause_number,3,fault_number)+(Fault_range(cause_number,3,fault_number)-...
                             Fault_range(cause_number,4,fault_number))*rand(Sample_Size,1);
                      for t=0:Ts:(k_stop-1)*Ts
                          fault_ramp(:,fix(t/Ts+1))=theta2*t;
                      end
                      fault_hidden{cell_number}=fault_ramp; % ramp fault
                      cell_number=cell_number+1;
                   end
                   if fault_kind(k_kind)==3
                      theta3=Fault_range(cause_number,5,fault_number)+(Fault_range(cause_number,5,fault_number)-...
                             Fault_range(cause_number,6,fault_number))*rand(Sample_Size,1);
                      for t=0:Ts:(k_stop-1)*Ts
                          fault_exponential(:,fix(t/Ts+1))=1-exp(theta3*t);
                      end
                      fault_hidden{cell_number}=fault_exponential; % exponential fault
                   end
               end
               %%save fault, consider hidden layer, if two kinds of
               %%fault exist. then the third one is the combination of
               %%both
               if length(fault_kind)>1
                  fault_hidden{3}=fault_hidden{1}+fault_hidden{2}; % till now, fault{1} is for the first fault kind, fault{2} is for the second fault kind. fault{3} is the combination of them
               end
               fault_cause{cause_number}=fault_hidden; % save as case number 
               end
           end
           
           k_com=1; % the number of fault cause combination
           fault_com={};
           Pro_com=[];
           for k1=1:length(fault_cause{1})
               hidden_pro1=Hidden_pro(1,:,fault_number);
               if length(find(hidden_pro1==0))==2
                  hidden_pro1(hidden_pro1==0)=[]; %% delete zeros and find pro, if there is only one fault form in this cause
               end
               if Cause_Nr(fault_number)>1
                  hidden_pro2=Hidden_pro(2,:,fault_number);
                  if length(find(hidden_pro2==0))==2
                     hidden_pro2(hidden_pro2==0)=[];
                  end
                   for k2=1:length(fault_cause{2})
                       if Cause_Nr(fault_number)>2
                          hidden_pro3=Hidden_pro(3,:,fault_number);
                          if length(find(hidden_pro3==0))==2
                             hidden_pro3(hidden_pro3==0)=[];
                          end
                          for k3=1:length(fault_cause{3})
                              fault_com{k_com}=fault_cause{1}{k1}+fault_cause{2}{k2}+fault_cause{3}{k3}; % fault combination
                              Pro_com(k_com)=hidden_pro1(k1)*hidden_pro2(k2)*hidden_pro3(k3)/10000; %% probability of each fault combination
                              k_com=k_com+1;
                          end
                       else
                           fault_com{k_com}=fault_cause{1}{k1}+fault_cause{2}{k2};
                           Pro_com(k_com)=hidden_pro1(k1)*hidden_pro2(k2)/100;
                           k_com=k_com+1;
                       end
                   end
               else
                   fault_com{k_com}=fault_cause{1}{k1};
                   Pro_com(k_com)=hidden_pro1(k1);
                   k_com=k_com+1;
               end
           end        
           fault_f{fault_number}=fault_com; % save as  fault_number's fault
           Pro_f{fault_number}=Pro_com;
        end  
    end

