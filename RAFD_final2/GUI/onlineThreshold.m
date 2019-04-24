function [Jth,FAR]=onlineThreshold(epsilon,delta,J0,iteration,sample)
% onlineThreshold: online threshold calculation
%           
% Call:
%        [Jth,FAR] = onlineThreshold(epsilon,delta,J0,iteration,sample)
%
% Inputs:
%           epsilon - given accuracy
%             delta - 1-confidence level
%                J0 - initial threshold
%         iteration - iteration tolerance
%            sample - sample size
% Outputs: 
%              Jth - threshold
%              FAR - false alarm rate
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
Jth = J0;

