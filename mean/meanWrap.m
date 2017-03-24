function mu = meanWrap(type, hypMean, yd)
% meanWrap: A wrapper function for calling required mean function
%
% Inputs: - type - struct specifying the type of mean function to be
%           used
%         - hypMean - the mean functions only hyper parameter (the constant)
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector

% Zero mean
if strcmp(type(1).Mean, 'meanZero')
    meanZero = str2func(type(1).Mean);
    mu = meanZero(yd); 
% Constant mean
elseif strcmp(type(1).Mean, 'meanConst')
    meanConst = str2func(type(1).Mean);
    mu = meanConst(hypMean, yd);
% Arithmetic mean
elseif strcmp(type(1).Mean, 'meanArith')
    meanArith = str2func(type(1).Mean);
    mu = meanArith(yd);
% Report errors
else
    error('type(1).Mean must be a string equal to either "meanZero", "meanConst" or "meanArith')
end

end
