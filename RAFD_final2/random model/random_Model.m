function [A,B,C,D] = random_Model(N,ni,no,method)
%   Function 'random_Model' is to generate random system  both continuous and 
%   discerte system, Generate randomized state-space models. 
%   The poles of SYS are random and stable with the possible exception
%   of poles at s=0 (integrators).
%
%   Declaration about the instructions for users.
%
%   Call:
%   SYS = random_Model( N,ni,no,method )
%
%   Inputs: [ N,ni,no,method ]
%   N           - the oder of the random system 
%   ni          - the number of the inputs
%   no          - the number of the outputs  
%   method      - the slection of random algorithm
%
%   Outputs:  SYS
%   SYS         - randomized state-space models
%
%   The number of input variables can be 1,2,3 or 4
%
%   When just a input variable  
%   for example: random_Model( N ) then the default value is 
%   ni=1, no=1 and method=1
%
%   When there are two input variables 
%   for example: random_Model( N,ni ) then the default value is 
%   no=1 and method=1
%
%   When there are three input variables 
%   for example: random_Model( N,ni,no ) then the default value is 
%   method=1
%
%   When there are four input variables, every variable is set by user
%   but to be point out the value of 4 inputs should bigger than 0 ( N>0,ni>0,no>0,method>0 )
%   for example: random_Model( N,ni,no,method )
%
%
%   Version 1.0
%
%   The function is eidt by Peifeng LIU


switch method

       case 1
           [A,B,C,D] = random_Sys_d2(N,ni,no);
           %SYS = ss(A,B,C,D);
%          disp(41);
       case 2
           [A,B,C,D] = random_Sys_d(N,ni,no);
           %SYS = ss(A,B,C,D);
%          disp(42);
       case 3
           SYS = drss( N,no,ni);  %% system function
           A=SYS.A;
           B=SYS.B;
           C=SYS.C;
           D=SYS.D;
           
%          disp(43);
       otherwise
           error('The randomized function which you called is not found');

end