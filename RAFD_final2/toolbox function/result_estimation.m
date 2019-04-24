function [FAR,FDR,MT2FD,FDR_p,MT2FD_p] = result_estimation(f_parameter,c_parameter)
%
% Call:
%          [FAR,FDR,MT2FD,FDR_p,MT2FD_p] = result_estimation(f_parameter)
%
% Inputs:
%            f_parameter - design parameters
%
% Outputs:
%             FAR - false alarm rate
%             FDR - fault detection rate
%           MT2FD - mtime to fault detection
%           FDR_p - FDR of each fault pattern
%         MT2FD_p - MT2FD of each fault pattern
%         
% Notes: NONE
%
% Required M-files: NONE
%
% Reference: NONE
%
%
% -------------------------------------------------------------------------
% University of Duisburg-Essen (Campus Duisburg)
% Faculty of Engineering
% Institute for Automatic Control and Complex Systems (AKS)
% Bismarckstr. 81
% D-47057 Duisburg, Germany

% -------------------------------------------------------------------------


 
load('fileData.mat');   
%load('customData.mat');  
switch f_parameter.Data
    case 1 % Model based 
        FAR=0;
        k_stop=100;
        % get system matrix A B C D 
        % if custom uses the GUI to type in the system model
        if c_parameter.Choice(1,2)==1
           %disp('Type in the system')
           % get system matrix A B C D 
           A=f_parameter.Sys_matrix{1}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(1));
           B=f_parameter.Sys_matrix{2}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(2));
           C=f_parameter.Sys_matrix{3}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(1));
           
           %%%%%%%%%%%%%%------------  re-check here --------------------------------
           % if there D is needed
           D=zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2));
           %%%%%%%%%%%%%% ------------------------------------------------------------
           


        % if custom load the system model   
        elseif c_parameter.Choice(1,1)==1
            %disp('Load in system model')
            % get system matrix A,B,C,D,Ed,Fd
            A=c_parameter.Process_model{1};
            B=c_parameter.Process_model{2};
            C=c_parameter.Process_model{3};
            
            % get matrix D
            if isempty(c_parameter.Process_model{4})==1
               D=zeros(size(C,1),size(B,2));
            else
               D=c_parameter.Process_model{4};
            end
               
        else
           disp('Error. Please check the ''Process Model''.') 
           return
        end


        %% initialization of generating input data
        % generate input data
        % if custom uses the GUI to generate the input system 
        if c_parameter.Choice(2,3)==1
           Ts=f_parameter.Samp_time;
           Sim_N=f_parameter.Input_data{1};
           t=0:Ts:(Sim_N-1)*Ts;
           input_dim = size(B,2);  % the input signal dimension
           u=zeros(Sim_N,input_dim); % input signal
           indicator=1;
        
           % input generation
           % first time domin
           for ku=1:input_dim
               u(f_parameter.Input_data{2}(1,1):f_parameter.Input_data{2}(1,2),ku)=...
               f_parameter.Input_data{2}(1,3)+(f_parameter.Input_data{2}(1,4)-f_parameter.Input_data{2}(1,3)).*rand(1);
           end
           % second time domin
           for ku=1:input_dim
               u(f_parameter.Input_data{2}(2,1):f_parameter.Input_data{2}(2,2),ku)=...
               f_parameter.Input_data{2}(2,3)+(f_parameter.Input_data{2}(2,4)-f_parameter.Input_data{2}(2,3)).*rand(1);
           end
           % third time domin
           for ku=1:input_dim
               u(f_parameter.Input_data{2}(3,1):f_parameter.Input_data{2}(3,2),ku)=...
               f_parameter.Input_data{2}(3,3)+(f_parameter.Input_data{2}(3,4)-f_parameter.Input_data{2}(3,3)).*rand(1);
           end
       
        % if custom load the input signal   
        elseif c_parameter.Choice(2,1)==1 
           Ts=f_parameter.Samp_time;
           u= c_parameter.Input_signal;
           input_dim = size(B,2);  % the input signal dimension
           if size(u,2)==input_dim 
              t=0:Ts:(size(u,1)-1)*Ts;
              Sim_N=size(u,1);
              indicator=1;
           elseif size(u,1)==input_dim
              t=0:Ts:(size(u,2)-1)*Ts; 
              u=u';
              Sim_N=size(u,1);
              indicator=0;
           else
               disp('Error. Please check the dimesion of input siganl')
           end
        else
           disp('Error. Please check the ''Load Input Signal''.') 
           return
        end
        

        %% sample size
        Sample_Size=f_parameter.Sample_Size;
      

      
      %% nominal system
      sysn=ss(A,B,C,D,Ts);
      
      %% observer system
      % get observer gain matrix and postfilter
        % if the custom uses the GUI to type into the observer gain matrix
        % and post filter
        if c_parameter.Choice(4,2)==1
           % Get observer gain matrix L
           if f_parameter.Residual{1}(2)==1  % Unite solution
              L= f_parameter.Residual{3};
              V= f_parameter.Residual{4};
              sysr=ss(A-L*C,[B L],-V*C,[-V*D V*eye(size(C,1))],Ts);
           else % not unit solution, kalman filter or given L
              L=f_parameter.Residual{3}(1:size(A,1),1:size(C,1)); 
              sysr=ss(A-L*C,[B L],-C,[D eye(size(C,1))],Ts); 
           end

        % if the custom uses the loading observer function
        elseif c_parameter.Choice(4,1)==1
            
            if isfield(c_parameter,'Filter')==1 % there is one post filter
               L=c_parameter.Filter_gain;
               V=c_parameter.Filter;      
               sysr=ss(A-L*C,[B L],-V*C,[-V*D V*eye(size(C,1))],Ts);
            else
               L=c_parameter.Filter_gain;
               sysr=ss(A-L*C,[B L],-C,[D eye(size(C,1))],Ts); 
            end
            
        else
            disp('Error. Please check the ''Load Existing Filter Gain/Filter''.') 
            return
        end
      
      %sysr=ss(A-L*C,[-B -L],C,[zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2)) eye(f_parameter.Sys_dim(3))],Ts);
      
      
      % initialization
                % if the custom use GUI to generate fault model
                if c_parameter.Choice(5,3)==1 
                   Pattern_Nr = f_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = f_parameter.Pattern_pro; % get the probability matrix in the pattern level
   
                % if the custom load fault model    
                elseif c_parameter.Choice(5,1)==1
                   Pattern_Nr = c_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = c_parameter.Pattern_pro; % get the probability matrix in the pattern level
                       
                else 
                   disp('Error. Please generate or upload fault model.')
                   return
                end
      %% ------------ FDR estimation ------------------------------------
      
      % initialization
      % if the custom use GUI to generate fault model
      if c_parameter.Choice(5,3)==1 
         Pattern_Nr = f_parameter.Pattern_Nr; % get the pattern number
         Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
         Pattern_pro = f_parameter.Pattern_pro; % get the probability matrix in the pattern level
   
      % if the custom load fault model    
      elseif c_parameter.Choice(5,1)==1
         Pattern_Nr = c_parameter.Pattern_Nr; % get the pattern number
         Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
         Pattern_pro = c_parameter.Pattern_pro; % get the probability matrix in the pattern level
                       
      else 
         disp('Error. Please generate or upload fault model.')
         return
      end
      
      FDR_s=zeros(1,Pattern_Nr);
      MT2FD_s=zeros(1,Pattern_Nr);
      
      H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                    'WindowStyle','Modal');
      for is=1:Sample_Size
          
          
          % generate fault data
          try  
              fault_f=f_parameter.fault_data;
              Pro_f=f_parameter.probability;
          catch
              [fault_f,Pro_f] = fault_data_gen1(f_parameter,c_parameter,Sim_N,Ts);
          end
          
          str = ['Calculating FDR...', num2str(round((is-1)/Sample_Size*100)), '%'];
          if ishandle(H)
             waitbar((is-1)/Sample_Size,H,str);
          else
             return;
          end
            
          for j=1:Pattern_Nr % how many patterns of fault we have, the out side cycle


             fault_f_new={};
             Pro_f_new={};


             fault_location=find(Fault_Pattern(j,:)>0); % find which kind of fault exists in the certain pattern
             le=length(fault_location); % how many faults the certain pattern has
             for k=1:le
                 fault_f_new{k}=fault_f{fault_location(k)}; % find the new fault_f cell
                 Pro_f_new{k}=Pro_f{fault_location(k)};
             end

             le1=length(fault_f_new{1});
             %position1=f_parameter.Fault_position_mb(fault_location(1),1); % find the fault's position
             k_intiger=1;MT2FD_in=[];FDR_in=[];
             
             for k1=1:le1
                 
                 % input signal
                 u1=u;
                 
                 % first to check the actuator faults
                 % actuator 1 fault in fault one
                 if f_parameter.Fault_position_mb(fault_location(1),3)==1; 
                    if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                       u1(:,1)=u1(:,1)+fault_f_new{1}{k1}'; % add the fault to 'u'
                    end
                    if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                       u1(:,1)=u1(:,1).*fault_f_new{1}{k1}';
                    end
                 end
                 % actuator 2 fault in fault one
                 if f_parameter.Fault_position_mb(fault_location(1),4)==1; 
                    if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                       u1(:,2)=u1(:,2)+fault_f_new{1}{k1}'; % add the fault to 'u'
                    end
                    if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                       u1(:,2)=u1(:,2).*fault_f_new{1}{k1}';
                    end
                 end
                 if le>1 % more than one fault
                    u2=u1;
                    le2=length(fault_f_new{2});
                    %position2=f_parameter.Fault_position(fault_location(2),1); % find the fault's position
                    for k2=1:le2
                        % first to check the actuator faults
                        % actuator 1 fault in fault two
                        if f_parameter.Fault_position_mb(fault_location(2),3)==1; 
                           if f_parameter.Fault_position_mb(fault_location(2),5)==1; % addictive fault
                              u2(:,1)=u2(:,1)+fault_f_new{2}{k2}'; % add the fault to 'u'
                           end
                           if f_parameter.Fault_position_mb(fault_location(2),6)==1; % multiplicative fault
                              u2(:,1)=u2(:,1).*fault_f_new{2}{k2}';
                           end
                        end
                        % actuator 2 fault in fault two
                        if f_parameter.Fault_position_mb(fault_location(2),4)==1; 
                           if f_parameter.Fault_position_mb(fault_location(2),5)==1; % addictive fault
                              u2(:,2)=u2(:,2)+fault_f_new{2}{k2}'; % add the fault to 'u'
                           end
                           if f_parameter.Fault_position_mb(fault_location(2),6)==1; % multiplicative fault
                              u2(:,2)=u2(:,2).*fault_f_new{2}{k2}';
                           end
                        end
                        %%% at most two faults in this pattern,
                        %%% can do FDR now

                        % go through nominal system
                        %[y,~,x] = lsim(sysn,u,t);
                        y = lsim(sysn,u2,t);

                        % secondly, to check the sensor fault
                        % sensor 1 fault in fualt one 
                        if f_parameter.Fault_position_mb(fault_location(1),1)==1; 
                           if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                              y(:,1)=y(:,1)+fault_f_new{1}{k1}'; % add the fault to 'y'
                           end
                           if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                              y(:,1)=y(:,1).*fault_f_new{1}{k1}';
                           end
                        end
                        % sensor 2 fault in fualt one 
                        if f_parameter.Fault_position_mb(fault_location(1),2)==1; 
                           if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                             y(:,2)=y(:,2)+fault_f_new{1}{k1}'; % add the fault to 'u'
                           end
                           if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                              y(:,2)=y(:,2).*fault_f_new{1}{k1}';
                              % or calculate it by the following way
                              %for km=1:Sim_N
                              %    y(km,2)= y(km,2)+C(2,:)*fault_f_new{2}{k2}(km)*x(km);
                              %end
                           end
                        end

                        % secondly, to check the sensor fault
                        % sensor 1 fault in fault two
                        if f_parameter.Fault_position_mb(fault_location(2),1)==1; 
                           if f_parameter.Fault_position_mb(fault_location(2),5)==1; % addictive fault
                              y(:,1)=y(:,1)+fault_f_new{2}{k2}'; % add the fault to 'u'
                           end
                           if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                              y(:,1)=y(:,1).*fault_f_new{2}{k2}';
                           end
                        end
                        % sensor 2 fault in fualt two
                        if f_parameter.Fault_position_mb(fault_location(2),2)==1; 
                           if f_parameter.Fault_position_mb(fault_location(2),5)==1; % addictive fault
                              y(:,2)=y(:,2)+fault_f_new{2}{k2}'; % add the fault to 'u'
                           end
                           if f_parameter.Fault_position_mb(fault_location(2),6)==1; % multiplicative fault
                              y(:,2)=y(:,2).*fault_f_new{2}{k2}';
                              % or calculate it by the following way
                              %for km=1:Sim_N
                              %    y(km,2)= y(km,2)+C(2,:)*fault_f_new{2}{k2}(km)*x(km);
                              %end
                           end
                        end

                        % now get output signal, next is to get residual signal
                        input=[u2,y];

                        % ------------------- FDR estimation ----------------
                        [FDR_,MT2FD_]=MBFDR_estimation(sysr,input,t,f_parameter,k_stop);
                        FDR_in(k_intiger) = FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                        
                        %rou=k_stop;
                        %for i=1:k_stop
                        %    rou=rou-(k_stop+1-i)*MT2FD_(i);
                        %end
                        %MT2FD_in(k_intiger) = rou*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                        MT2FD_in(k_intiger) = MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;

                        k_intiger=k_intiger+1;
                     end
                 else
                      % only one fault, can do FDR now
                      % go through nominal system
                       %[y,~,x] = lsim(sysn,u,t);
                       y = lsim(sysn,u1,t);

                       % secondly, to check the sensor fault
                       % sensor 1 fault in fualt one 
                       if f_parameter.Fault_position_mb(fault_location(1),1)==1; 
                          if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                             y(:,1)=y(:,1)+fault_f_new{1}{k1}'; % add the fault to 'u'
                          end
                          if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                             y(:,1)=y(:,1).*fault_f_new{1}{k1}';
                          end
                       end
                       % sensor 2 fault in fualt one 
                       if f_parameter.Fault_position_mb(fault_location(1),2)==1; 
                          if f_parameter.Fault_position_mb(fault_location(1),5)==1; % addictive fault
                             y(:,2)=y(:,2)+fault_f_new{1}{k1}'; % add the fault to 'u'
                          end
                          if f_parameter.Fault_position_mb(fault_location(1),6)==1; % multiplicative fault
                             y(:,2)=y(:,2).*fault_f_new{1}{k1}';
                             % or calculate it by the following way
                             %for km=1:Sim_N
                             %    y(km,2)= y(km,2)+C(2,:)*fault_f_new{2}{k2}(km)*x(km);
                             %end
                          end
                       end

                       % now get output signal, next is to get residual signal
                        input=[u1,y];

                        % ------------------- FDR estimation ----------------
                        [FDR_,MT2FD_]=MBFDR_estimation(sysr,input,t,f_parameter,k_stop);
                        FDR_in(k_intiger) = FDR_*Pro_f_new{1}(k1);
                        
                        %rou=k_stop;
                        %for i=1:k_stop
                        %    rou=rou-(k_stop+1-i)*MT2FD_(i);
                        %end
                        %MT2FD_in(k_intiger) = rou*Pro_f_new{1}(k1);
                        MT2FD_in(k_intiger) = MT2FD_*Pro_f_new{1}(k1);

                        k_intiger=k_intiger+1;
                 end
             end
                FDR_p1(j)=sum(FDR_in);
                MT2FD_p1(j)=sum(MT2FD_in);
          end
          FDR_s=FDR_s+FDR_p1;
          MT2FD_s=MT2FD_s+MT2FD_p1;
      end
      
      if ishandle(H)
         delete(H);
      end
        
      FDR_p=FDR_s/Sample_Size;
      MT2FD_p=MT2FD_s/Sample_Size*f_parameter.Samp_time/100;
      
      % final FDR and MT2FD
      Pro=Pattern_pro;
      Pro(:,all(Pro==0,1))=[];
      FDR=Pro*FDR_p'/100;
      MT2FD=Pro*MT2FD_p'/100;

        
    % ---------------------------------------------------------------------
    case 2 % Data Driven
        
        switch f_parameter.Data_type

            case 1 % for PCA related    
                FAR=[]; FDR=[]; MT2FD=[]; FDR_p=[]; MT2FD_p=[];
                
                % may be unusefull
                FDR_GLR_p=[];MT2FD_GLR_p=[];FDR_GLR_pp=[];MT2FD_GLR_pp=[];
                FDR_PCA_p=[];MT2FD_PCA_p=[];FDR_PCA_pp=[]; MT2FD_PCA_pp=[];
               
                % get the designed(given) parameters for covariance / for
                % data generation
                a=f_parameter.Covariance(1);
                b=f_parameter.Covariance(3);
                c=f_parameter.Covariance(2);
                d=f_parameter.Covariance(4);
                Sample_Size=f_parameter.Sample_Size;
                
                % original data generation
                [data,data_para] = original_data_generation(a,b,c,Sample_Size);
                
                %% ----------- offline training --------------
                
                if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                    GLR_para = trainingGLR(data,f_parameter.FAR_estimation);
                end
                
                if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                    PCA_para = trainingPCA(data,f_parameter.FAR_estimation);
                end
                
                %% ------------- offline FAR estimation --------------------
                FAR_glr=[]; FAR_pca=[];
                
                H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                    'WindowStyle','Modal');
                
                for i=1:Sample_Size
                    str = ['Calculating FAR...', num2str(round((i-1)/Sample_Size*100)), '%'];
                    if ishandle(H)
                       waitbar((i-1)/Sample_Size,H,str);
                    else
                        return;
                    end
                    data_with_uncertainty = data_generation(a,Sample_Size,d,data_para);
                    
                    if f_parameter.Estimation_method(1)==1 % if FAR is going to be estimated
                        
                        if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                            FAR_glr(i) = FAR_GLR(data_with_uncertainty,GLR_para);
                        end
                        
                        if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                            FAR_pca(i) = FAR_PCA(data_with_uncertainty,PCA_para);
                        end
                    end
                end
                
                if ishandle(H)
                   delete(H);
                end
                
                if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                    FAR = mean(FAR_glr)*100;
                end
                if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                    FAR = [FAR mean(FAR_pca)*100];
                end
                
                %% ------------- online FDR estimation ---------------------
                
                % initialization
                % if the custom use GUI to generate fault model
                if c_parameter.Choice(5,3)==1 
                   Pattern_Nr = f_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = f_parameter.Pattern_pro; % get the probability matrix in the pattern level
   
                % if the custom load fault model    
                elseif c_parameter.Choice(5,1)==1
                   Pattern_Nr = c_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = c_parameter.Pattern_pro; % get the probability matrix in the pattern level
                       
                else 
                   disp('Error. Please generate or upload fault model.')
                   return
                end
                
                
                if f_parameter.Estimation_method(2)==1
                    % Setting wait bar
                    H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                        'WindowStyle','Modal');
                    
                    k_stop=100; % the 100th sample
                    Ts=0.01;
                    
                    %[fault_data,probability] = fault_data_gen(data,f_parameter,Sample_Size,k_stop);
                    try  %generate fault data
                        fault_f=f_parameter.fault_data;
                        Pro_f=f_parameter.probability;
                    catch
                       [fault_f,Pro_f] = fault_data_gen_save(f_parameter,c_parameter,Sample_Size,k_stop,Ts);
                    end
                    
                    

                    for j=1:Pattern_Nr % how many patterns of fault we have, the out side cycle
                        
                        FDR_GLR_aid=[];
                        MT2FD_GLR_aid=[];
                        FDR_PCA_aid=[];
                        MT2FD_PCA_aid=[];
                     
                        % wait bar 
                        str = ['FD performance evaluating...', num2str(round((j-1)/Pattern_Nr*100)), '%'];
                        
                        if ishandle(H)
                            waitbar((j-1)/Pattern_Nr,H,str);
                        else
                            return;
                        end
                        
                        fault_f_new={};
                        Pro_f_new={};
                        fdata_save={};
                        
                        fault_location=find(Fault_Pattern(j,:)>0); % find wich kind of fault exists in the certain pattern
                        le=length(fault_location); % how many faults the certain pattern has
                        for k=1:le
                            fault_f_new{k}=fault_f{fault_location(k)}; % find the new fault_f cell
                            Pro_f_new{k}=Pro_f{fault_location(k)};
                        end
                        
                        le1=length(fault_f_new{1});
                        position1=f_parameter.Fault_position(fault_location(1),1); % find the fault's position
                        k_intiger=1;
                        for k1=1:le1
                            if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
                               for t=1:k_stop
                                   fdata=data;
                                   fdata(:,position1)=fdata(:,position1)+fault_f_new{1}{k1}(:,t);
                                   fdata_save1{t}=fdata;
                               end
                            end
                            if f_parameter.Fault_position(fault_location(1),3)==1; % multiplicative fault
                               for t=1:k_stop
                                   fdata=data;
                                   fdata(:,position1)=fdata(:,position1).*fault_f_new{1}{k1}(:,t);
                                   fdata_save1{t}=fdata;
                               end
                            end
                            if le>1 % more than one fault
                               le2=length(fault_f_new{2});
                               position2=f_parameter.Fault_position(fault_location(2),1); % find the fault's position
                               for k2=1:le2
                                   fdata_save2=fdata_save1;
                                   if f_parameter.Fault_position(fault_location(2),2)==1; % addictive fault
                                      for t=1:k_stop
                                          fdata_save2{t}(:,position2)=fdata_save2{t}(:,position2)+fault_f_new{2}{k2}(:,t);
                                      end
                                   end
                                   if f_parameter.Fault_position(fault_location(2),3)==1; % multiplicative fault
                                      for t=1:k_stop
                                          fdata_save2{t}(:,position2)=fdata_save2{t}(:,position2).*fault_f_new{2}{k2}(:,t);
                                      end
                                   end
                                   %if le>2 % more than 2 faults  it will not happend in this program
                                   %   le3=length(fault_f_new{3});
                                   %   position3=f_parameter.Fault_position(fault_location(3),1); % find the fault's position
                                   %   for k3=1:le3
                                   %        fdata_save3=fdata_save2;
                                   %       if f_parameter.Fault_position(fault_location(3),2)==1; % addictive fault
                                   %          for t=1:k_stop
                                   %              fdata_save3{t}(:,position3)=fdata_save3{t}(:,position3)+fault_f_new{3}{k3}(:,t);
                                   %          end
                                   %       end
                                   %       if f_parameter.Fault_position(fault_location(3),3)==1; % multiplicative fault
                                   %          for t=1:k_stop
                                   %              fdata_save3{t}(:,position3)=fdata_save3{t}(:,position3).*fault_f_new{3}{k3}(:,t);
                                   %          end
                                   %       end
                                   %       % 3 faults, now can do FDR
                                   %       if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                                   %           [FDR_,MT2FD_] = online_GLR(data,fdata_save3,f_parameter.Sample_Size,GLR_para);
                                   %           FDR_GLR_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %           MT2FD_GLR_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %       end
                                   %       if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                                   %           [FDR_,MT2FD_] = online_PCA(data,fdata_save3,f_parameter.Sample_Size,PCA_para);
                                   %           FDR_PCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %           MT2FD_PCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %       end
                                   %       k_intiger=k_intiger+1;
                                   %   end
                                   %else
                                       %%% only two faults in this pattern,
                                       %%% can do FDR now
                                       if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                                           [FDR_,MT2FD_] = online_GLR(data,fdata_save2,Sample_Size,GLR_para);
                                           FDR_GLR_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                           MT2FD_GLR_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                       end
                                       if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                                           [FDR_,MT2FD_] = online_PCA(data,fdata_save2,Sample_Size,PCA_para);
                                           FDR_PCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                           MT2FD_PCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                       end
                                       k_intiger=k_intiger+1;
                                   %end
                               end
                            else
                                %%% only one fault in the pattern, can do
                                %%% FDR now
                                if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                                    [FDR_,MT2FD_] = online_GLR(data,fdata_save1,Sample_Size,GLR_para);
                                    FDR_GLR_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    MT2FD_GLR_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1);
                                end
                                if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                                    [FDR_,MT2FD_] = online_PCA(data,fdata_save1,Sample_Size,PCA_para);
                                    FDR_PCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    MT2FD_PCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1);
                                end
                                k_intiger=k_intiger+1;
                            end
                        end
                        
                        if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                            FDR_GLR_p(j)=sum(FDR_GLR_aid);
                            MT2FD_GLR_p(j)=sum(MT2FD_GLR_aid)/100;
                            FDR_GLR_pp(j)=sum(FDR_GLR_aid)*Pattern_pro(j)/100;
                            MT2FD_GLR_pp(j)=sum(MT2FD_GLR_aid)*Pattern_pro(j)/10000;
                        end
                        if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                            FDR_PCA_p(j)=sum(FDR_PCA_aid);
                            MT2FD_PCA_p(j)=sum(MT2FD_PCA_aid)/100;
                            FDR_PCA_pp(j)=sum(FDR_PCA_aid)*Pattern_pro(j)/100;
                            MT2FD_PCA_pp(j)=sum(MT2FD_PCA_aid)*Pattern_pro(j)/10000;
                        end
                    end
                    % delete wait bar
                    if ishandle(H)
                        delete(H);
                    end
                    if  f_parameter.Detection_method(:,1)==1 % if GLR method is selected
                        FDR_p=FDR_GLR_p';
                        MT2FD_p=MT2FD_GLR_p'*Ts;
                        FDR=sum(FDR_GLR_pp);
                        MT2FD=sum(MT2FD_GLR_pp)*Ts;
                    end
                    if  f_parameter.Detection_method(:,2)==1 % if PCA method is selected
                        FDR_p=[FDR_p FDR_PCA_p'];
                        MT2FD_p=[MT2FD_p MT2FD_PCA_p'*Ts];
                        FDR=[FDR sum(FDR_PCA_pp)];
                        MT2FD=[MT2FD sum(MT2FD_PCA_pp)*Ts];
                    end

                end
                
            case 2 % PLS, LS, SCCA, and also for custom algorithm
                kpi=f_parameter.kpi;
                % now, only do changes for the first part, after discussion of the
                % advised change of GUI--no case 1, case 2 and 3, only data driven
                % and model driven,man can delete this explain.

                FAR=[];FDR=[];MT2FD=[];FDR_p=[];MT2FD_p=[];
                
                %%%%may be unusefull
                FDR_PLS_p=[];MT2FD_PLS_p=[];FDR_PLS_pp=[];MT2FD_PLS_pp=[];
                FDR_SCCA_p=[];MT2FD_SCCA_p=[];FDR_SCCA_pp=[];MT2FD_SCCA_pp=[];
                FDR_LS_p=[];MT2FD_LS_p=[];FDR_LS_pp=[];MT2FD_LS_pp=[];
                
                % get the designed(given) parameters for covariance / for
                % data generation
                a=f_parameter.Covariance(1);
                b=f_parameter.Covariance(3);
                c=f_parameter.Covariance(2);
                d=f_parameter.Covariance(4);
                Sample_Size=f_parameter.Sample_Size;
                
                %%% original data generation
                [data,data_para,quality] = original_data_generation(a,b,c,Sample_Size,kpi);
                
                %% offline training
                % if PLS method is selected
                if  f_parameter.Detection_method(:,1)==1 
                    PLS_para = trainingPLS(data,quality,f_parameter.FAR_estimation);%
                end
                % if SCCA method is selected
                if  f_parameter.Detection_method(:,2)==1 
                    SCCA_para = trainingSCCA(data,quality,f_parameter.FAR_estimation);
                end
                % if LS method is selected
                if  f_parameter.Detection_method(:,3)==1 
                    LS_para = trainingLS(data,quality,f_parameter.FAR_estimation);
                end
                
                %% offline FAR estimation
                FAR_pls=[];FAR_scca=[];FAR_ls=[];
                
                H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                    'WindowStyle','Modal');
                
                for i=1:Sample_Size
                    str = ['Calculating FAR...', num2str(round((i-1)/Sample_Size*100)), '%'];
                    if ishandle(H)
                       waitbar((i-1)/Sample_Size,H,str);
                    else
                        return;
                    end
                    
                    [data_with_uncertainty,~] = data_generation(a,Sample_Size,d,data_para,kpi);
                    if f_parameter.Estimation_method(1)==1
                        % if PLS method is selected
                        if  f_parameter.Detection_method(:,1)==1 
                            % ---- FAR calculation --------------
                            FAR_pls(i) = FAR_PLS(data_with_uncertainty,PLS_para);%
                        end
                        % if SCCA method is selected
                        if  f_parameter.Detection_method(:,2)==1 
                            % ---- FAR calculation --------------
                            FAR_scca(i) = FAR_SCCA(data_with_uncertainty,SCCA_para);%
                        end
                        % if LS method is selected
                        if  f_parameter.Detection_method(:,3)==1 
                            % ---- FAR calculation --------------
                            FAR_ls(i) = FAR_LS(data_with_uncertainty,LS_para);%
                        end
                    end
                end
                
                if ishandle(H)
                   delete(H);
                end
                
                % if PLS method is selected
                if  f_parameter.Detection_method(:,1)==1 
                    FAR = mean(FAR_pls)*100;%
                end
                % if SCCA method is selected
                if  f_parameter.Detection_method(:,2)==1 
                    FAR = [FAR mean(FAR_scca)*100];%
                end
                % if LS method is selected
                if  f_parameter.Detection_method(:,3)==1 
                    FAR = [FAR mean(FAR_ls)*100];%
                end
                
                %% online FDR estimation
                
                % initialization
                % if the custom use GUI to generate fault model
                if c_parameter.Choice(5,3)==1 
                   Pattern_Nr = f_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = f_parameter.Pattern_pro; % get the probability matrix in the pattern level
   
                % if the custom load fault model    
                elseif c_parameter.Choice(5,1)==1
                   Pattern_Nr = c_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = c_parameter.Pattern_pro; % get the probability matrix in the pattern level
                       
                else 
                   disp('Error. Please generate or upload fault model.')
                   return
                end
                
                
                if f_parameter.Estimation_method(2)==1
                    
                    % Setting wait bar
                    H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                        'WindowStyle','Modal');
                    
                    k_stop=100; % the 100th sample
                    Ts=0.01;
                    
                    %[fault_data,probability] = fault_data_gen(data,f_parameter,Sample_Size,k_stop);
                    try  %generate fault data
                        fault_f=f_parameter.fault_data;
                        Pro_f=f_parameter.probability;
                    catch
                       [fault_f,Pro_f] = fault_data_gen_save(f_parameter,c_parameter,Sample_Size,k_stop,Ts);
                    end

                    for j=1:Pattern_Nr % how many patterns of fault we have, the out side cycle
                        
                        FDR_PLS_aid=[];
                        MT2FD_PLS_aid=[];
                        FDR_SCCA_aid=[];
                        MT2FD_SCCA_aid=[];
                        FDR_LS_aid=[];
                        MT2FD_LS_aid=[];
                     
                        % wait bar 
                        str = ['FD performance evaluating...', num2str(round((j-1)/Pattern_Nr*100)), '%'];
                        
                        if ishandle(H)
                            waitbar((j-1)/Pattern_Nr,H,str);
                        else
                            return;
                        end
                        
                        fault_f_new={};
                        Pro_f_new={};
                        fdata_save={};
                        
                        fault_location=find(Fault_Pattern(j,:)>0); % find which kind of fault exists in the certain pattern
                        le=length(fault_location); % how many faults the certain pattern has
                        for k=1:le
                            fault_f_new{k}=fault_f{fault_location(k)}; % find the new fault_f cell
                            Pro_f_new{k}=Pro_f{fault_location(k)};
                        end
                        
                        le1=length(fault_f_new{1});
                        position1=f_parameter.Fault_position(fault_location(1),1); % find the fault's position
                        k_intiger=1;
                        for k1=1:le1
                            if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
                               for t=1:k_stop
                                   fdata=data;
                                   fdata(:,position1)=fdata(:,position1)+fault_f_new{1}{k1}(:,t);
                                   fdata_save1{t}=fdata;
                               end
                            end
                            if f_parameter.Fault_position(fault_location(1),3)==1; % multiplicative fault
                               for t=1:k_stop
                                   fdata=data;
                                   fdata(:,position1)=fdata(:,position1).*fault_f_new{1}{k1}(:,t);
                                   fdata_save1{t}=fdata;
                               end
                            end
                            if le>1 % more than one fault
                               le2=length(fault_f_new{2});
                               position2=f_parameter.Fault_position(fault_location(2),1); % find the fault's position
                               for k2=1:le2
                                   fdata_save2=fdata_save1;
                                   if f_parameter.Fault_position(fault_location(2),2)==1; % addictive fault
                                      for t=1:k_stop
                                          fdata_save2{t}(:,position2)=fdata_save2{t}(:,position2)+fault_f_new{2}{k2}(:,t);
                                      end
                                   end
                                   if f_parameter.Fault_position(fault_location(2),3)==1; % multiplicative fault
                                      for t=1:k_stop
                                          fdata_save2{t}(:,position2)=fdata_save2{t}(:,position2).*fault_f_new{2}{k2}(:,t);
                                      end
                                   end
                                   %if le>2 % more than 2 faults, this case will not happend in this case
                                   %   le3=length(fault_f_new{3});
                                   %   position3=f_parameter.Fault_position(fault_location(3),1); % find the fault's position
                                   %   for k3=1:le3
                                   %        fdata_save3=fdata_save2;
                                   %       if f_parameter.Fault_position(fault_location(3),2)==1; % addictive fault
                                   %          for t=1:k_stop
                                   %              fdata_save3{t}(:,position3)=fdata_save3{t}(:,position3)+fault_f_new{3}{k3}(:,t);
                                   %          end
                                   %       end
                                   %       if f_parameter.Fault_position(fault_location(3),3)==1; % multiplicative fault
                                   %          for t=1:k_stop
                                   %              fdata_save3{t}(:,position3)=fdata_save3{t}(:,position3).*fault_f_new{3}{k3}(:,t);
                                   %          end
                                   %       end
                                   %       % 3 faults, now can do FDR
                                   %       if  f_parameter.Detection_method(:,1)==1 % if PLS method is selected
                                   %           [FDR_,MT2FD_] = online_PLS(data,fdata_save3,f_parameter.Sample_Size,PLS_para);
                                   %           FDR_PLS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %           MT2FD_PLS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %       end
                                   %       if  f_parameter.Detection_method(:,2)==1 % if SCCA method is selected
                                   %           [FDR_,MT2FD_] = online_SCCA(data,fdata_save3,f_parameter.Sample_Size,SCCA_para);
                                   %           FDR_SCCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %           MT2FD_SCCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %       end
                                   %       if  f_parameter.Detection_method(:,3)==1 % if LS method is selected
                                   %           [FDR_,MT2FD_] = online_LS(data,fdata_save3,f_parameter.Sample_Size,LS_para);
                                   %           FDR_LS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %           MT2FD_LS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)*Pro_f_new{3}(k3)/10000;
                                   %       end
                                   %       k_intiger=k_intiger+1;
                                   %   end
                                   %else
                                       %%% only two faults in this pattern,
                                       %%% can do FDR now
                                       if  f_parameter.Detection_method(:,1)==1 % if PLS method is selected
                                           [FDR_,MT2FD_] = online_PLS(data,fdata_save2,Sample_Size,PLS_para);
                                           FDR_PLS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                           MT2FD_PLS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                       end
                                       if  f_parameter.Detection_method(:,2)==1 % if SCCA method is selected
                                           [FDR_,MT2FD_] = online_SCCA(data,fdata_save2,Sample_Size,SCCA_para);
                                           FDR_SCCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                           MT2FD_SCCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                       end
                                       if  f_parameter.Detection_method(:,3)==1 % if LS method is selected
                                           [FDR_,MT2FD_] = online_LS(data,fdata_save2,Sample_Size,LS_para);
                                           FDR_LS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                           MT2FD_LS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                       end
                                       k_intiger=k_intiger+1;
                                   %end
                               end
                            else
                                %%% only one fault in the pattern, can do
                                %%% FDR now
                                if  f_parameter.Detection_method(:,1)==1 % if PLS method is selected
                                    [FDR_,MT2FD_] = online_PLS(data,fdata_save1,Sample_Size,PLS_para);
                                    FDR_PLS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    MT2FD_PLS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1);
                                end
                                if  f_parameter.Detection_method(:,2)==1 % if SCCA method is selected
                                    [FDR_,MT2FD_] = online_SCCA(data,fdata_save1,Sample_Size,SCCA_para);
                                    FDR_SCCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    MT2FD_SCCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1);
                                end
                                if  f_parameter.Detection_method(:,3)==1 % if LS method is selected
                                    [FDR_,MT2FD_] = online_LS(data,fdata_save1,Sample_Size,LS_para);
                                    FDR_LS_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    MT2FD_LS_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1);
                                end
                                k_intiger=k_intiger+1;
                            end
                        end
                        
                        if  f_parameter.Detection_method(:,1)==1 % if PLS method is selected
                            FDR_PLS_p(j)=sum(FDR_PLS_aid);
                            MT2FD_PLS_p(j)=sum(MT2FD_PLS_aid)/100;
                            FDR_PLS_pp(j)=sum(FDR_PLS_aid)*Pattern_pro(j)/100;
                            MT2FD_PLS_pp(j)=sum(MT2FD_PLS_aid)*Pattern_pro(j)/10000;
                        end
                        if  f_parameter.Detection_method(:,2)==1 % if SCCA method is selected
                            FDR_SCCA_p(j)=sum(FDR_SCCA_aid);
                            MT2FD_SCCA_p(j)=sum(MT2FD_SCCA_aid)/100;
                            FDR_SCCA_pp(j)=sum(FDR_SCCA_aid)*Pattern_pro(j)/100;
                            MT2FD_SCCA_pp(j)=sum(MT2FD_SCCA_aid)*Pattern_pro(j)/10000;
                        end
                        if  f_parameter.Detection_method(:,3)==1 % if LS method is selected
                            FDR_LS_p(j)=sum(FDR_LS_aid);
                            MT2FD_LS_p(j)=sum(MT2FD_LS_aid)/100;
                            FDR_LS_pp(j)=sum(FDR_LS_aid)*Pattern_pro(j)/100;
                            MT2FD_LS_pp(j)=sum(MT2FD_LS_aid)*Pattern_pro(j)/10000;
                        end
                    end
                    % delete wait bar
                    if ishandle(H)
                        delete(H);
                    end
                    if  f_parameter.Detection_method(:,1)==1 % if PLS method is selected
                        FDR_p=FDR_PLS_p';
                        MT2FD_p=MT2FD_PLS_p'*Ts;
                        FDR=sum(FDR_PLS_pp);
                        MT2FD=sum(MT2FD_PLS_pp)*Ts;
                    end
                    if  f_parameter.Detection_method(:,2)==1 % if SCCA method is selected
                        FDR_p=[FDR_p FDR_SCCA_p'];
                        MT2FD_p=[MT2FD_p MT2FD_SCCA_p'*Ts];
                        FDR=[FDR sum(FDR_SCCA_pp)];
                        MT2FD=[MT2FD sum(MT2FD_SCCA_pp)*Ts];
                    end
                    if  f_parameter.Detection_method(:,3)==1 % if LS method is selected
                        FDR_p=[FDR_p FDR_LS_p'];
                        MT2FD_p=[MT2FD_p MT2FD_LS_p'*Ts'];
                        FDR=[FDR sum(FDR_LS_pp)];
                        MT2FD=[MT2FD sum(MT2FD_LS_pp)*Ts];
                    end

                end

                
                case 3 % DPCA,and DCCA and also for custom algorithm
              
                % now, only do changes for the first part, after discussion of the
                % advised change of GUI--no case 1, case 2 and 3, only data driven
                % and model driven,man can delete this explain.

                FAR=[];FDR=[];MT2FD=[];FDR_p=[];MT2FD_p=[];
                
                %%%%may be unusefull
                FDR_DCCA_p=[];MT2FD_DCCA_p=[];FDR_DCCA_pp=[];MT2FD_DCCA_pp=[];
                FDR_DPCA_p=[];MT2FD_DPCA_p=[];FDR_DPCA_pp=[];MT2FD_DPCA_pp=[];
               
                %%% original data generation / nominal system data
                % stable random system generation
                N=f_parameter.Dpmodel(1,1);
                ni=f_parameter.Dpmodel(1,2);
                no=f_parameter.Dpmodel(1,3);
                method=f_parameter.Dpmodel(1,3);
                Sample_Size=f_parameter.Sample_Size;
                Ts=0.01;
                for i = 1:100 % get rid of marginally stable system
                    %sysd = drss(model_dim(1),model_dim(2),model_dim(3));
                     [A,B,C,D] = random_Model( N,ni,no,method);
                     sys = ss(A,B,C,D,Ts);
                     Sigma = svd(sys.a'*sys.a);
                     if sqrt(Sigma(1)) <= 0.99
                         break
                     end
                end
                
                %%%training data generation
                [input,output,t_steady] = datagenDynamic(f_parameter.Dpmodel,sys);
                
                %% -------------------offline training -----------------------
                if  f_parameter.Detection_method(:,1)==1 % if DPCA method is selected
                    DCCA_para = trainingDCCA(input,output,f_parameter.FAR_estimation);%
                end
                if  f_parameter.Detection_method(:,2)==1 % if DCCA method is selected
                    DPCA_para = trainingDPCA(input,output,f_parameter.FAR_estimation);
                end
                
                %% ------------------ offline FAR estimation -----------------------
                FAR_dpca=[];FAR_dcca=[];
                
                
                
                if f_parameter.Dpmodel(2,1)==1 %% here is uncertainties in the matrix A
                    Au=A;
                    na=numel(Au); %% the NO. of elements of matrix A
                    %%% randomly add uncertainty to A
                    Au0=Au(randperm(na, randi([1,na]))); %% randomly choose the elements from A0
                end
                if f_parameter.Dpmodel(2,2)==1 %% here is uncertainties in the matrix B
                   Bu=B;
                   nb=numel(Bu); %% the NO. of elements of matrix B
                   %%% randomly add uncertainty to B
                   Bu0=Bu(randperm(nb, randi([1,nb]))); %% randomly choose the elements from B
                end
                if f_parameter.Dpmodel(2,3)==1 %% here is uncertainties in the matrix C
                   Cu=C;
                   nc=numel(Cu); %% the NO. of elements of matrix B
                    %%% randomly add uncertainty to B
                   Cu0=Cu(randperm(nc, randi([1,nc]))); %% randomly choose the elements from B
                end
                if f_parameter.Dpmodel(2,4)==1 %% here is uncertainties in the matrix C
                   Du=D;
                   nd=numel(Du); %% the NO. of elements of matrix B
                   %%% randomly add uncertainty to B
                   Du0=Du(randperm(nd, randi([1,nd]))); %% randomly choose the elements from B
                end
                
                
                H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                    'WindowStyle','Modal');
                
                for i=1:Sample_Size
                    str = ['Calculating FAR...', num2str(round((i-1)/Sample_Size*100)), '%'];
                    if ishandle(H)
                       waitbar((i-1)/Sample_Size,H,str);
                    else
                        return;
                    end
                    if f_parameter.Dpmodel(2,1)==1 %% here is uncertainties in the matrix A
                        for ia=1:length(Au0)
                            [x,y] = find(Au == Au0(ia));  % find the location of selected elements in A0
                            %Au(x,y)=Au0(ia)*(1+f_parameter.Dpmodel(1,5)/100)+(Au0(ia)*(1+f_parameter.Dpmodel(2,5)/100)-Au0(ia)*(1+f_parameter.Dpmodel(1,5)/100))*rand(1);
                            Au(x,y)= Au0(ia)*(1+randsrc*(f_parameter.Dpmodel(1,5)/100+(f_parameter.Dpmodel(2,5)/100 -f_parameter.Dpmodel(1,5)/100)*rand(1)));
                        end
                    else
                        Au=A;
                    end
                    if f_parameter.Dpmodel(2,2)==1 %% here is uncertainties in the matrix B
                        for ib=1:length(Bu0)
                            [x,y] = find(Bu == Bu0(ib));  % find the location of selected elements in B
                            %Bu(x,y)=Bu0(ib)*(1+f_parameter.Dpmodel(1,5)/100)+(Bu0(ib)*(1+f_parameter.Dpmodel(2,5)/100)-Bu0(ib)*(1+f_parameter.Dpmodel(1,5)/100))*rand(1);
                            Bu(x,y)= Bu0(ib)*(1+randsrc*(f_parameter.Dpmodel(1,5)/100+(f_parameter.Dpmodel(2,5)/100 -f_parameter.Dpmodel(1,5)/100)*rand(1)));
                        end
                    else
                        Bu=B;
                    end
                    if f_parameter.Dpmodel(2,3)==1 %% here is uncertainties in the matrix C
                        for ic=1:length(Cu0)
                            [x,y] = find(Cu == Cu0(ic));  % find the location of selected elements in B
                            %Cu(x,y)=Cu0(ic)*(1+f_parameter.Dpmodel(1,5)/100)+(Cu0(ic)*(1+f_parameter.Dpmodel(2,5)/100)-Cu0(ic)*(1+f_parameter.Dpmodel(1,5)/100))*rand(1);
                            Cu(x,y)= Cu0(ic)*(1+randsrc*(f_parameter.Dpmodel(1,5)/100+(f_parameter.Dpmodel(2,5)/100 -f_parameter.Dpmodel(1,5)/100)*rand(1)));
                        end
                    else
                        Cu=C;
                    end
                    if f_parameter.Dpmodel(2,4)==1 %% here is uncertainties in the matrix C
                        for id=1:length(Du0)
                            [x,y] = find(Du == Du0(id));  % find the location of selected elements in B
                            %Du(x,y)=Du0(id)*(1+f_parameter.Dpmodel(1,5)/100)+(Du0(id)*(1+f_parameter.Dpmodel(2,5)/100)-Du0(id)*(1+f_parameter.Dpmodel(1,5)/100))*rand(1);
                            Du(x,y)= Du0(id)*(1+randsrc*(f_parameter.Dpmodel(1,5)/100+(f_parameter.Dpmodel(2,5)/100 -f_parameter.Dpmodel(1,5)/100)*rand(1)));
                        end
                    else
                        Du=D;
                    end
                    
                    SYS=ss(Au,Bu,Cu,Du,Ts);
                    [inputu,outputu] = datagenDynamic_un(f_parameter.Dpmodel,SYS,t_steady);
                    
                    % FAR calculation
                    if f_parameter.Estimation_method(1)==1
                        if  f_parameter.Detection_method(:,1)==1 % if DCCA method is selected
                            % ---- FAR calculation --------------
                            FAR_dcca(i) = FAR_DCCA(inputu,outputu,DCCA_para);%
                        end
                        if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                            % ---- FAR calculation --------------
                            FAR_dpca(i) = FAR_DPCA(inputu,outputu,DPCA_para);%
                        end
                    end
                end
                
                if ishandle(H)
                   delete(H);
                end
                
                if  f_parameter.Detection_method(:,1)==1 % if SCCA method is selected
                    FAR = mean(FAR_dcca)*100;%
                  
                end
                if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                    FAR = [FAR mean(FAR_dpca)*100];%
                end
                
                %% ------------------------- online FDR estimation -----------------------
                % initialization
                % if the custom use GUI to generate fault model
                if c_parameter.Choice(5,3)==1 
                   Pattern_Nr = f_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = f_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = f_parameter.Pattern_pro; % get the probability matrix in the pattern level
   
                % if the custom load fault model    
                elseif c_parameter.Choice(5,1)==1
                   Pattern_Nr = c_parameter.Pattern_Nr; % get the pattern number
                   Fault_Pattern = c_parameter.Fault_Pattern; % get the fault pattern matrix
                   Pattern_pro = c_parameter.Pattern_pro; % get the probability matrix in the pattern level
                       
                else 
                   disp('Error. Please generate or upload fault model.')
                   return
                end
                
                if f_parameter.Estimation_method(2)==1
                    
                    % Setting wait bar
                    H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
                    'WindowStyle','Modal');
                    
                    k_stop=100;
                    Ts=0.01;
                    
                    % if DCCA method is selected
                    if  f_parameter.Detection_method(:,1)==1 
                        FDR_s_dcca=zeros(1,Pattern_Nr);
                        MT2FD_s_dcca=zeros(1,Pattern_Nr);
                    end
                    % if DPCA method is selected
                    if  f_parameter.Detection_method(:,2)==1 
                        FDR_s_dpca=zeros(1,Pattern_Nr);
                        MT2FD_s_dpca=zeros(1,Pattern_Nr);
                    end
                    
                    % initial input
                    U0 = zeros(2500,ni)+4e-3*randn(2500,ni); %%%%%%%%%%%%%
                    Ynoise = 1e-3*randn(2500,no);
      
                    for i=1:Sample_Size
                        
                        % wait bar 
                        str = ['FD performance evaluating...', num2str(round((i-1)/Sample_Size*100)), '%'];
                        
                        if ishandle(H)
                            waitbar((i-1)/Sample_Size,H,str);
                        else
                            return;
                        end
                        
                    %[fault_data,probability] = fault_data_gen(data,f_parameter,Sample_Size,k_stop);
                    try %generate fault data
                        fault_f=f_parameter.fault_data;
                        Pro_f=f_parameter.probability;
                    catch
                       [fault_f,Pro_f] = fault_data_gen1(f_parameter,c_parameter,600,Ts); % get 600 samples
                    end
                    
                  

                    for j=1:Pattern_Nr % how many patterns we have, the out side cycle
                                       
                        fault_f_new={};
                        Pro_f_new={};
                        %fdata_save={};
                        
                        fault_location=find(Fault_Pattern(j,:)>0); % find which kind of fault exists in the certain pattern
                        le=length(fault_location); % how many faults has the certain pattern 
                        for k=1:le
                            fault_f_new{k}=fault_f{fault_location(k)}; % find the new fault_f cell
                            Pro_f_new{k}=Pro_f{fault_location(k)};
                        end
                        
                        le1=length(fault_f_new{1});
                        position1=f_parameter.Fault_position(fault_location(1),1); % find the fault's position
                        
                        k_intiger=1;
                        FDR_DCCA_aid=[];MT2FD_DCCA_aid=[];
                        FDR_DPCA_aid=[];MT2FD_DPCA_aid=[];
                        
                        for k1=1:le1
                                
                            % add fault data depending on fault position
                            ni=f_parameter.Dpmodel(1,2);
                            %no=f_parameter.Dpmodel(1,3); 
                            Time = (0:Ts:Ts*(2500-1))';
                                   
                            %U1 = ones(2500,ni)+4e-3*randn(2500,ni); %%%%%%%%%%%%%
                            U1=U0;
                            if position1 <= ni
                               
                               if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
                                  U1(t_steady+1:t_steady+600,position1)=U1(t_steady+1:t_steady+600,position1)+fault_f_new{1}{k1}';
                                  
                               elseif f_parameter.Fault_position(fault_location(1),3)==1; % multiplicative fault
                                  U1(t_steady+1:t_steady+600,position1)=U1(t_steady+1:t_steady+600,position1).*fault_f_new{1}{k1}';
                               end
                            end
                                   
                            if le>1 % more than one fault
                               le2=length(fault_f_new{2});
                               position2=f_parameter.Fault_position(fault_location(2),1); % find the fault's position
                               for k2=1:le2
                                    U2=U1;
                                    %Y2=Y1;
                                    if position2 <= ni
                                       if f_parameter.Fault_position(fault_location(2),2)==1; % addictive fault
                                          U2(t_steady+1:t_steady+600,position2)=U2(t_steady+1:t_steady+600,position2)+fault_f_new{1}{k1}';
                                       elseif f_parameter.Fault_position(fault_location(2),3)==1; % multiplicative fault
                                          U2(t_steady+1:t_steady+600,position2)=U2(t_steady+1:t_steady+600,position2).*fault_f_new{1}{k1}';
                                       end
                                    end
                                    
                                    [Y2, ~ ]=lsim(sys,U2,Time);
                                    Y2=Y2+Ynoise;
                                         
                                    if position2 > ni
                                       if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
                                          Y2(t_steady+1:t_steady+600,position2-ni)=Y2(t_steady+1:t_steady+600,position2-ni)+fault_f_new{1}{k1}';
                                       elseif f_parameter.Fault_position(fault_location(1),3)==1; % multiplicative fault
                                          Y2(t_steady+1:t_steady+600,position2-ni)=Y2(t_steady+1:t_steady+600,position2-ni).*fault_f_new{1}{k1}';
                                       end
                                    end
                                    inputf = U2(t_steady+1:t_steady+600,:); % choose 600 samples to do fault detection
                                    outputf = Y2(t_steady+1:t_steady+600,:);
                                    %fdata2 = [data,quality];
                                    %%% only two faults in this pattern,
                                    %%% can do FDR now
                                    if  f_parameter.Detection_method(:,1)==1 % if DCCA method is selected
                                        [FDR_,MT2FD_] = online_DCCA(input,output,inputf,outputf,DCCA_para,k_stop);
                                        FDR_DCCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                        
                                        
                                        MT2FD_DCCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                    end
                                    if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                                        [FDR_,MT2FD_] = online_DPCA(input,output,inputf,outputf,DPCA_para,k_stop);
                                        FDR_DPCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                        
                                        
                                        MT2FD_DPCA_aid(k_intiger)=MT2FD_*Pro_f_new{1}(k1)*Pro_f_new{2}(k2)/100;
                                    end
                                    k_intiger=k_intiger+1;
                               end
                            else
                                %%% only one fault in the pattern, can do
                                %%% FDR now
                               
                                [Y1, ~ ]=lsim(sys,U1,Time);
                                Y1=Y1+Ynoise;
                                    
                                if position1 > ni
                                   if f_parameter.Fault_position(fault_location(1),2)==1; % addictive fault
                                      Y1(t_steady+1:t_steady+600,position1-ni)=Y1(t_steady+1:t_steady+600,position1-ni)+fault_f_new{1}{k1}';
                                   elseif f_parameter.Fault_position(fault_location(1),3)==1; % multiplicative fault
                                      Y1(t_steady+1:t_steady+600,position1-ni)=Y1(t_steady+1:t_steady+600,position1-ni).*fault_f_new{1}{k1}';
                                   end
                                  
                                   Y1=Y1+Ynoise;
                                end
                                        
                                inputf = U1(t_steady+1:t_steady+600,:); % choose 600 samples to do fault detection
                                outputf = Y1(t_steady+1:t_steady+600,:);
                                %fdata1 = [data,quality]; 
                                    
                                if  f_parameter.Detection_method(:,1)==1 % if DCCA method is selected
                                    [FDR_,MT2FD_] = online_DCCA(input,output,inputf,outputf,DCCA_para,k_stop);
                                    FDR_DCCA_aid(k_intiger)=FDR_*Pro_f_new{1}(k1);
                                    
                                    
                                    MT2FD_DCCA_aid(k_intiger)= MT2FD_*Pro_f_new{1}(k1);
                                end
                                if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                                    [FDR_,MT2FD_] = online_DPCA(input,output,inputf,outputf,DPCA_para,k_stop);
                                    FDR_DPCA_aid(k_intiger)= FDR_*Pro_f_new{1}(k1);
                                    
                                    
                                    MT2FD_DPCA_aid(k_intiger)= MT2FD_*Pro_f_new{1}(k1);
                                end
                                k_intiger=k_intiger+1;
                            end
                        end
                        
                        % if DCCA method is selected    
                        if  f_parameter.Detection_method(:,1)==1 
                            fdr_dcca(j)=sum(FDR_DCCA_aid);
                            mt2fd_dcca(j)=sum(MT2FD_DCCA_aid);
                        end
                        if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                            fdr_dpca(j)=sum(FDR_DPCA_aid);
                            mt2fd_dpca(j)=sum(MT2FD_DPCA_aid);
                        end

                    end

                        % if DCCA method is selected
                        if  f_parameter.Detection_method(:,1)==1 
                            FDR_s_dcca=FDR_s_dcca+ fdr_dcca;
                            MT2FD_s_dcca=MT2FD_s_dcca+mt2fd_dcca;
                        end

                        % if DPCA method is selected
                        if  f_parameter.Detection_method(:,2)==1 
                            FDR_s_dpca=FDR_s_dpca+ fdr_dpca;
                            MT2FD_s_dpca=MT2FD_s_dpca+mt2fd_dpca;
                        end
  
                    end
                    % delete wait bar
                    if ishandle(H)
                        delete(H);
                    end
                    

                    % final FDR and MT2FD
                    Pro=Pattern_pro;
                    Pro(:,all(Pro==0,1))=[];
                      
                    if  f_parameter.Detection_method(:,1)==1 % if DCCA method is selected
                        FDR_p=FDR_s_dcca'/Sample_Size;
                        MT2FD_p=MT2FD_s_dcca'/Sample_Size*Ts/100;
                        FDR=Pro*FDR_s_dcca'/Sample_Size/100;
                        MT2FD=Pro*MT2FD_s_dcca'/Sample_Size*Ts/10000;
                    end
                    if  f_parameter.Detection_method(:,2)==1 % if DPCA method is selected
                        FDR_p=[FDR_p FDR_s_dpca'/Sample_Size];
                        MT2FD_p=[MT2FD_p MT2FD_s_dpca'/Sample_Size*Ts/100];
                        FDR=[FDR Pro*FDR_s_dpca'/Sample_Size/100];
                        MT2FD=[MT2FD Pro*MT2FD_s_dpca'/Sample_Size*Ts/10000];
                    end
                end

        end
end
