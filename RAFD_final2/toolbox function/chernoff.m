function [Idx] = chernoff(conf_level,accuracy,side_idx)
% chernoff: calculate the trial number by chernoff bound
%           for any 0<a<1 and 0<b<1, if N>=1/(2a^2)*ln(2/b) then, with
%           probability greater than 1-b, we have |p_N(c)-p(c)|<a.
% 
% Call:
%           [Idx] = chernoff(perlevel,accuracy)
% 
% Inputs: 
%         conf_level  - performance level / confidence (0<perlevel<1)
%           accuracy  - fixed accuracy (0<accuracy<1)
%           side_idx  - 1 one-side bound; 2 two-side bound
%
% Output:
%           Idx  - trial number
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

% -------------------------------------------------------------------------

switch side_idx
    case 1
        Idx = 1/(2*accuracy^2)*log(1/conf_level);
    case 2
        Idx = 1/(2*accuracy^2)*log(2/conf_level); 
end
Idx = floor(Idx)+1;