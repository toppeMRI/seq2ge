function [rfOut, ttOut] = rf2pulseq(rf, rasterIn, rasterOut, sys)
% function [rfOut, ttOut] = rf2pulseq(rf, rasterIn, rasterOut)
%
% Convert rf waveform from Gauss to Hz, and interpolate to rasterOut
%
% Inputs
%   rf            [n 1]   RF waveform, Gauss
%   rasterIn      [1]     Input waveform raster time (sec)
%   rasterOut     [1]     Output waveform raster time (sec)
%
% Output
%   rfOut         [m 1]   RF waveform, Hz
%   ttOut         [m 1]   Output waveform sample times (sec)

% Di Cui: adapting for MNS
if ~exist('sys','var')
    gamma = 4.2576e3;       % Hz/G
else
    gamma = sys.gamma*1e-4;
end
  
rf = rf*gamma;     

dur = numel(rf)*rasterIn;  
ttIn = (1:length(rf))*rasterIn - rasterIn/2;
ttOut = rasterOut/2:rasterOut:dur;

rfOut = interp1(ttIn, rf, ttOut, 'linear', 'extrap');

% return column vectors
rfOut = rfOut(:);   
ttOut = ttOut(:);   
