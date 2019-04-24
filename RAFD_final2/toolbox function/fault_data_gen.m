function [fault_data,probability] = fault_data_gen(data,f_parameter,Sample_Size,k_stop)
 %%%%%%%%%%
 %%%%%%%%%% this is a function to genereate fault data, based on the input
 %%%%%%%%%% 'data', 'f_parametere' and stop time 'k_stop'.  
 %%%%%%%%%% Besides,'Sample_Size' means the numbers of total data samples.

% Call:
%         [fault_data,probability] = fault_data_gen(data,f_parameter,Sample_Size,k_stop)
% 
% Inputs: 
%         data-              original data
%         f_parameter-       generate fault parameters
%         Sample_Size -      sample size
%         k_stop -           stop time     
%         
% Outputs:
%          fault_data: each pattern--each fault combination-- t relate fault data
%          probability: each pattern--probability of each fault combination
%         
% Notes: edit by Yannian Liu
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


    
    for fault_number=1:3  % each pattern, at most there are 3 fault
        if any(f_parameter.Fault_Pattern(:,fault_number))% to check if the fault exists, exist: 1
           for cause_number=1:f_parameter.Cause_Nr(fault_number) % each fault has at most 3 causes of fault
               fault_hidden={};
               fault_kind=find(f_parameter.Fault_function(cause_number,:,fault_number)~=0); % find the position of existing fault form
               if isempty(fault_kind)==0 % fault_kind is not empty 
                  cell_number=1;
               for k_kind=1:length(fault_kind)      
                   if fault_kind(k_kind)==1
                      theta1=f_parameter.Fault_range(cause_number,1,fault_number)+(f_parameter.Fault_range(cause_number,2,fault_number)-...
                             f_parameter.Fault_range(cause_number,1,fault_number))*rand(Sample_Size,1);
                      for t=1:k_stop
                          fault_constant(:,t)=theta1;
                      end
                      fault_hidden{cell_number}=fault_constant; % constan fault
                      cell_number=cell_number+1;
                   end
                   if fault_kind(k_kind)==2
                      theta2=f_parameter.Fault_range(cause_number,3,fault_number)+(f_parameter.Fault_range(cause_number,3,fault_number)-...
                             f_parameter.Fault_range(cause_number,4,fault_number))*rand(Sample_Size,1);
                      for t=1:k_stop
                          fault_ramp(:,t)=theta2*t;
                      end
                      fault_hidden{cell_number}=fault_ramp; % ramp fault
                      cell_number=cell_number+1;
                   end
                   if fault_kind(k_kind)==3
                      theta3=f_parameter.Fault_range(cause_number,5,fault_number)+(f_parameter.Fault_range(cause_number,5,fault_number)-...
                             f_parameter.Fault_range(cause_number,6,fault_number))*rand(Sample_Size,1);
                      for t=1:k_stop
                          fault_exponential(:,t)=1-exp(theta3*t);
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
               hidden_pro1=f_parameter.Hidden_pro(1,:,fault_number);
               if length(find(hidden_pro1==0))==2
                  hidden_pro1(hidden_pro1==0)=[];%% delete zeros and find pro, if there is only one fault form in this cause
               end 
               if f_parameter.Cause_Nr(fault_number)>1
                  hidden_pro2=f_parameter.Hidden_pro(2,:,fault_number);
                  if length(find(hidden_pro2==0))==2
                     hidden_pro2(hidden_pro2==0)=[];
                  end
                   for k2=1:length(fault_cause{2})
                       if f_parameter.Cause_Nr(fault_number)>2
                          hidden_pro3=f_parameter.Hidden_pro(3,:,fault_number);
                          if length(find(hidden_pro3==0))==2
                             hidden_pro3(hidden_pro3==0)=[];
                          end
                          for k3=1:length(fault_cause{3})
                              fault_com{k_com}=fault_cause{1}{k1}+fault_cause{2}{k2}+fault_cause{3}{k3}; % fault combination
                              Pro_com(k_com)=hidden_pro1(k1)*hidden_pro2(k2)*hidden_pro3(k3); %% probabiliti of each fault combination
                              k_com=k_com+1;
                          end
                       else
                           fault_com{k_com}=fault_cause{1}{k1}+fault_cause{2}{k2};
                           Pro_com(k_com)=hidden_pro1(k1)*hidden_pro2(k2);
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
    
 f_pattern={};
 Pro_pattern={};
 for j=1:f_parameter.Pattern_Nr % estimate the fault data in the situation of patterns
     fault_location=find(f_parameter.Fault_Pattern(j,:)>0); % find wich kind of fault exists in the certain pattern
     le=length(fault_location); % how many faults the certain pattern has
     for k=1:le
         fault_f_new{k}=fault_f{fault_location(k)}; % find the new fault_f cell
         Pro_f_new{k}=Pro_f{fault_location(k)};
     end
     fdata=data;
     le1=length(fault_f_new{1});
     position1=f_parameter.Fault_position(fault_location(1),1); % find the fault's position
     kf=1;
     fdata_up={}; % the uppper cell level of 'fdata'
     fdata_save={};
     Pro_up=[];
     for k1=1:le1
         if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
            for t=1:k_stop
                fdata(:,position1)=fdata(:,position1)+fault_f_new{1}{k1}(:,t);
                fdata_save{t}=fdata;
            end
         end
         if f_parameter.Fault_position(fault_location(1),3)==1; % addictive fault
            for t=1:k_stop
                fdata(:,position1)=data(:,position1).*fault_f_new{1}{k1}(:,t);
                fdata_save{t}=fdata;
            end
         end
         if le>1 % more than one fault
            le2=length(fault_f_new{2});
            position2=f_parameter.Fault_position(fault_location(2),1); % find the fault's position
            for k2=1:le2
                if f_parameter.Fault_position(fault_location(2),2)==1; % addictive fault
                   for t=1:k_stop
                       fdata_save{t}(:,position2)=fdata_save{t}(:,position2)+fault_f_new{2}{k2}(:,t);
                   end
                end
                if f_parameter.Fault_position(fault_location(2),3)==1; % addictive fault
                   for t=1:k_stop
                       fdata_save{t}(:,position2)=fdata_save{t}(:,position2).*fault_f_new{2}{k2}(:,t);
                   end
                end
                if le>2 % more than 2 faults
                   le3=length(fault_f_new{3});
                   position3=f_parameter.Fault_position(fault_location(3),1); % find the fault's position
                   for k3=1:le3
                       if f_parameter.Fault_position(fault_location(3),2)==1; % addictive fault
                          for t=1:k_stop
                              fdata_save{t}(:,position3)=fdata_save{t}(:,position3)+fault_f_new{3}{k3}(:,t);
                          end
                       end
                       if f_parameter.Fault_position(fault_location(3),3)==1; % addictive fault
                          for t=1:k_stop
                              fdata_save{t}(:,position3)=fdata_save{t}(:,position3).*fault_f_new{3}{k3}(:,t);
                          end
                       end
                       fdata_up{kf}=fdata_save;
                       Pro_up(kf)=Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3);
                       kf=kf+1;
                   end
                else
                    fdata_up{kf}=fdata_save;
                    Pro_up(kf)=Pro_f_new{1}(k1)*Pro_f_new{2}(k2);
                    kf=kf+1;
                end
            end
         else
             fdata_up{kf}=fdata_save;
             Pro_up(kf)=Pro_f_new{1}(k1);
             kf=kf+1;
         end
     end
     f_pattern{j}=fdata_up;
     Pro_pattern{j}=Pro_up;
 end
 fault_data=f_pattern;
 probability=Pro_pattern;
 %fault_pattern{j}= fault_f; % save as jth fault pattern's fault   
 % fault_data=fault_pattern;




