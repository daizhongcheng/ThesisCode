function [fault_data,probability] = fault_data_generation(data,fault_f,Pro_f,f_parameter)
 %%%%%%%%%%
 %%%%%%%%%% this is a function to genereate fault data, based on the input
 %%%%%%%%%% 'data', 'f_parametere' and stop time 'k_stop'.  
 %%%%%%%%%% Besides,'Sample_Size' means the numbers of total data samples.

% Call:
%          [fault_data,probability] = fault_data_generation(data,fault_f,Pro_f)
% Inputs: 
%         data-              original data
%         fault_f -       fault structure
%         Pro_f -      probability of each combination
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
% Setting wait bar
H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
            'WindowStyle','Modal'); 
 f_pattern={};
 Pro_pattern={};
 for j=1:f_parameter.Pattern_Nr % estimate the fault data in the situation of patterns
     str = ['Generating fault data...', num2str(round((j-1)/f_parameter.Pattern_Nr*100)), '%'];
     if ishandle(H)
        waitbar((j-1)/f_parameter.Pattern_Nr,H,str);
     else
     return;
     end
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
     [~,k_stop]=size(fault_f_new{1}{1}(1,:));
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
 if ishandle(H)
    delete(H);
 end
 %fault_pattern{j}= fault_f; % save as jth fault pattern's fault   
 % fault_data=fault_pattern;




