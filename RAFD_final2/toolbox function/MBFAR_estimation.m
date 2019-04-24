function [FAR,Jth,far,J_th]=MBFAR_estimation(f_parameter,c_parameter)
% MBFAR_ratimation: model based false alarm rate
% Call:
%        [FAR,Jth,far,J_th]=MBFAR_estimation(f_parameter)
%
% Inputs:
%            f_parameter - design parameters
% Outputs: 
%           FAR - false alarm rate 
%           Jth - final max thereshold
%           far - false alarm rate of each case (disturbances, uncertainty and both of them)
%           J_th - max thereshold of each case (disturbances, uncertainty and both of them)
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
H = waitbar(0,'Please wait.','CreateCancelBtn',@btnWaitbarCancel_Callback,...
               'WindowStyle','Modal');
Sample_Size=f_parameter.Sample_Size;
        % if custom uses the GUI to type in the system model
        if c_parameter.Choice(1,2)==1
           %disp('Type in the system')
           % get system matrix A B C D 
           A=f_parameter.Sys_matrix{1}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(1));
           B=f_parameter.Sys_matrix{2}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(2));
           C=f_parameter.Sys_matrix{3}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(1));
           
           %%%%%%%%%%%%%%------------  re-check here --------------------------------
           % if there D is needed
           %D=zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2));
           %%%%%%%%%%%%%% ------------------------------------------------------------
           
           Ed=f_parameter.Sys_matrix{4}(1:f_parameter.Sys_dim(1),1:f_parameter.Sys_dim(4));
           Fd=f_parameter.Sys_matrix{5}(1:f_parameter.Sys_dim(3),1:f_parameter.Sys_dim(4));

        % if custom load the system model   
        elseif c_parameter.Choice(1,1)==1
            %disp('Load in system model')
            % get system matrix A,B,C,D,Ed,Fd
            A=c_parameter.Process_model{1};
            B=c_parameter.Process_model{2};
            C=c_parameter.Process_model{3};
            
            %%%%%%%%%%%%%%------------  re-check here --------------------------------
            % what happends if the custom does not load Ed or Fd. default
            % value is, if there is no, then it will be an empty matrix.
            Ed=c_parameter.Process_model{5};
            Fd=c_parameter.Process_model{6};
            % -----------------------------------------------------------------------
            if (isempty(Ed)& isempty(Fd))==1 % if Ed and Fd are both empty
                if (f_parameter.FAR_estimation{2}(1,1)==1 | f_parameter.FAR_estimation{2}(3,1)==1)==1
                    % if FAR estimation under disturbance situation is selected
                    disp('Erro. There are no ''Ed'' and ''Fd'', but FAR estimation under disturbance situation is selected. ')
                    return
                end
            else
                if isempty(Ed)==1 % if Ed is empty
                   Ed=zeros(size(A,1),size(Fd,2));
                elseif isempty(Fd)==1 % if Fd is empty
                   Fd=zeros(size(C,1),size(Ed,2));
                end
            end
            
            % get matrix D
            %if isempty(c_parameter.Process_model{4})==1
            %   D=zeros(size(C,1),size(B,2));
            %else
            %   D=c_parameter.Process_model{4};
            %end
               
        else
           disp('Error. Please check the ''Process Model''.') 
           return
        end

        %% initialization of generating input data and disturbances 
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
              indicator=1;
           elseif size(u,1)==input_dim
              t=0:Ts:(size(u,2)-1)*Ts; 
              indicator=0;
           else
               disp('Error. Please check the dimesion of input siganl')
           end
        else
           disp('Error. Please check the ''Load Input Signal''.') 
           return
        end
        
        % if custom uses the default disturbances
        if c_parameter.Choice(2,2)==0
           % if there is disturbances
           if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
               
              % ----------- check here, if the sample size can nor be divided by 10. such as 4999.----------------------------------------------------------
              % disturbance initilization
              
              dis_dim=size(Ed,2); % the disturbances dimension
              
              if indicator==1; % the input dignal is defined in the colum way
                 wd = fix(size(u,1)/10);
                 d=zeros(size(u,1),dis_dim); % disturbance
              elseif indicator==0; % the input dignal is defined in the row way
                 wd = fix(size(u,2)/10); 
                 d=zeros(dis_dim,size(u,2)); % disturbance
              end
              % -----------------------------------------------------------------------------------------
           end
           
        % if custom load the disturbances   
        elseif c_parameter.Choice(2,2)==1 
             % if there is disturbances
             if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
                Ts=f_parameter.Samp_time;
                disturbance = c_parameter.Disturbance;
            
                % ------------- check here , not correct-------------------
                %[dr,dc]=size(disturbance);
                
                %if indicator==1; % the input dignal is defined in the colum way
                %    
                %   if dc~=Sample_Size % check the loaded disturbance size, if there are numbers of Sample_Size of disturbances cases
                %      disp('Error. Please check the dimension of loaded disturbance.')
                %      return
                %   elseif dr~=size(u,1) % to check the dimension of each disturbance case with the size of loaded input signal
                %      disp('Error. Please check the dimension of loaded disturbance.') 
                %      return
                %   end
                   
                %elseif indicator==0; % the input dignal is defined in the row way
                
                %    if dr~=Sample_Size % check the loaded disturbance size, if there are numbers of Sample_Size of disturbances cases
                %       disp('Error. Please check the dimension of loaded disturbance.')
                %       return
                %    elseif dc~=size(u,2) % to check the dimension of each disturbance case with the size of loaded input signal
                %       disp('Error. Please check the dimension of loaded disturbance.') 
                %       return
                %    end
                
                %end
                    
                    
                    
                % --------------------------------------------     
             end
        else
            disp('Error. Please check the ''Load Disturbance''.') 
            return
        end
        
        
        %% initiallization of observer gain matrix and postfilter
        % if the custom uses the GUI to type into the observer gain matrix
        % and post filter
        if c_parameter.Choice(4,2)==1
           % Get observer gain matrix L
           if f_parameter.Residual{1}(2)==1  % Unite solution
              L= f_parameter.Residual{3};
              V= f_parameter.Residual{4};
              
              % if there is disturbances
              if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
                 % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                 A_bar=[A zeros(size(A)); zeros(size(A)) A-L*C];
                 Erd_bar=[B Ed;zeros(size(B)) Ed-L*Fd];
                 C_bar=[V*zeros(size(C)) V*C];
                 Frd_bar=[V*zeros(size(C,1),size(B,2)) V*Fd]; 
                 sysd=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
              end
               
           else % not unit solution, kalman filter or given L
              L=f_parameter.Residual{3}(1:size(A,1),1:size(C,1)); 
              
              % if there is disturbances
              if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
                 % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                 A_bar=[A zeros(size(A)); zeros(size(A)) A-L*C];
                 Erd_bar=[B Ed;zeros(size(B)) Ed-L*Fd];
                 C_bar=[zeros(size(C)) C];
                 Frd_bar=[zeros(size(C,1),size(B,2)) Fd]; 
                 sysd=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
              end
              
           end

        % if the custom uses the loading observer function
        elseif c_parameter.Choice(4,1)==1
            
            if isfield(c_parameter,'Filter')==1 % there is one post filter
               L=c_parameter.Filter_gain;
               V=c_parameter.Filter;
               
               % if there is disturbances
               if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
                  % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                  A_bar=[A zeros(size(A)); zeros(size(A)) A-L*C];
                  Erd_bar=[B Ed;zeros(size(B)) Ed-L*Fd];
                  C_bar=[V*zeros(size(C)) V*C];
                  Frd_bar=[V*zeros(size(C,1),size(B,2)) V*Fd]; 
                  sysd=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
               end
              
            else
                L=c_parameter.Filter_gain;
                
                 % if there is disturbances
                if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
                   % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                   A_bar=[A zeros(size(A)); zeros(size(A)) A-L*C];
                   Erd_bar=[B Ed;zeros(size(B)) Ed-L*Fd];
                   C_bar=[zeros(size(C)) C];
                   Frd_bar=[zeros(size(C,1),size(B,2)) Fd]; 
                   sysd=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                end
              
            end
            
        else
            disp('Error. Please check the ''Load Existing Filter Gain/Filter''.') 
            return
        end
        %% ------------- Uncertainty Initialization if there is uncertainty -------
        
        if f_parameter.FAR_estimation{2}(2,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1
           
            % if the custom uses the GUI to type in the uncertainty
            if c_parameter.Choice(3,4)==1 
                
               if size(f_parameter.Uncertainty,2)==7 % if it is polytopic uncertainty
               % ------------------- polytopic uncertainty initialization---------------------
               
               
                  % get uncertainty for matrix A
                  if f_parameter.Uncertainty{1}(1)==1
                     Aum=f_parameter.Uncertainty{2}; % matrix of Au
                     % one way to get polytopic uncertainty of A 
                     % not very good, in the case of A=[0 0;1 2], it works not well
                     %Aum(all(Aum==0,2),:)=[]; % get ride of the all zeros line
                     %Aum(:,all(Aum==0,1))=[]; % get ride of the all zeros columm
                     %decom=f_parameter.Sys_dim(1)*ones(1,f_parameter.Uncertainty{1}(6));
                     %Au=mat2cell(Aum,decom); % mat2cell decomposition based on vector decom

                     % another way to do it, not so smart way
                     Au=mat2cell(Aum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                     for kl=1:f_parameter.Uncertainty{1}(6)
                         Au{kl}=Au{kl}(1:size(A,1),1:size(A,1));
                     end
                  end
                  % get uncertainty for matrix B
                  if f_parameter.Uncertainty{1}(2)==1
                     Bum=f_parameter.Uncertainty{3}; % matrix of Bu

                     Bu=mat2cell(Bum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                     for kl=1:f_parameter.Uncertainty{1}(6)
                         Bu{kl}=Bu{kl}(1:size(A,1),1:size(B,2));
                     end
                  end
                  % get uncertainty for matrix C
                  if f_parameter.Uncertainty{1}(3)==1
                     Cum=f_parameter.Uncertainty{4}; % matrix of Cu

                     Cu=mat2cell(Cum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                     for kl=1:f_parameter.Uncertainty{1}(6)
                         Cu{kl}=Cu{kl}(1:size(C,1),1:size(A,1));
                     end
                  end
                  % get uncertainty for matrix D
                  if f_parameter.Uncertainty{1}(4)==1
                     Dum=f_parameter.Uncertainty{5}; % matrix of Du

                     Du=mat2cell(Dum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                     for kl=1:f_parameter.Uncertainty{1}(7)
                         Du{kl}=Du{kl}(1:size(C,1),1:size(B,2));
                     end
                  end
               
                  % there are uncertainty and disturbance the same time
                  if f_parameter.FAR_estimation{2}(3,1)==1 
                      % get uncertainty for matrix Ed
                      if f_parameter.Uncertainty{1}(5)==1
                         Edum=f_parameter.Uncertainty{6}; % matrix of Edu

                         Edu=mat2cell(Edum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                         for kl=1:f_parameter.Uncertainty{1}(6)
                             Edu{kl}=Edu{kl}(1:size(A,1),1:size(Ed,2));
                         end
                      end
                      % get uncertainty for matrix Fd
                      if f_parameter.Uncertainty{1}(6)==1
                         Fdum=f_parameter.Uncertainty{7}; % matrix of Fdu

                         Fdu=mat2cell(Fdum,[3 3 3 3]); % mat2cell decomposition based on vector [3 3 3]
                         for kl=1:f_parameter.Uncertainty{1}(6)
                             Fdu{kl}=Fdu{kl}(1:size(C,1),1:size(Ed,2));
                         end
                      end 
                  end
                  
               elseif size(f_parameter.Uncertainty,2)==8 % if it is parameter uncertainty
                
                   % ------------------- parameter uncertainty initilization -------------------
                    % get parameter changing range for matrix A
                    if f_parameter.Uncertainty{1}(1)==1
                       Au=mat2cell(f_parameter.Uncertainty{3},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                       Au=Au(1:size(A,1),1:size(A,1)); % cell of Au changing range
                    end
                    % get parameter changing range for matrix B
                    if f_parameter.Uncertainty{1}(2)==1
                       Bu=mat2cell(f_parameter.Uncertainty{4},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                       Bu=Bu(1:size(A,1),1:size(B,2)); % cell of Au changing range
                    end
                    % get parameter changing range for matrix C
                    if f_parameter.Uncertainty{1}(3)==1
                       Cu=mat2cell(f_parameter.Uncertainty{5},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                       Cu=Cu(1:size(C,1),1:size(A,1)); % cell of Au changing range
                    end
                    % get parameter changing range for matrix D
                    if f_parameter.Uncertainty{1}(4)==1
                       Du=mat2cell(f_parameter.Uncertainty{6},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                       Du=Du(1:size(C,1),1:size(B,2)); % cell of Au changing range
                    end
                    
                    % there are uncertainty and disturbance the same time
                    if f_parameter.FAR_estimation{2}(3,1)==1 
                        % get parameter changing range for matrix Ed
                        if f_parameter.Uncertainty{1}(5)==1
                           Edu=mat2cell(f_parameter.Uncertainty{7},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                           Edu=Edu(1:size(A,1),1:size(Ed,2)); % cell of Au changing range
                        end
                        % get parameter changing range for matrix Fd
                        if f_parameter.Uncertainty{1}(6)==1
                           Fdu=mat2cell(f_parameter.Uncertainty{8},[1 1 1],[2 2 2]); % mat2cell decomposition based on vector [1 1 1] and [2 2 2]
                           Fdu=Fdu(1:size(C,1),1:size(Ed,2)); % cell of Au changing range
                        end
                    end
               end
               
            %if the custom load the polytopic uncertainty
            elseif c_parameter.Choice(3,3)==1 && c_parameter.Choice(3,1)==1 
                
                if isempty(c_parameter.Poly_uncertainty{1})==0 % the uncertainty of A is not empty
                   Au=c_parameter.Poly_uncertainty{1};
                   rnc=length(Au);
                end
                
                if isempty(c_parameter.Poly_uncertainty{2})==0 % the uncertainty of B is not empty
                   Bu=c_parameter.Poly_uncertainty{2};
                   rnc=length(Bu);
                end
                
                if isempty(c_parameter.Poly_uncertainty{3})==0 % the uncertainty of C is not empty
                   Cu=c_parameter.Poly_uncertainty{3};
                   rnc=length(Cu);
                end
                
                if isempty(c_parameter.Poly_uncertainty{4})==0 % the uncertainty of D is not empty
                   Du=c_parameter.Poly_uncertainty{4};
                   rnc=length(Du);
                end
                
                if isempty(c_parameter.Poly_uncertainty{5})==0 % the uncertainty of Ed is not empty
                   Edu=c_parameter.Poly_uncertainty{5};
                   rnc=length(Edu);
                end
                
                if isempty(c_parameter.Poly_uncertainty{6})==0 % the uncertainty of Fd is not empty
                   Fdu=c_parameter.Poly_uncertainty{6};
                   rnc=length(Fdu);
                end  
                
            %if the custom load the parameter uncertainty
            elseif c_parameter.Choice(3,3)==1 && c_parameter.Choice(3,2)==1 
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               %.....
            else
                
               disp('Error. Please check the ''Loaded Uncertainty''.')
               return
            end
        end
        

        %% ------------------------- FAR estimation ------------------------------------
        
        far=[];J_th=[];
        

        for is=1:Sample_Size
            
            str = ['Calculating FAR...', num2str(round((is-1)/Sample_Size*100)), '%'];
            if ishandle(H)
               waitbar((is-1)/Sample_Size,H,str);
            else
               return;
            end
            % ---------- if there is disturbance ---------
            if f_parameter.FAR_estimation{2}(1,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1 
               % disturbance
               % if custom uses the default disturbances
               if c_parameter.Choice(2,2)==0
                   
                  dis_dim=size(Ed,2); % the disturbances dimension
                  if indicator==1; % the input dignal is defined in the colum way
                     for idd=1:dis_dim
                          for id=1:10
                              d(wd*(id-1)+1:wd*id,idd)= 0.05.*rand(1)*ones(wd,1);
                          end
                          if wd*10~=size(u,1)
                             d(wd*10+1:size(u,1),idd)= 0.05.*rand(1)*ones(wd,1);
                          end
                     end
                      
                  elseif indicator==0; % the input dignal is defined in the row way
                      
                     for idd=1:dis_dim
                          for id=1:10
                              d(idd,wd*(id-1)+1:wd*id)= 0.05.*rand(1)*ones(wd,1);
                          end
                          if wd*10~=size(u,2)
                             d(idd,wd*10+1:size(u,1))= 0.05.*rand(1)*ones(wd,1);
                          end
                     end 
                  end     
                   
               % if custom load the disturbances   
               elseif c_parameter.Choice(2,2)==1
                   % ----------------check here --------------
                   d=disturbance(:,is);
                   % not right till now ----------------------
               end
            end
            
            % ------------ if there is uncertainty ------------
            if f_parameter.FAR_estimation{2}(2,1)==1 || f_parameter.FAR_estimation{2}(3,1)==1
                % if the custom uses the GUI to type in the uncertainty
                if c_parameter.Choice(3,4)==1 
                   if size(f_parameter.Uncertainty,2)==7 % if it is polytopic uncertainty
                      % get polytopic uncertaity matrix of each related matrix A or B or C or Ed or Fd
                      rn = rand(f_parameter.Uncertainty{1}(7),1);
                      rn_sum=sum(rn);
                      rn=rn/rn_sum;
                      Ai=zeros(size(A));
                      Bi=zeros(size(B));
                      Ci=zeros(size(C));
                      Di=zeros(size(C,1),size(B,2));
                      if f_parameter.Uncertainty{1}(1)==1
                          for iter=1:f_parameter.Uncertainty{1}(6)
                              Ai_=rn(iter)*Au{iter};
                              Ai=Ai+Ai_;
                          end
                      end
                      if f_parameter.Uncertainty{1}(2)==1
                          for iter=1:f_parameter.Uncertainty{1}(6)
                              Bi_=rn(iter)*Bu{iter};
                              Bi=Bi+Bi_;
                          end
                      end
                      if f_parameter.Uncertainty{1}(3)==1
                          for iter=1:f_parameter.Uncertainty{1}(6)
                              Ci_=rn(iter)*Cu{iter};
                              Ci=Ci+Ci_;
                          end
                      end
                    
                      if f_parameter.Uncertainty{1}(4)==1
                         for iter=1:f_parameter.Uncertainty{1}(6)
                             Di_=rn(iter)*Du{iter};
                             Di=Di+Di_;
                         end
                      end
                    
                      % there are uncertainty and disturbance the same time
                      if f_parameter.FAR_estimation{2}(3,1)==1 
                          Edi=zeros(size(Ed));
                          Fdi=zeros(size(Fd));
                          if f_parameter.Uncertainty{1}(5)==1
                              for iter=1:f_parameter.Uncertainty{1}(6)
                                  Edi_=rn(iter)*Edu{iter};
                                  Edi=Edi+Edi_;
                              end
                          end
                          if f_parameter.Uncertainty{1}(6)==1
                              for iter=1:f_parameter.Uncertainty{1}(6)
                                  Fdi_=rn(iter)*Fdu{iter};
                                  Fdi=Fdi+Fdi_;
                              end
                          end
                      end

                    
                   elseif size(f_parameter.Uncertainty,2)==8 % if it is parameter uncertainty
                    
                        % get parameter uncertaity matrix of each related matrix A or B or C or Ed or Fd
                        Ai=zeros(size(A));
                        Bi=zeros(size(B));
                        Ci=zeros(size(C));
                        Di=zeros(size(C,1),size(B,2));
                        if f_parameter.Uncertainty{1}(1)==1 % Ai
                           if f_parameter.Uncertainty{2}(1)==1 % uniform distribution
                               for i=1:f_parameter.Sys_dim(1)
                                   for j=1:f_parameter.Sys_dim(1)
                                       Ai(i,j)= Au{i,j}(1)+ (Au{i,j}(2)-Au{i,j}(1)).*rand(1);
                                   end
                               end  
                           elseif f_parameter.Uncertainty{2}(1)==2 % normal distribution
                               for i=1:f_parameter.Sys_dim(1)
                                  for j=1:f_parameter.Sys_dim(1)
                                      Ai(i,j)= Au{i,j}(1)+ (Au{i,j}(2)-Au{i,j}(1)).*randn(1);
                                  end
                              end     
                           end
                        end
                        if f_parameter.Uncertainty{1}(2)==1 % Bi
                            if f_parameter.Uncertainty{2}(2)==1 % uniform distribution
                               for i=1:f_parameter.Sys_dim(1)
                                   for j=1:f_parameter.Sys_dim(2)
                                       Bi(i,j)= Bu{i,j}(1)+ (Bu{i,j}(2)-Bu{i,j}(1)).*rand(1);
                                   end
                               end  
                           elseif f_parameter.Uncertainty{2}(2)==2 % normal distribution
                               for i=1:f_parameter.Sys_dim(1)
                                  for j=1:f_parameter.Sys_dim(2)
                                      Bi(i,j)= Bu{i,j}(1)+ (Bu{i,j}(2)-Bu{i,j}(1)).*randn(1);
                                  end
                              end     
                           end
                        end
                        if f_parameter.Uncertainty{1}(3)==1 % Ci
                            if f_parameter.Uncertainty{2}(3)==1 % uniform distribution
                               for i=1:f_parameter.Sys_dim(3)
                                   for j=1:f_parameter.Sys_dim(1)
                                       Ci(i,j)= Cu{i,j}(1)+ (Cu{i,j}(2)-Cu{i,j}(1)).*rand(1);
                                   end
                               end  
                           elseif f_parameter.Uncertainty{2}(3)==2 % normal distribution
                               for i=1:f_parameter.Sys_dim(3)
                                  for j=1:f_parameter.Sys_dim(1)
                                      Ci(i,j)= Cu{i,j}(1)+ (Cu{i,j}(2)-Cu{i,j}(1)).*randn(1);
                                  end
                              end     
                           end
                        end
                        
                        if f_parameter.Uncertainty{1}(4)==1 % Di
                            if f_parameter.Uncertainty{2}(4)==1 % uniform distribution
                               for i=1:f_parameter.Sys_dim(3)
                                   for j=1:f_parameter.Sys_dim(2)
                                       Di(i,j)= Du{i,j}(1)+ (Du{i,j}(2)-Du{i,j}(1)).*rand(1);
                                   end
                               end  
                           elseif f_parameter.Uncertainty{2}(4)==2 % normal distribution
                               for i=1:f_parameter.Sys_dim(3)
                                  for j=1:f_parameter.Sys_dim(2)
                                      Di(i,j)= Du{i,j}(1)+ (Du{i,j}(2)-Du{i,j}(1)).*randn(1);
                                  end
                              end     
                           end
                        end
                        
                        % there are uncertainty and disturbance the same time
                        if f_parameter.FAR_estimation{2}(3,1)==1 
                            Edi=zeros(size(Ed));
                            Fdi=zeros(size(Fd));
                            if f_parameter.Uncertainty{1}(5)==1 %Edi
                               if f_parameter.Uncertainty{2}(5)==1 % uniform distribution
                                   for i=1:f_parameter.Sys_dim(1)
                                       for j=1:f_parameter.Sys_dim(4)
                                           Edi(i,j)= Edu{i,j}(1)+ (Edu{i,j}(2)-Edu{i,j}(1)).*rand(1);
                                       end
                                   end  
                               elseif f_parameter.Uncertainty{2}(5)==2 % normal distribution
                                   for i=1:f_parameter.Sys_dim(1)
                                      for j=1:f_parameter.Sys_dim(4)
                                          Edi(i,j)= Edu{i,j}(1)+ (Edu{i,j}(2)-Edu{i,j}(1)).*randn(1);
                                      end
                                   end     
                               end
                            end
                            if f_parameter.Uncertainty{1}(6)==1 %Fdi
                               if f_parameter.Uncertainty{2}(6)==1 % uniform distribution
                                   for i=1:f_parameter.Sys_dim(3)
                                       for j=1:f_parameter.Sys_dim(4)
                                           Fdi(i,j)= Fdu{i,j}(1)+ (Fdu{i,j}(2)-Fdu{i,j}(1)).*rand(1);
                                       end
                                   end  
                               elseif f_parameter.Uncertainty{2}(6)==2 % normal distribution
                                   for i=1:f_parameter.Sys_dim(3)
                                      for j=1:f_parameter.Sys_dim(4)
                                          Fdi(i,j)= Fdu{i,j}(1)+ (Fdu{i,j}(2)-Fdu{i,j}(1)).*randn(1);
                                      end
                                  end     
                               end
                            end
                        end
                   end   
               
                %if the custom load the polytopic uncertainty
                elseif c_parameter.Choice(3,3)==1 && c_parameter.Choice(3,1)==1 
                    % get polytopic uncertaity matrix of each related matrix A or B or C or Ed or Fd
                    rn = rand(rnc,1);
                    rn_sum=sum(rn);
                    rn=rn/rn_sum;
                    Ai=zeros(size(A));
                    Bi=zeros(size(B));
                    Ci=zeros(size(C));
                    Di=zeros(size(C,1),size(B,2));

                    if isempty(c_parameter.Poly_uncertainty{1})==0 % the uncertainty of A is not empty
                       for iter=1:rnc
                           Ai_=rn(iter)*Au{iter};
                           Ai=Ai+Ai_;
                       end
                    end
                    if isempty(c_parameter.Poly_uncertainty{2})==0 % the uncertainty of B is not empty
                       for iter=1:rnc
                           Bi_=rn(iter)*Bu{iter};
                           Bi=Bi+Bi_;
                       end
                    end
                    if isempty(c_parameter.Poly_uncertainty{3})==0 % the uncertainty of C is not empty
                       for iter=1:rnc
                           Ci_=rn(iter)*Cu{iter};
                           Ci=Ci+Ci_;
                       end
                    end
                    if isempty(c_parameter.Poly_uncertainty{4})==0 % the uncertainty of D is not empty
                       for iter=1:rnc
                           Di_=rn(iter)*Du{iter};
                           Di=Di+Di_;
                       end
                    end
                
                
                    % there are uncertainty and disturbance the same time
                    if f_parameter.FAR_estimation{2}(3,1)==1 
                       Edi=zeros(size(Ed));
                       Fdi=zeros(size(Fd));
                       if isempty(c_parameter.Poly_uncertainty{5})==0 % the uncertainty of Ed is not empty
                          for iter=1:rnc
                              Edi_=rn(iter)*Edu{iter};
                              Edi=Edi+Edi_;
                          end
                       end 
                       if isempty(c_parameter.Poly_uncertainty{6})==0 % the uncertainty of Fd is not empty
                          for iter=1:rnc
                              Fdi_=rn(iter)*Fdu{iter};
                              Fdi=Fdi+Fdi_;
                          end
                       end
                    end
                
                   %if the custom load the parameter uncertainty
                   elseif c_parameter.Choice(3,3)==1 && c_parameter.Choice(3,2)==1 
                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
                end
            end
            
            
            % if there is the case: only with disturbances
            if f_parameter.FAR_estimation{2}(1,1)==1
                
                %%input signal 
                if indicator==1; % the input dignal is defined in the colum way
                   input=[u d];
                elseif indicator==0; % the input dignal is defined in the row way
                   input=[u;d]; 
                end
                    
                [f, J] = MBFAR_eachsample(sysd,input,t,f_parameter,indicator);
                far_d(is)=f;
                J_th_d(is)=J;
            end
                
            % if there is the case: only with uncertainty
            if f_parameter.FAR_estimation{2}(2,1)==1
               %Di=zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2)); 
               
               % if the custom uses the GUI to type into the observer gain matrix
               % and post filter
               if c_parameter.Choice(4,2)==1
                  % Get observer gain matrix L
                  if f_parameter.Residual{1}(2)==1  % Unite solution
                        
                     % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi;Bi-L*Di];
                     C_bar=[V*Ci V*C];
                     Frd_bar=V*Di;
                     sysu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  else % not unit solution, kalman filter or given L
                      
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi;Bi-L*Di];
                     C_bar=[Ci C];
                     Frd_bar=Di;
                     sysu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  end

                % if the custom uses the loading observer function
              elseif c_parameter.Choice(4,1)==1
            
                  if isfield(c_parameter,'Filter')==1 % there is one post filter
                      
                     % get dynamic system, based on Prof. Ding's book, section 9.4.1 'model...'
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi;Bi-L*Di];
                     C_bar=[V*Ci V*C];
                     Frd_bar=V*Di;
                     sysu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  else

                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi;Bi-L*Di];
                     C_bar=[Ci C];
                     Frd_bar=Di;
                     sysu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  end
              end
                
                [f, J] = MBFAR_eachsample(sysu,u,t,f_parameter,indicator);
                far_u(is)=f;
                J_th_u(is)=J;
            end
            
            % if there is the case: with disturbances and uncertainty
            if f_parameter.FAR_estimation{2}(3,1)==1
                
               %Di=zeros(f_parameter.Sys_dim(3),f_parameter.Sys_dim(2));
                
               %%input signal 
                if indicator==1; % the input dignal is defined in the colum way
                   input=[u d];
                elseif indicator==0; % the input dignal is defined in the row way
                   input=[u;d]; 
                end

               % if the custom uses the GUI to type into the observer gain matrix
               % and post filter
               if c_parameter.Choice(4,2)==1
                  % Get observer gain matrix L
                  if f_parameter.Residual{1}(2)==1  % Unite solution
                        
                     % get dynamic system, based on Prod. Ding's book, section 9.4.1 'model...'
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi Ed+Edi;Bi (Ed+Edi)-L*(Fd+Fdi)];
                     C_bar=[V*Ci V*C+V*Ci];
                     Frd_bar=[V*Di V*Fd+V*Fdi];
                     sysdu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  else % not unit solution, kalman filter or given L
                      
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi Ed+Edi;Bi (Ed+Edi)-L*(Fd+Fdi)];
                     C_bar=[Ci C+Ci];
                     Frd_bar=[Di Fd+Fdi];
                     sysdu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  end

                % if the custom uses the loading observer function
              elseif c_parameter.Choice(4,1)==1
            
                  if isfield(c_parameter,'Filter')==1 % there is one post filter
                      
                     % get dynamic system, based on Prod. Ding's book, section 9.4.1 'model...'
                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi Ed+Edi;Bi (Ed+Edi)-L*(Fd+Fdi)];
                     C_bar=[V*Ci V*C+V*Ci];
                     Frd_bar=[V*Di V*Fd+V*Fdi];
                     sysdu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  else

                     A_bar=[A+Ai zeros(size(A)); Ai-L*Ci A-L*C];
                     Erd_bar=[B+Bi Ed+Edi;Bi (Ed+Edi)-L*(Fd+Fdi)];
                     C_bar=[Ci C+Ci];
                     Frd_bar=[Di Fd+Fdi];
                     sysdu=ss(A_bar,Erd_bar,C_bar,Frd_bar,Ts);
                  end
               end

              
               [f, J] = MBFAR_eachsample(sysdu,input,t,f_parameter,indicator);
               far_du(is)=f;
               J_th_du(is)=J;
            end
        end
        
        if ishandle(H)
           delete(H);
        end
        
        % if there is the case: only with disturbances
        if f_parameter.FAR_estimation{2}(1,1)==1
           far=mean(far_d); 
           J_th=max(J_th_d);
        end
        % if there is the case: only with uncertainty
        if f_parameter.FAR_estimation{2}(2,1)==1
            far=[far mean(far_u)];
            J_th=[J_th max(J_th_u)];
        end
        % if there is the case: with disturbances and uncertainty
        if f_parameter.FAR_estimation{2}(3,1)==1
            far=[far mean(far_du)];
            J_th=[J_th max(J_th_du)];
        end
        
        % final FAR and Jth
        Pro=f_parameter.FAR_estimation{2}(:,2)';
        Pro(:,all(Pro==0,1))=[];
        FAR=Pro*far'/100;
        Jth=max(J_th);







end
